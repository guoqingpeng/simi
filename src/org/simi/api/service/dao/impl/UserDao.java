package org.simi.api.service.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.simi.utils.CommonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

@Repository("userDao")
public class UserDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public int userRegister(final JSONObject user){
		
		//用户注册sql文
		final StringBuffer insertSqlBuffer = new StringBuffer();
		insertSqlBuffer.append(" INSERT INTO t_user(");
		insertSqlBuffer.append("name");
		insertSqlBuffer.append(",age");
		insertSqlBuffer.append(",nickName");
		insertSqlBuffer.append(",job");
		insertSqlBuffer.append(",height");
		insertSqlBuffer.append(",sanwei");
		insertSqlBuffer.append(",company");
		insertSqlBuffer.append(",xinzuo");
		insertSqlBuffer.append(",weibo");
		insertSqlBuffer.append(",weixin");
		insertSqlBuffer.append(",hobby");
		insertSqlBuffer.append(",sex");
		insertSqlBuffer.append(",anouncement");
		insertSqlBuffer.append(",userType");
		insertSqlBuffer.append(")VALUES");
		insertSqlBuffer.append("(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		
		//返回的用户的数据的id
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(new PreparedStatementCreator(){
			@Override
			public PreparedStatement createPreparedStatement(Connection connection)
					throws SQLException {
				PreparedStatement pStatement = connection.prepareStatement(insertSqlBuffer.toString() ,
						                                                    Statement.RETURN_GENERATED_KEYS);
				//设置参数，此处暂时13个参数
				pStatement.setString(1,(String)user.get("name"));
				pStatement.setString(2,(String)user.get("age"));
				pStatement.setString(3,(String)user.get("nickName"));
				pStatement.setString(4,(String)user.get("job"));
				pStatement.setString(5,(String)user.get("height"));
				pStatement.setString(6,(String)user.get("sanwei"));
				pStatement.setString(7,(String)user.get("company"));
				pStatement.setString(8,(String)user.get("xinzuo"));
				pStatement.setString(9,(String)user.get("weibo"));
				pStatement.setString(10,(String)user.get("weixin"));
				pStatement.setString(11,(String)user.get("hobby"));
				pStatement.setString(12,(String)user.get("sex"));
				pStatement.setString(13,(String)user.get("anouncement"));
				pStatement.setString(14, (String)user.get("userType"));
				return pStatement;
			}},keyHolder);
		System.out.println("返回来的注册的id"+keyHolder.getKey().intValue());
		return keyHolder.getKey().intValue();
	} 
	
	/**
	 * 保存单个图片文件信息
	 * 图片类型文件默认设置为1
	 * @param userId
	 */
	public void savePicFile(String userId,String localPath,String wx_url){
		
		//文件sql文
		final StringBuffer insertSqlBuffer = new StringBuffer();
		insertSqlBuffer.append(" INSERT INTO t_file(");
		insertSqlBuffer.append("  wx_url");
		insertSqlBuffer.append(", local_path");
		insertSqlBuffer.append(", pk_user");
		insertSqlBuffer.append(", fileType)VALUES(");
		insertSqlBuffer.append("?,?,?,?)");
		System.out.println(insertSqlBuffer.toString());
		jdbcTemplate.update(insertSqlBuffer.toString(), new Object[]{wx_url,localPath,userId,1});
		
	}
	
	/**
	 * 保存单个音频文件信息
	 * 音频信息文件累心默认设置为2
	 * @param userId
	 */
	public void saveVoiceFile(String userId,String localPath, String wx_url,String wx_current_id){
		
		//文件sql文
		final StringBuffer insertSqlBuffer = new StringBuffer();
		insertSqlBuffer.append(" INSERT INTO t_file(");
		insertSqlBuffer.append("  wx_url");
		insertSqlBuffer.append(", local_path");
		insertSqlBuffer.append(", wx_origin_id");
		insertSqlBuffer.append(", wx_current_id");
		insertSqlBuffer.append(", pk_user");
		insertSqlBuffer.append(", fileType)VALUES(");
		insertSqlBuffer.append("?,?,?,?,?,?)");
		System.out.println(insertSqlBuffer.toString());
		jdbcTemplate.update(insertSqlBuffer.toString(), new Object[]{wx_url,
			                                                         localPath,
																	 wx_current_id,
			                                                         wx_current_id,
			                                                         userId,
			                                                         2});
	}
	
	/**
	 * 获取用户的基本信息
	 * @param userId
	 * @return
	 */
	public Map<String, String> getUserInfoById(String userId){
		   final Map< String, String> userInfoMap = new HashMap<String, String>();
		   StringBuffer searchSql = new StringBuffer();
		   searchSql.append("SELECT * FROM t_user WHERE id = ?");
		   System.out.println(searchSql.toString());
		   jdbcTemplate.queryForObject(searchSql.toString(), new Object[]{userId},
				   new RowMapper<Object>(){
					@Override
					public Object mapRow(final ResultSet rs, final int i)
							throws SQLException {
						userInfoMap.put("id", rs.getString("id"));
						userInfoMap.put("name", rs.getString("name"));
						userInfoMap.put("age", rs.getString("age"));
						userInfoMap.put("job",rs.getString("job"));
						userInfoMap.put("height",rs.getString("height"));
						userInfoMap.put("sanwei",rs.getString("sanwei"));
						userInfoMap.put("company",rs.getString("company"));
						userInfoMap.put("xinzuo",rs.getString("xinzuo"));
						userInfoMap.put("weibo",rs.getString("weibo"));
						userInfoMap.put("weixin",rs.getString("weixin"));
						userInfoMap.put("hobby",rs.getString("hobby"));
						userInfoMap.put("price",rs.getString("price"));
						userInfoMap.put("sex",rs.getString("sex"));
						userInfoMap.put("anouncement",rs.getString("anouncement"));
						return userInfoMap;
					}
		   });
		return userInfoMap;
	}
	
	/**
	 * 获取所有的图片
	 * @param userId
	 * @return
	 */
	public List<Object> getUserImgs(String userId){
	    List<Object> imgList = new ArrayList<Object>();
     	StringBuffer imgSql =new StringBuffer();
     	System.out.println(userId);
    	imgSql.append("SELECT local_path from t_file where pk_user = '"+userId+"'" +" AND fileType = 1");
    	System.out.println(imgSql.toString());
    	List rows = jdbcTemplate.queryForList(imgSql.toString());   
    	Iterator it = rows.iterator();   
    	while(it.hasNext()) {   
    	    Map userMap = (Map) it.next();   
    	    imgList.add(userMap.get("local_path"));
    	} 
    	return imgList;
	}
	
	/**
	 * 获取用户的音频信息
	 * @param userId
	 * @return
	 */
	public Map<String, String> getUserVoiceById(String userId){
		   final Map< String, String> voice = new HashMap<String, String>();
		   StringBuffer searchSql = new StringBuffer();
		   searchSql.append("SELECT last_upload_time,wx_current_id from t_file where pk_user = ? and fileType = ?");
		   System.out.println(searchSql.toString());
		   jdbcTemplate.queryForObject(searchSql.toString(), new Object[]{userId,2},
				   new RowMapper<Object>(){
					@Override
					public Object mapRow(final ResultSet rs, final int i)
							throws SQLException {
						voice.put("uploadTime", rs.getString("last_upload_time"));
						voice.put("voiceId", rs.getString("wx_current_id"));
						return voice;
					}
		   });
		return voice;
	}
	
	/**
	 * 根据微信的音频id获取音频的基本信息
	 * @param wx_origin_id
	 * @return
	 */
	public Map<String, String> getVoiceByWXid(String wx_origin_id){
		   final Map< String, String> voiceInfoMap = new HashMap<String, String>();
		   StringBuffer searchSql = new StringBuffer();
		   searchSql.append("SELECT * FROM t_file WHERE wx_origin_id = ?");
		   System.out.println(searchSql.toString());
		   jdbcTemplate.queryForObject(searchSql.toString(), new Object[]{wx_origin_id},
				   new RowMapper<Object>(){
					@Override
					public Object mapRow(final ResultSet rs, final int i)
							throws SQLException {
						voiceInfoMap.put("local_path", rs.getString("local_path"));
						voiceInfoMap.put("wx_current_id", rs.getString("wx_current_id"));
						return voiceInfoMap;
					}
		   });
		return voiceInfoMap;
	}
	
	/**
	 * 评论保存
	 * @param commentUser
	 * @param beCommentedUser
	 * @param comment
	 */
	public void saveCommnet(String commentUser,String beCommentedUser,String comment){
		
		//文件sql文
		final StringBuffer insertSqlBuffer = new StringBuffer();
		insertSqlBuffer.append(" INSERT INTO t_comment(");
		insertSqlBuffer.append("  comment_user");
		insertSqlBuffer.append(", be_commented_user");
		insertSqlBuffer.append(", comment)VALUES(");
		insertSqlBuffer.append("?,?,?)");
		System.out.println(insertSqlBuffer.toString());
		jdbcTemplate.update(insertSqlBuffer.toString(), new Object[]{commentUser,beCommentedUser,comment});
		
	}
	
	/**
	 * 获取用户的所有的评论
	 * @param userId
	 * @return
	 */
	public List<Object> getUsercommnets(String userId){
	    List<Object> comments = new ArrayList<Object>();
     	StringBuffer comSql =new StringBuffer();
     	
     	//游客评论
     	comSql.append("(SELECT c.id id ,"+"'游客'"+" name,c.comment comment FROM ");
 		comSql.append(" t_comment c");
     	comSql.append(" WHERE c.be_commented_user = '"+userId+"'");
     	comSql.append(" AND c.comment_user ='' ");
     	comSql.append(" ORDER BY c.id desc)");
     	comSql.append(" UNION ");
        //非游客评论数据
		comSql.append("(SELECT c.id id,u.name name,c.comment comment FROM ");
     	comSql.append(" t_comment c INNER JOIN t_user u ");
     	comSql.append(" ON c.comment_user = u.id ");
     	comSql.append(" WHERE c.be_commented_user = '"+userId+"'");
     	comSql.append(" AND c.comment_user is not null");
     	comSql.append(" ORDER BY c.id desc)");
     	comSql.append(" order by id desc ");
     	
    	System.out.println(comSql.toString());
    	List rows = jdbcTemplate.queryForList(comSql.toString());   
    	Iterator it = rows.iterator();   
    	while(it.hasNext()) {   
    	    Map userMap = (Map) it.next();   
    	    comments.add(userMap);
    	} 
    	return comments;
	}
	
	/**
	 * 点赞保存
	 * @param commentUser
	 * @param beCommentedUser
	 * @param comment
	 */
	public void saveDianZan(String commentUser,String beCommentedUser,String comment){
		
		//文件sql文
		final StringBuffer insertSqlBuffer = new StringBuffer();
		insertSqlBuffer.append(" INSERT INTO t_dianzan(");
		insertSqlBuffer.append("  pk_praise_user");
		insertSqlBuffer.append(", pk_be_prised_user");
		insertSqlBuffer.append(", device_id)VALUES(");
		insertSqlBuffer.append("?,?,?)");
		System.out.println(insertSqlBuffer.toString());
		jdbcTemplate.update(insertSqlBuffer.toString(), new Object[]{commentUser,beCommentedUser,comment});
		
	}
	
	/**
	 * 校验用户是否重复点赞
	 * @param userId
	 * @return
	 */
	public Boolean  isUserPraised(String zanUserId,String beZanUser){
		
		StringBuffer zanSql =new StringBuffer();
     	zanSql.append("SELECT count(*) from t_dianzan WHERE  pk_praise_user = ? and pk_be_prised_user = ?");
     	System.out.println(zanSql.toString());
     	int zanCount = 0;
     	zanCount = jdbcTemplate.queryForInt(zanSql.toString(),zanUserId,beZanUser );
		return zanCount >0 ? true:false;
	}
	
	/**
	 * 获取用户的所有的点赞数
	 * @param userId
	 * @return
	 */
	public int getDianzanCountByUserId(String beZanUser){
		
		StringBuffer zanSql =new StringBuffer();
     	zanSql.append("SELECT count(*) from t_dianzan WHERE  pk_be_prised_user = ?");
     	int zanCount = 0;
     	zanCount = jdbcTemplate.queryForInt(zanSql.toString(), beZanUser);
		return zanCount;

	}
	
	/**
	 * 返回当前类型，当前页数下的用户列表
	 * 当前页，总页数
	 * @param type
	 * @param page
	 * @return
	 */
	public List<Map<String, Object>> getUsersByType(String type,int page){
		
		List<Map<String, Object>> comList = null;
		//该页下第一条数据
		int beginIndex = (page-1)*CommonUtil.PER_PAGE;		
		StringBuffer sqlBuffer = new StringBuffer();
		sqlBuffer.append(" select f.local_path filePath ");
		sqlBuffer.append(", IFNULL(u.id,'') id");
		sqlBuffer.append(", IFNULL(u.name,'') name");
		sqlBuffer.append(", IFNULL(u.age,'') age");
		sqlBuffer.append(", IFNULL(u.job,'') job");
		sqlBuffer.append(", IFNULL(u.height,'') height");
		sqlBuffer.append(", IFNULL(u.sanwei,'') sanwei");
		sqlBuffer.append(", IFNULL(u.company,'') company");
		sqlBuffer.append(", IFNULL(u.xinzuo,'') xinzuo");
		sqlBuffer.append(", IFNULL(u.weibo,'') weibo");
		sqlBuffer.append(", IFNULL(u.weixin,'') weixin");
		sqlBuffer.append(", IFNULL(u.hobby,'') hobby");
		sqlBuffer.append(", IFNULL(u.sex,'') sex");
		sqlBuffer.append(", IFNULL(u.anouncement,'') anouncement");
		sqlBuffer.append(" FROM t_file f INNER JOIN t_user u on f.pk_user = u.id AND f.fileType = '1'");
		
		if (!"0".equals(type)) {
			//按照类型返回数据
			sqlBuffer.append("  WHERE u.userType = ? GROUP by u.id ORDER BY u.price  DESC limit ?,?");
			comList = jdbcTemplate.queryForList(sqlBuffer.toString(), type,beginIndex,CommonUtil.PER_PAGE);
		}else {
			//0代表返回所有类型的数据
			sqlBuffer.append("  GROUP by u.id ORDER BY u.price  DESC limit ?,?");
			comList = jdbcTemplate.queryForList(sqlBuffer.toString(), beginIndex,CommonUtil.PER_PAGE);
		}
		System.out.println(sqlBuffer.toString());
		if (comList !=null && comList.size() > 0) {
			return comList;
		}else {
			return new ArrayList<Map<String,Object>>();
		}
		
	}
	
	
	/**
	 * 返回当前类型，当前页数下的用户列表
	 * 当前页，总页数
	 * @param type
	 * @param page
	 * @return
	 */
	public List<Map<String, Object>> getMokeUsers(String searchKey,int page){
		
		List<Map<String, Object>> comList = null;
		//该页下第一条数据
		int beginIndex = (page-1)*CommonUtil.PER_PAGE;		
		StringBuffer sqlBuffer = new StringBuffer();
		sqlBuffer.append(" select f.local_path filePath ");
		sqlBuffer.append(", IFNULL(u.id,'') id");
		sqlBuffer.append(", IFNULL(u.name,'') name");
		sqlBuffer.append(", IFNULL(u.age,'') age");
		sqlBuffer.append(", IFNULL(u.job,'') job");
		sqlBuffer.append(", IFNULL(u.height,'') height");
		sqlBuffer.append(", IFNULL(u.sanwei,'') sanwei");
		sqlBuffer.append(", IFNULL(u.company,'') company");
		sqlBuffer.append(", IFNULL(u.xinzuo,'') xinzuo");
		sqlBuffer.append(", IFNULL(u.weibo,'') weibo");
		sqlBuffer.append(", IFNULL(u.weixin,'') weixin");
		sqlBuffer.append(", IFNULL(u.hobby,'') hobby");
		sqlBuffer.append(", IFNULL(u.sex,'') sex");
		sqlBuffer.append(", IFNULL(u.anouncement,'') anouncement");
		sqlBuffer.append(" FROM t_file f INNER JOIN t_user u on f.pk_user = u.id AND f.fileType = '1'");
		//按照类型返回数据
		sqlBuffer.append("  WHERE name like  '%"+searchKey+ "%'");
		sqlBuffer.append("  OR nickName like  '%"+searchKey+ "%'");
		sqlBuffer.append("  OR job like  '%"+searchKey+ "%'");
	    sqlBuffer.append("GROUP by u.id ORDER BY u.price  DESC limit ?,?");
	    System.out.println(sqlBuffer.toString());
		comList = jdbcTemplate.queryForList(sqlBuffer.toString(),beginIndex,CommonUtil.PER_PAGE);
		
		if (comList !=null && comList.size() > 0) {
			return comList;
		}else {
			return new ArrayList<Map<String,Object>>();
		}
		
	}
	
	/**
	 * 身价加分
	 * @param price
	 */
	public void addPrice(String userId,int price){
		StringBuffer sqlBuffer = new StringBuffer();
		sqlBuffer.append(" UPDATE t_user ");
		sqlBuffer.append(" SET price = price + ?");
		sqlBuffer.append(" WHERE id = ?");
		jdbcTemplate.update(sqlBuffer.toString(), price,userId);
	}
	
	/**
	 * 更新微信音频访问id
	 * @param price
	 */
	public void updateVoice(String oldId,String newId,long current){
		StringBuffer sqlBuffer = new StringBuffer();
		sqlBuffer.append(" UPDATE t_file ");
		sqlBuffer.append(" SET wx_origin_id = ? ");
		sqlBuffer.append(" ,wx_current_id = ?");
		sqlBuffer.append(" ,last_upload_time = ?");
		sqlBuffer.append(" WHERE wx_origin_id = ?");
		jdbcTemplate.update(sqlBuffer.toString(), newId,newId,current,oldId);
	}
	
}
