package org.simi.api.service;

import java.util.Map;

import net.sf.json.JSONObject;

import org.simi.api.service.dao.impl.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
	
	@Autowired
	private UserDao userDao;
	 public  Map<String, String> userRegister(JSONObject user){
		 
		 Boolean resultBoolean = false;
		 userDao.userRegister(user);
		 return null;
		
	}
}
