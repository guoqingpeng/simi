package org.simi.api;

import java.util.HashMap;
import java.util.Map;

import org.simi.utils.PastUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * 获取微信的接入配置，并且缓存起来
 * @author daiying.zhang
 *
 */
@Controller
@RequestMapping("/config")
public class WeixinConfigController {

	/**
	 * 获取微信接入许可
	 * @return
	 */
	@RequestMapping(value = "/getConfig", method = RequestMethod.GET)
	public ModelAndView showIt() {
		Map<String, String>  map = new HashMap<String, String>();
		map = PastUtil.getWxConfig();
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("config",map);
		modelAndView.setViewName("/common");
		return modelAndView;
	}
}