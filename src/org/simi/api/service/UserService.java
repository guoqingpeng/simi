package org.simi.api.service;

import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;

import org.simi.api.service.dao.impl.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
	
	@Autowired
	private UserDao userDao;
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
}
