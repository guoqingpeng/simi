package org.simi.api;

import net.sf.json.JSONObject;

import org.simi.api.service.UserService;
import org.simi.utils.PastUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
		JSONObject user =null;
		   userService.userRegister(user);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("config",PastUtil.getWxConfig());
		modelAndView.setViewName("/register");
		return modelAndView;
	}
	
	/**
	 * 用户注册
	 * @param userInfo
	 * @return
	 */
   public JSONObject userRegister(@RequestParam("userInfo")String userInfo){
	   JSONObject user = JSONObject.fromObject(userInfo);
	   userService.userRegister(user);
	   return null;
	
	   
}
	
	/**
	 * 个人主页初始化页面
	 * @return
	 */
    @RequestMapping(value = "/personal", method = RequestMethod.GET)
    public ModelAndView personalInit(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("config",PastUtil.getWxConfig());
        modelAndView.setViewName("/personal");
        return modelAndView;
    }

    @RequestMapping(value = "/uploadfile", method = RequestMethod.GET)
    public ModelAndView uploadInit(){
        ModelAndView modelAndView = new ModelAndView();
        System.out.println(PastUtil.getWxConfig().toString());
        modelAndView.addObject("config",PastUtil.getWxConfig());
       
        modelAndView.setViewName("/upload");
        return modelAndView;
    }
    
}
