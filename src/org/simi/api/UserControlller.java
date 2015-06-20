package org.simi.api;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.simi.api.service.UserService;
import org.simi.utils.FileUtil;
import org.simi.utils.PastUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user")
public class UserControlller {
	
	@Autowired
	private UserService userService;
	
	/**
	 * 注册页面初始化
	 * 
	 * @return
	 */
	@RequestMapping(value = "/regInit", method = RequestMethod.GET)
	public ModelAndView loginInit(){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("config",PastUtil.getWxConfig());
		modelAndView.setViewName("/register");
		return modelAndView;
	}
	
	/**
	 * 用户注册
	 * 
	 * @param userInfo
	 * @return 返回注册信息
	 */
   @RequestMapping(value = "/reg", method = RequestMethod.POST)
   @ResponseBody
   public JSONObject userRegister(@RequestBody JSONObject userInfo){
	   
	    JSONObject ret = new JSONObject();
	    ret=  userService.userRegister(userInfo);
		return ret;
		
   }
	
	/**
	 * 个人主页初始化页面
	 * 
	 * @return
	 */
    @RequestMapping(value = "/personalInit", method = RequestMethod.GET)
    public ModelAndView personalInit(){
    	
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("config",PastUtil.getWxConfig());
        modelAndView.setViewName("/personal");
        return modelAndView;
        
    }
    
	/**
	 * 首页跳转初始化
	 * 
	 * @return
	 */
    @RequestMapping(value = "/mainInit", method = RequestMethod.GET)
    public ModelAndView mainInit(){
    	
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("config",PastUtil.getWxConfig());
        modelAndView.setViewName("/index");
        return modelAndView;
        
    }
    
    
    
    
    
    /**
	 * 初始化图片和音频上传的页面
	 * 
	 * @return
	 */
    @RequestMapping(value = "/uploadInit", method = RequestMethod.GET)
    public ModelAndView uploadInit(){
    	
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("config",PastUtil.getWxConfig());
        modelAndView.setViewName("/upLoad");
        return modelAndView;
        
    }
    
	/**
	 * 图片，文档上传
	 * 
	 * @param userInfo
	 * @return 返回注册信息
	 */
   @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
   @ResponseBody
   public JSONObject uploadFile(@RequestBody JSONObject files){
	   
	    JSONObject ret = new JSONObject();
	    ret = userService.saveFiles(files);
	    return ret;
		
   }
   
   /**
	 * 个人首页数据检索，根据用户id检索一下信息 基本信息 图片列表 音频信息
	 */
   @RequestMapping(value = "/userInfo", method = RequestMethod.POST)
   @ResponseBody
   public JSONObject searchUserAllInfo(@RequestBody JSONObject userid){
	   
	    String userId = userid.getString("id");
        Map<String, Object> allinfoMap = new HashMap<String, Object>();
        
	    // 基本信息
	    Map<String, String> baseInfo = userService.getUserBaseInfo(userId);
	    allinfoMap.put("baseInfo", baseInfo);
	    
	    // 图片列表
	    List<Object> imgList = new ArrayList<Object>();
	    imgList = userService.getUserImgs(userId);
	    allinfoMap.put("images", imgList);
	    
	    // 音频信息
	    Map<String, String> voice = new HashMap<String, String>();
	    voice = userService.getUserVoice(userId);
	    allinfoMap.put("voice", voice);
	    JSONObject ret = new JSONObject();
	    ret.put("ret", true);
	    ret.put("errmsg", "");
	    ret.put("data", allinfoMap);
	    return ret;
   }
   
   /**
	 * 以流的方式展示图片
	 * @param request
	 * @param response
	 * @param file
	 * @param userId
	 * @throws IOException
	 */
   @RequestMapping(value = "file",method= RequestMethod.GET)
   public void viewFile(HttpServletRequest request,
		                HttpServletResponse response,
		                String file,
		                String userId) throws IOException{
	  System.out.println("请求图片");
	   //禁止缓存
	   response.setHeader("Pragma", "No-cache");
	   response.setHeader("Cache-Control", "No-cache");
	   response.setDateHeader("Expires", 0);
	   //指定生成的响应是图片
	   response.setContentType("image/jpeg");
	   FileInputStream fis = null; 
       OutputStream os = null; 
       try {
        fis = new FileInputStream(FileUtil.FILE_SAVE_PATH+userId+"\\"+file);
        os = response.getOutputStream();
           int count = 0;
           byte[] buffer = new byte[1024*8];
           while ( (count = fis.read(buffer)) != -1 ){
            os.write(buffer, 0, count);
            os.flush();
           }
       }catch(Exception e){
        e.printStackTrace();
       }finally {
           try {
        	   if (fis !=null) {
        		   fis.close();
			    }
        	   if (os !=null) {
        		    os.close();
			    }
				} catch (IOException e) {
				e.printStackTrace();
				}  
       }
   }
   
   /**
    * 保存评论
    * @param comment
    * @return
    */
   @RequestMapping(value = "/commnet",method = RequestMethod.POST)
   @ResponseBody
   public JSONObject saveComment(@RequestBody JSONObject comment){
	   
	   JSONObject ret = new JSONObject();
	   ret = userService.saveComment(comment);
	   return ret;
	   
   }
   
   /**
    * 获取用户的评论列表
    * @param comment
    * @return
    */
   @RequestMapping(value = "/comList",method = RequestMethod.POST)
   @ResponseBody
   public JSONObject commentlist(@RequestBody JSONObject comment){
	   
	    String userId = comment.getString("id");
	    JSONObject ret = new JSONObject();
	    List<Object> comList = userService.getUserCommnets(userId);
	    ret.put("ret", true);
		ret.put("errmsg", "");
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("comments", comList);
		ret.put("data", dataMap);
	   return ret;
	   
   }
   
   
   /**
    * 如果没有重复赞，则返回赞的总数
    * 如果重复赞了，则返回错误信息
    * @param zan
    * @return
    */
   @RequestMapping(value = "/praise",method = RequestMethod.POST)
   @ResponseBody
   public JSONObject saveZan(@RequestBody JSONObject zan){

	   JSONObject ret = new JSONObject();
	   ret = userService.saveZan(zan);
	   return ret;
	   
   }
   
	/**
	 * 用户列表乘务/非乘务页面初始化
	 * 
	 * @return
	 */
	@RequestMapping(value = "/userListInit", method = RequestMethod.GET)
	public ModelAndView userListInit(){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("config",PastUtil.getWxConfig());
		modelAndView.setViewName("/crewList");
		return modelAndView;
	}
   
   /**
    * 根据用户类型，返回乘务/非乘务列表数据
    * @param type
    * @return
    */
   @RequestMapping(value = "/uList",method = RequestMethod.POST)
   @ResponseBody
   public JSONObject searchUserListByType(@RequestBody JSONObject obj){
	   //获取用户的列表
	   JSONObject ret = new JSONObject();
	   String type = obj.getString("type");
	   int page = obj.getInt("page");
	   List<Map<String, Object>> users = new ArrayList<Map<String,Object>>();
	   users = userService.getUserList(type, page);
	   Map<String, Object> datas= new HashMap<String, Object>();
	   datas.put("uList",users);
	   ret.put("ret", true);
	   ret.put("data", datas);
	   System.out.println(ret);
	   return ret;
   }
   
}
