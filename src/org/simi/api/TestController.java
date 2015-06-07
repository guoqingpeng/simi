package org.simi.api;

import java.util.HashMap;
import java.util.Map;

import org.simi.utils.PastUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/config")
public class TestController {

	@RequestMapping(value = "/getConfig", method = RequestMethod.GET)
	public ModelAndView showIt() {
		String p = PastUtil.getParam("wx0738861136c0affb", "942a42d4ee8b21163ee54cddad1ccf02");
		Map<String, String>  map = new HashMap<String, String>();
		map = PastUtil.sign(p, PastUtil.getUrl());
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("config",map);
		modelAndView.setViewName("/common");
		return modelAndView;
	}
}
