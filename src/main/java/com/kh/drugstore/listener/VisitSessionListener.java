package com.kh.drugstore.listener;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.kh.drugstore.admin.model.service.AdminService;


@WebListener
public class VisitSessionListener implements HttpSessionListener {
	
	/*
	 * @Autowired AdminService adminService;
	 */
	
    @Override
    public void sessionCreated(HttpSessionEvent arg0){
    	//세션 생성
        HttpSession session = arg0.getSession();
        
        //빈 얻어내기 참고:(http://assyrianball.blogspot.com/2019/03/java-spring-sessionlistener.html)
        WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(session.getServletContext());
        AdminService adminService = (AdminService) ctx.getBean("adminServiceImpl");
        adminService.insertVisit();
    }
    @Override
    public void sessionDestroyed(HttpSessionEvent arg0){
        //TODO Auto-generated method stub
    }
}