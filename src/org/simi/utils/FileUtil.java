package org.simi.utils;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.imageio.ImageIO;

import net.sf.json.JSONObject;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

public class FileUtil {

	//配置公共文件的服务器保存路径
	public static String FILE_SAVE_PATH = "/home/default/files/";
	
	//配置公共的请求
	public static String FILE_SERVER_PATH = "/simi/user/file.do?file=";
	
	public static  int SIZE = 640;
	
	String result = "";
	String end="\r\n";
	String twoHyphens = "--"; //用于拼接
	String boundary="*****"; //用于拼接 可自定义
	URL submit = null;
	JSONObject json=null;
	
	 private Image img;  
	 private int width;  
	 private int height;
	
	/**
	 * 从微信服务器下载文件
	 * @param filePath
	 * @return
	 */
	public  static String downLoadFileFromUrl(String userId,String filePath,int type) {
		
		String localPath =null;
		String stuffix =null;
		try {  
		      URL url = new URL(filePath);  
		      java.io.BufferedInputStream bis = new BufferedInputStream(url.openStream());  
		      byte[] bytes = new byte[100];
		      String fileName = FILE_SAVE_PATH+userId+"/";
		      File folder = new File(fileName);
		      
		      if (!folder.isDirectory()) {
		    	  folder.mkdir();
		      }
		      
		      stuffix = System.currentTimeMillis()+"";
		      //判断文件类型是图片还是音频
		      if(type ==1){
		    	  stuffix+=".jpg";
		      }else {
		    	  stuffix+=".amr";
			  }
		      
		      //文件在服务器的请求路径
		      localPath=fileName+stuffix;
		      File newFile = new File(localPath);
		      OutputStream bos = new FileOutputStream(newFile);  
		      int len;  
		      while ( (len = bis.read(bytes)) > 0) {  
		        bos.write(bytes, 0, len);  
		      }  
		      bis.close();  
		      bos.flush();  
		      bos.close();
		      
		      //如果是，则将图片按照宽度等比缩放
		      if(type ==1){
		    	  FileUtil imgCom = new FileUtil(localPath);  
			      imgCom.resizeFix(SIZE, SIZE,localPath); 
		      }
		    }  
		    catch (Exception e) {  
		      e.printStackTrace();  
		    }  
		    
		return FILE_SERVER_PATH+stuffix+"&userId="+userId;
	}
	
	/**
	* 上传文件 以输出流的形式把文件写入到url中，然后用输入流来获取url的响应
	* 
	* @param url 请求地址 form表单url地址
	* @param filePath 文件在服务器保存路径
	* @return String url的响应信息返回值
	* @throws IOException
	*/
	public static JSONObject upLoadFileToUrl(String url, String filePath) throws IOException {
		
		String result = null;
		File file = new File(filePath);
		
		if (!file.exists() || !file.isFile()) {
		    throw new IOException("文件不存在");
		}
		/**
		* 第一部分
		*/
		URL urlObj = new URL(url);
		// 连接
		HttpURLConnection con = (HttpURLConnection) urlObj.openConnection();
		/**
		* 设置关键值
		*/
		con.setRequestMethod("POST"); // 以Post方式提交表单，默认get方式
		con.setDoInput(true);
		con.setDoOutput(true);
		con.setUseCaches(false); // post方式不能使用缓存
	
		// 设置请求头信息
		con.setRequestProperty("Connection", "Keep-Alive");
		con.setRequestProperty("Charset", "UTF-8");
	
		// 设置边界
		String BOUNDARY = "----------" + System.currentTimeMillis();
		con.setRequestProperty("Content-Type", "multipart/form-data; boundary="+ BOUNDARY);
	
		// 请求正文信息
	
		// 第一部分：
		StringBuilder sb = new StringBuilder();
		sb.append("--"); // 必须多两道线
		sb.append(BOUNDARY);
		sb.append("\r\n");
		sb.append("Content-Disposition: form-data;name=\"file\";filename=\""
		+ file.getName() + "\"\r\n");
		sb.append("Content-Type:application/octet-stream\r\n\r\n");
	
		byte[] head = sb.toString().getBytes("utf-8");
	
		// 获得输出流
		OutputStream out = new DataOutputStream(con.getOutputStream());
		// 输出表头
		out.write(head);
	
		// 文件正文部分
		// 把文件已流文件的方式 推入到url中
		DataInputStream in = new DataInputStream(new FileInputStream(file));
		int bytes = 0;
		byte[] bufferOut = new byte[1024];
		while ((bytes = in.read(bufferOut)) != -1) {
		      out.write(bufferOut, 0, bytes);
		}
		in.close();
	
		// 结尾部分
		byte[] foot = ("\r\n--" + BOUNDARY + "--\r\n").getBytes("utf-8");// 定义最后数据分隔线
		out.write(foot);
		out.flush();
		out.close();
		StringBuffer buffer = new StringBuffer();
		BufferedReader reader = null;
		try {
		// 定义BufferedReader输入流来读取URL的响应
		reader = new BufferedReader(new InputStreamReader(con.getInputStream()));
		String line = null;
		
		while ((line = reader.readLine()) != null) {
     		buffer.append(line);
		}
		
		if(result==null){
			result = buffer.toString();
		}
		} catch (IOException e) {
		    System.out.println("发送POST请求出现异常！" + e);
		     e.printStackTrace();
		throw new IOException("数据读取异常");
		} finally {
			
			if(reader!=null){
			    reader.close();
			}
		
		}
		return JSONObject.fromObject(result);
	}
	
	 /** 
     * 构造函数 
     */  
    public FileUtil(String fileName) throws IOException {  
    	
        File file = new File(fileName);// 读入文件  
        img = ImageIO.read(file);      // 构造Image对象  
        width = img.getWidth(null);    // 得到源图宽  
        height = img.getHeight(null);  // 得到源图长  
        
    }  
    
    /** 
     * 按照宽度还是高度进行压缩 
     * @param w int 最大宽度 
     * @param h int 最大高度 
     */  
    public void resizeFix(int w, int h,String file) throws IOException {  
    	
    	/**
    	 * 宽度大于1000时才压缩
    	 */
    	if (width > 1000) {
    		resizeByWidth(w, file);
		}
    }  
    /** 
     * 以宽度为基准，等比例放缩图片 
     * @param w int 新宽度 
     */  
    public void resizeByWidth(int w,String file) throws IOException {
    	
        int h = (int) (height * w / width);
        resize(w, h,file);
        
    }  
    /** 
     * 以高度为基准，等比例缩放图片 
     * @param h int 新高度 
     */  
    public void resizeByHeight(int h,String file) throws IOException {  
        int w = (int) (width * h / height);  
        resize(w, h,file);  
    }  
 
    /**
     * 强制压缩/放大图片到固定的大小 
     * @param w
     * @param h
     * @param des
     * @throws IOException
     */
    public void resize(int w, int h,String file) throws IOException {  
        // SCALE_SMOOTH 的缩略算法 生成缩略图片的平滑度的 优先级比速度高 生成的图片质量比较好 但速度慢  
        BufferedImage image = new BufferedImage(w, h,BufferedImage.TYPE_INT_RGB );
        image.getGraphics().drawImage(img, 0, 0, w, h, null); // 绘制缩小后的图  
        File destFile = new File(file);  
        FileOutputStream out = new FileOutputStream(destFile); // 输出到文件流  
        // 可以正常实现bmp、png、gif转jpg  
        JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);  
        encoder.encode(image); // JPEG编码  
        out.close();  
    }  
 
}