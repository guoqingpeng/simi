package org.simi.api;

import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;

import org.simi.api.service.UserService;
import org.simi.utils.PastUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
		JSONObject user =new JSONObject();
		
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
   public ModelAndView userRegister(@RequestParam("userInfo")String userInfo){
	   JSONObject user = JSONObject.fromObject(userInfo);
	   /**
		 * 测试一个用户注册数据
		 */
		user.put("name","zhangsan");
		user.put("age","12");
		user.put("job","it");
		user.put("height","17");
		user.put("sanwei", "gh");
		user.put("company","baidu");
		user.put("xinzuo","shuipin");
		user.put("weibo","wwww.c.com");
		user.put("weixin","aaa");
		user.put("hobby","aaass");
		user.put("nickName","asas");
		user.put("anouncement", "ad");
		
		userService.userRegister(user);
		JSONObject ret = new JSONObject();
		ret.put("ret", true);
		ret.put("errmsg", "");
		Map<String, String> dataMap = new HashMap<String, String>();
		dataMap.put("id", "122");
		ret.put("data", dataMap);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("config",PastUtil.getWxConfig());
		modelAndView.setViewName("/personal");
		return modelAndView;
		
	 //   return ret;
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
        modelAndView.setViewName("/upLoad");
        return modelAndView;
    }
    
}
