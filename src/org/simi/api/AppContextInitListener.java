package org.simi.api;


import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

import javax.servlet.ServletContextEvent;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.simi.utils.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

@Component
public class AppContextInitListener implements ApplicationListener<ContextRefreshedEvent>,
		HttpSessionListener {

    @Autowired
    private UpdatePriceTimer updatePriceTimer;
    
    static{
    	
    	Properties prop = new Properties();  
        try {  
        	
            prop.load(AppContextInitListener.class.getClassLoader().getResourceAsStream("org/simi/api/path.properties"));
        	
            FileUtil.FILE_SAVE_PATH = prop.getProperty("save_file_path");  
            
        } catch(IOException e) {  
        e.printStackTrace();  
          }
    }
    
	public AppContextInitListener() {

	}

	public void contextDestroyed(ServletContextEvent event) {

	}

	public void contextInitialized(ServletContextEvent event) {

		
	}

	public void sessionCreated(HttpSessionEvent event) {
	
	}

	public void sessionDestroyed(HttpSessionEvent event) {
		HttpSession session = event.getSession();
		session.invalidate();
	}

	@Override
	public void onApplicationEvent(ContextRefreshedEvent ev) {
		
		//解析jdbbc
		
		System.out.println("应用启动后测试");
		 updatePriceTimer.showTimer(); 
   }

}
