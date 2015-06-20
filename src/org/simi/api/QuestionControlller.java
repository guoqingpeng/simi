package org.simi.api;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.simi.api.service.QuestionService;
import org.simi.utils.PastUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/question")
public class QuestionControlller {
	
	@Autowired
	private QuestionService questionService;
	
	
	/**
	 *问题页面初始化 
	 * @return
	 */
	@RequestMapping(value = "/askInit", method = RequestMethod.GET)
	public ModelAndView askInit(){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("config",PastUtil.getWxConfig());
		modelAndView.setViewName("/ask");
		return modelAndView;
	}
	
	/**
	 *回答页面初始化 
	 * @return
	 */
	@RequestMapping(value = "/askInfoInit", method = RequestMethod.GET)
	public ModelAndView loginInit(){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("config",PastUtil.getWxConfig());
		modelAndView.setViewName("/askInfo");
		return modelAndView;
	}
	
   /**
    * 保存回复
    * @param comment
    * @return
    */
   @RequestMapping(value = "/reply",method = RequestMethod.POST)
   @ResponseBody
   public JSONObject saveReply(@RequestBody JSONObject reply){
	   
	   JSONObject ret = new JSONObject();
	   ret = questionService.saveReply(reply);
	   return ret;
	   
   }
   
   /**
    * 获取用户的评论列表
    * @param comment
    * @return
    */
   @RequestMapping(value = "/rList",method = RequestMethod.POST)
   @ResponseBody
   public JSONObject getReplys(@RequestBody JSONObject question){
	   
	    String questionId = question.getString("id");
	    JSONObject ret = new JSONObject();
	    List<Object> comList = questionService.getReplys(questionId);
	    //获取title名称
	    String title = questionService.getQuestionName(questionId);
	    ret.put("ret", true);
		ret.put("errmsg", "");
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("replys", comList);
		dataMap.put("title", title);
		ret.put("data", dataMap);
	    return ret;
   }
}
