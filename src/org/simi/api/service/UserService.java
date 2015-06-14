package org.simi.api.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.simi.api.service.dao.impl.UserDao;
import org.simi.utils.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
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
	 
	 /**
	  * 保存图片到本地服务器，保存路径数据到数据库
	  * @param files
	  * @return
	  */
	 public  JSONObject saveFiles(JSONObject files){
		    
	    //获取用户id
	    String  userId = files.getString("id");
	    
	    //获取图片列表
	    JSONArray  picsArray = files.getJSONArray("images");
	    
	    //图片路径保存在本地服务器以及创建文件
	    for (Object object : picsArray) {
	    	String localPath = FileUtil.downLoadFileFromUrl(userId, object.toString(),1);
			userDao.savePicFile(userId,localPath,object.toString());
		}
	    
	    JSONObject vioce = files.getJSONObject("voice");
	    System.out.println("音频"+vioce.get("url"));
	    
	    //音频路径保存在本地服务器以及创建文件
	    String localVoicePaht = FileUtil.downLoadFileFromUrl(userId, vioce.get("url").toString(),2);
	    userDao.saveVoiceFile(userId, localVoicePaht,vioce.get("url").toString(), vioce.get("id").toString());
	    
		JSONObject ret = new JSONObject();
		ret.put("ret", true);
		ret.put("errmsg", "");
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("id", userId);
		ret.put("data", dataMap);
		return ret;
		
	  }
	 
	 /**
	  * 获取用户的基本信息
	  * @param userId
	  * @return
	  */
	   public Map<String, String> getUserBaseInfo(String userId){
		   
		   Map< String, String> userInfoMap = new HashMap<String, String>();
		   userInfoMap = userDao.getUserInfoById(userId);
		   return userInfoMap;
		   
	   }
	   
	   /**
	    * 获取用户关联的所有的图片
	    * @param userId
	    * @return
	    */
	   public List<Object> getUserImgs(String userId){
		   
		   List<Object> imgList = new ArrayList<Object>();
		   imgList = userDao.getUserImgs(userId);
		   return imgList;
		   
	   }
	   
	   /**
	    * 获取用户的音频信息 
	    * @param userId
	    * @return
	    */
	   public Map<String, String> getUserVoice(String userId){
		   
		   Map< String, String> voice = new HashMap<String, String>();
		   voice = userDao.getUserVoiceById(userId);
		   return voice;
		   
	   }
	   
	   /**
	    * 获取用户下关联的所有的评论
	    * @param userId
	    * @return
	    */
	   public List<Object> getUserCommnets(String userId){
		   
		   List<Object> comList = new ArrayList<Object>();
		   comList = userDao.getUsercommnets(userId);
		   return comList;
		   
	   }
	   
	   /**
	    * 获取用户的所有点赞数
	    * @param userId
	    * @return
	    */
	   public int getUserZanCount(String userId){
		   
		   int dianzanCount =0 ;
		   dianzanCount = userDao.getDianzanCountByUserId(userId);
		   return dianzanCount;
		   
	   }
	   
	   /**
	    * 保存用户的评论
	    * @param user
	    * @return
	    */
	   public  JSONObject saveComment(JSONObject comment){
			 
		    //评论者id
		    String commentUser = comment.getString("commentUser");
		    //被评论者id
		    String beCommentedUser = comment.getString("beCommentedUser");
		    //评论的内容
		    String content = comment.getString("content");
		    JSONObject ret = new JSONObject();
		    userDao.saveCommnet(commentUser, beCommentedUser, content);
			ret.put("ret", true);
			return ret;
		}
	    
	   
	   
}
