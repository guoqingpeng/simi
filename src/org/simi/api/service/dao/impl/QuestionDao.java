package org.simi.api.service.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository("questionDao")
public class QuestionDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	/**
	 * 保存对问题的回复
	 * @param reply
	 * @param replyTo
	 * @param replyUser
	 */
	public void saveReply(String reply,int replyTo,String replyUser){
		
		//文件sql文
		final StringBuffer insertSqlBuffer = new StringBuffer();
		insertSqlBuffer.append(" INSERT INTO t_question_reply(");
		insertSqlBuffer.append("  reply");
		insertSqlBuffer.append(", replyTo");
		insertSqlBuffer.append(", replyUser)VALUES(");
		insertSqlBuffer.append("?,?,?)");
		System.out.println(insertSqlBuffer.toString());
		jdbcTemplate.update(insertSqlBuffer.toString(), new Object[]{reply,replyTo,replyUser});
		
	}
	
	/**
	 * 获取问题下的所有的回复
	 * @param userId
	 * @return
	 */
	public List<Object> getReplys(String question){
	    List<Object> replys = new ArrayList<Object>();
     	StringBuffer comSql =new StringBuffer();
     	//游客回复
     	comSql.append("(SELECT c.id id ,"+"'游客'"+" name,q.question question,c.reply reply FROM ");
 		comSql.append("t_question_reply c INNER JOIN t_question q ON c.replyTo = q.id ");
     	comSql.append(" WHERE ");
     	comSql.append(" c.replyUser ='' ");
     	comSql.append(" AND c.replyTo = '"+question+"'");
     	comSql.append(" ORDER BY c.id desc)");
     	comSql.append(" UNION ");
        //非游客回复
		comSql.append("(SELECT c.id id,u.name name,q.question question ,c.reply reply FROM ");
     	comSql.append("t_question_reply c INNER JOIN t_user u ");
     	comSql.append("ON c.replyUser = u.id ");
     	comSql.append("INNER JOIN t_question q ON c.replyTo = q.id ");
     	comSql.append("WHERE c.replyTo = '"+question+"'");
     	comSql.append("AND c.replyUser is not null");
     	comSql.append(" ORDER BY c.id desc)");
     	comSql.append(" order by id desc ");
     	
    	System.out.println(comSql.toString());
    	List rows = jdbcTemplate.queryForList(comSql.toString());   
    	Iterator it = rows.iterator();   
    	while(it.hasNext()) {   
    	    Map userMap = (Map) it.next();   
    	    replys.add(userMap);
    	} 
    	return replys;
	}
	
	/**
	 * 获取问题名称
	 * @param userId
	 * @return
	 */
	public String getQuestionNameById(String userId){
		   final Map< String, String> userInfoMap = new HashMap<String, String>();
		   StringBuffer searchSql = new StringBuffer();
		   searchSql.append("SELECT * FROM t_question WHERE id = ?");
		   System.out.println(searchSql.toString());
		   jdbcTemplate.queryForObject(searchSql.toString(), new Object[]{userId},
				   new RowMapper<Object>(){
					@Override
					public Object mapRow(final ResultSet rs, final int i)
							throws SQLException {
						userInfoMap.put("question", rs.getString("question"));
						
						return userInfoMap;
					}
		   });
		System.out.println((String)userInfoMap.get("question"));
		return (String)userInfoMap.get("question");
	}
}
