package org.simi.api.service;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONObject;

import org.simi.api.service.dao.impl.QuestionDao;
import org.simi.api.service.dao.impl.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QuestionService {
	
	@Autowired
	private QuestionDao questionDao;
	   
	   /**
	    * 用户对问题的回复
	    * @param user
	    * @return
	    */
	   public  JSONObject saveReply(JSONObject comment){
			 
		    //回复者id
		    String userId = comment.getString("userId");
		    
		    //问题id
		    int questionId = comment.getInt("questionId");
		    
		    //回复的内容
		    String reply = comment.getString("reply");
		    
		    JSONObject ret = new JSONObject();
		    questionDao.saveReply(reply, questionId, userId);
			ret.put("ret", true);
			return ret;
			
		}
	   
	   /**
	    * 获取当前问题下的所有的回复
	    * @param userId
	    * @return
	    */
	   public List<Object> getReplys(String questionId){
		   List<Object> queList = new ArrayList<Object>();
		   queList = questionDao.getReplys(questionId);
		   return queList;
	   }
	   
	   /**
	    * 获取问题名称
	    * @param id
	    * @return
	    */
	   public String getQuestionName(String  id){
		   
		   return questionDao.getQuestionNameById(id);
		   
	   }
}