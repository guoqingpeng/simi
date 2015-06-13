package org.simi.api;

import org.simi.utils.PastUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user")
public class UserControlller {
	
	/**
	 * 注册页面初始化
	 * @return
	 */
	@RequestMapping(value = "/reg", method = RequestMethod.GET)
	public ModelAndView loginInit(){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("config",PastUtil.getWxConfig());
		modelAndView.setViewName("/register");
		return modelAndView;
	}

    @RequestMapping(value = "/personal", method = RequestMethod.GET)
    public ModelAndView personalInit(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("config",PastUtil.getWxConfig());
        modelAndView.setViewName("/personal");
        return modelAndView;
    }

    @RequestMapping(value = "/upload", method = RequestMethod.GET)
    public ModelAndView personalInit(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("config",PastUtil.getWxConfig());
        modelAndView.setViewName("/upload");
        return modelAndView;
    }
    
    
    
}
