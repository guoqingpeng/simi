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
	    * 保存用户的赞
	    * 并且返回点赞的总数
	    * @param user
	    * @return
	    */
	   public  JSONObject saveZan(JSONObject zan){
			 
		    //点赞者唯一标识符 游客的重复赞暂时不处理
		    // String zanDeviceId = zan.getString("deviceId");
		    
		    //被赞者id
		    String beZandUser = zan.getString("beZanUserId");
		    
		    //点赞者的id
		    String zanUserId = "";
		    if(zan.containsKey("zanUserId")){
		    	zanUserId = zan.getString("zanUserId");
		    }
		    
		    JSONObject ret = new JSONObject();
		    
		    //校验是否重复点赞
		    if (!"".equals(zanUserId)&&userDao.isUserPraised(zanUserId, beZandUser)) {
				
		    	ret.put("ret", false);
				ret.put("errmsg", "你已经点赞了哦");
				return ret;
			}
		    
		    //保存点赞
		    userDao.saveDianZan(zanUserId, beZandUser, "");
		    //返回点赞总数
		    int zanCount = 0;
		    zanCount = getUserZanCount(beZandUser);
		    
		    Map<String, Object> datas = new HashMap<String, Object>();
		    
		    //点赞成功之后，给用户的身价添加10分TODO
		    datas.put("zanCount", zanCount);
		    datas.put("price", "100");
			ret.put("ret", true);
			ret.put("errmsg", "");
			ret.put("data", datas);
			return ret;
			
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
	    * 
	    * @param type
	    * @param page
	    * @return
	    */
	   public List<Map<String, Object>>  getUserList(String type,int page){
		   
		   List<Map<String, Object>> comList = new ArrayList<Map<String,Object>>();
		   comList = (List<Map<String, Object>>)userDao.getUsersByType(type, page);
		   
		   JSONObject ret = new JSONObject();
		   Map<String, Object> datas = new HashMap<String, Object>();
		   ret.put("ret", true);
		   datas.put("ulist", comList);
		   //TODO 总页数分页处理 暂时不做
		   if (comList !=null && comList  .size() > 0) {
			   
		   }
		  return comList;
	   }
}
