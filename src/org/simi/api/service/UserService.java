package org.simi.api.service;

import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.simi.api.service.dao.impl.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

@Service
public class UserService {
	
	@Autowired
	private UserDao userDao;
	
	/**
	 * 用户注册业务
	 * @param user
	 * @return
	 */
	 public  JSONObject userRegister(JSONObject user){
		 
		int id = userDao.userRegister(user);
		JSONObject ret = new JSONObject();
		ret.put("ret", true);
		ret.put("errmsg", "");
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("id", id);
		ret.put("data", dataMap);
		return ret;
	}
	 
	 public  JSONObject saveFiles(JSONObject files){
		    
	    //获取用户id
	    String  userId = files.getString("id");
	    //获取图片列表
	    JSONArray  picsArray = files.getJSONArray("images");
	    
	   //图片路径保存在本地服务器
	    for (Object object : picsArray) {
			System.out.println("图片"+object.toString());
			userDao.savePicFile(userId, object.toString());
		}
	    
	    JSONObject vioce = files.getJSONObject("voice");
	    System.out.println("音频"+vioce.get("url"));
	    
	    //音频路径保存在本地服务器
	    userDao.saveVoiceFile(userId, vioce.get("url").toString(), vioce.get("id").toString());
		JSONObject ret = new JSONObject();
		ret.put("ret", true);
		ret.put("errmsg", "");
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("id", userId);
		ret.put("data", dataMap);
		return ret;
	  }
	 
	   public Map<String, String> getUserBaseInfo(String userId){
		   
		   Map< String, String> userInfoMap = new HashMap<String, String>();
		   userInfoMap = userDao.getUserInfoById(userId);
		   return userInfoMap;
	   }
}
