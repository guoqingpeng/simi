package org.simi.api;

import java.util.Calendar;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

import org.simi.api.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UpdatePriceTimer {
	
	@Autowired
	private UserService userService;
    public  void showTimer() {
        TimerTask task = new TimerTask() {
            @Override
            public void run() {
            	userService.updateOldPrice();
            	System.out.println("今天凌晨执行了定时任务");
            }
        };

        //设置执行时间
        Calendar calendar = Calendar.getInstance();
        int year = calendar.get(Calendar.YEAR);
        int month = calendar.get(Calendar.MONTH);
        int day = calendar.get(Calendar.DAY_OF_MONTH);//每天
        
        //定制每天执行，
        calendar.set(year, month, day, 23, 59, 59);
        Date date = calendar.getTime();
        Timer timer = new Timer();
        System.out.println(date);

        int period = 2 * 1000;
        //每天的date时刻执行task，每隔2秒重复执行
//        timer.schedule(task, date, period);
        //每天的date时刻执行task, 仅执行一次
        timer.schedule(task, date);
    }
}