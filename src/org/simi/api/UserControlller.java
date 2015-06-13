package org.simi.api;

import java.util.Map;

import net.sf.json.JSONObject;

import org.simi.api.service.UserService;
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
     * 初始化文档上传的页面
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
    * 个人首页数据检索，根据用户id检索一下信息
    * 基本信息
    * 图片列表
    * 音频信息
    */
   @RequestMapping(value = "/userInfo", method = RequestMethod.POST)
   @ResponseBody
   public JSONObject searchUserAllInfo(@RequestBody JSONObject userid){
	   
	    JSONObject ret = new JSONObject();
	    
	    String userId = userid.getString("id");
	    //基本信息
	    Map<String, String> baseInfo = userService.getUserBaseInfo(userId);
	    ret.put("baseInfo", baseInfo);
	    
	    //图片列表
	    
	    //音频信息
	    
	    //ret = userService.saveFiles(files);
	    return ret;
	   
	   
   }
   
}
