package org.simi.api.service.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;

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
		
		//final Map<String, Object> userMap  = (Map<String, Object>)user;
		
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
		insertSqlBuffer.append(",anouncement");
		insertSqlBuffer.append(")VALUES");
		insertSqlBuffer.append("(?,?,?,?,?,?,?,?,?,?,?,?)");
		
		//返回的用户的数据的id
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(new PreparedStatementCreator(){
			@Override
			public PreparedStatement createPreparedStatement(Connection connection)
					throws SQLException {
				PreparedStatement pStatement = connection.prepareStatement(insertSqlBuffer.toString() ,
						                                                    Statement.RETURN_GENERATED_KEYS);
				Object[] params = new Object[]{};
				int i = 0;
				//设置参数
				for (Object key : user.keySet()) {
					System.out.println(key);
					//Object vObject = (String)user.get((String)key);
				    pStatement.setString(++i,(String)user.get((String)key));
				}
				return pStatement;
			}},keyHolder);
		System.out.println("返回来的注册的id"+keyHolder.getKey().intValue());
		return keyHolder.getKey().intValue();
	} 
	
	/**
	 * 保存单个图片文件
	 * @param userId
	 */
	public void savePicFile(String userId,String wx_url){
		
		//文件sql文
		final StringBuffer insertSqlBuffer = new StringBuffer();
		insertSqlBuffer.append(" INSERT INTO t_file(");
		insertSqlBuffer.append("  wx_url");
		insertSqlBuffer.append(", pk_user");
		insertSqlBuffer.append(", fileType)VALUES(");
		insertSqlBuffer.append("?,?,?)");
		System.out.println(insertSqlBuffer.toString());
		jdbcTemplate.update(insertSqlBuffer.toString(), new Object[]{wx_url,userId,1});
	}
	
	/**
	 * 保存单个音频文件
	 * @param userId
	 */
	public void saveVoiceFile(String userId,String wx_url,String wx_current_id){
		
		//文件sql文
		final StringBuffer insertSqlBuffer = new StringBuffer();
		insertSqlBuffer.append(" INSERT INTO t_file(");
		insertSqlBuffer.append("  wx_url");
		insertSqlBuffer.append(", wx_origin_id");
		insertSqlBuffer.append(", wx_current_id");
		insertSqlBuffer.append(", pk_user");
		insertSqlBuffer.append(", fileType)VALUES(");
		insertSqlBuffer.append("?,?,?,?,?)");
		System.out.println(insertSqlBuffer.toString());
		jdbcTemplate.update(insertSqlBuffer.toString(), new Object[]{wx_url,
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
		   jdbcTemplate.queryForObject(searchSql.toString(), new Object[]{userId},
				   new RowMapper<Object>(){
					@Override
					public Object mapRow(final ResultSet rs, final int i)
							throws SQLException {
						userInfoMap.put("id", "");
						userInfoMap.put("name", "");
						userInfoMap.put("age", "");
						userInfoMap.put("job", "");
						return userInfoMap;
					}
					   
			   
		   });
		return userInfoMap;
	}
}
