package org.simi.api.service.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
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
		insertSqlBuffer.append("(?,?,?,?,?,?,?,?,?,?)");
		
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
					pStatement.setString(++i, (String)user.get(key));
				}
				return pStatement;
			}},keyHolder);
		System.out.println("返回来的注册的id"+keyHolder.getKey().intValue());
		return keyHolder.getKey().intValue();
	} 

}
