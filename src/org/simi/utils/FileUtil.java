package org.simi.utils;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.net.URL;

public class FileUtil {
	
	//配置公共文件的服务器保存路径
	public static String FILE_SAVE_PATH = "E:\\files\\";
	
	//配置公共的请求
	public static String FILE_SERVER_PATH = "/simi/user/file.do?file=";
	
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
		      String fileName = FILE_SAVE_PATH+userId+"\\";
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
		  
		    }  
		    catch (Exception e) {  
		      e.printStackTrace();  
		    }  
		return FILE_SERVER_PATH+stuffix+"&userId="+userId;
	}
	
	/**
	 * 将文件写到url中
	 * @param fileUrl
	 */
	public static void upLoadFileToUrl(String fileUrl){
		
		
		
	}

}
