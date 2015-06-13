package org.simi.api.service.dao.impl;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository("userDao")
public class UserDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
	public int userRegister(JSONObject user){
		
		//用户注册sql文
		StringBuffer insertSqlBuffer = new StringBuffer();
		int userId = 0;
		insertSqlBuffer.append(" INSERT INTO t_user(");
		insertSqlBuffer.append("name");
		insertSqlBuffer.append(",age");
		insertSqlBuffer.append(",job");
		insertSqlBuffer.append(",height");
		insertSqlBuffer.append(",sanwei");
		insertSqlBuffer.append(",company_belong");
		insertSqlBuffer.append(",xinzuo");
		insertSqlBuffer.append(",weibo");
		insertSqlBuffer.append(",weixin");
		insertSqlBuffer.append(",hobby");
		insertSqlBuffer.append(")VALUES");
		insertSqlBuffer.append("(?,?,?,?,?,?,?,?,?,?)");
		
//		jdbcTemplate.update(n, generatedKeyHolder);
		
		return 0;
		
	} 

}
