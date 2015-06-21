package org.simi.api;


import javax.servlet.ServletContextEvent;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

@Component
public class AppContextInitListener implements ApplicationListener<ContextRefreshedEvent>,
		HttpSessionListener {

    @Autowired
    private UpdatePriceTimer updatePriceTimer;
    
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
		
		System.out.println("应用启动后测试");
		 updatePriceTimer.showTimer(); 
   }

}
