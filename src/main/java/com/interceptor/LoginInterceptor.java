package com.interceptor;

import com.bean.Admin;
import com.bean.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String uri = request.getRequestURI();
//        System.out.println("执行了拦截器的预处理方法");
        if (uri.contains("user-login")) {
            return true;
        }
        if (uri.contains("user-register")) {
            return true;
        }
        if (uri.contains("admin-login")) {
            return true;
        }
        if (uri.contains("check-username")) {
            return true;
        }
        //获取session
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("loginUser");
        Admin admin = (Admin) session.getAttribute("loginAdmin");
        //判断session中是否有登录的用户数据，如果有，则返回true，继续向下执行
        if (user != null) {
            return true;
        }
        //判断session中是否有登录的管理员数据，如果有，则返回true，继续向下执行
        if ((admin != null)) {
            return true;
        }

        //不符合条件的给出提示信息，并转发到登录页面
        request.setAttribute("loginmsg", "您还没有登录，请先登录！");
        request.getRequestDispatcher("/login.jsp").forward(request, response);
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
