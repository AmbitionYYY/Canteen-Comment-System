package com.controller;

import com.bean.Announcement;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;


//要把@RequestMapping()标注在确定的某一方法上，不能只标在类上不标在方法上。
@Controller
public class ToUserIndexController {
    @Autowired
    UserService userService;
    //    在登录页面中使用的是重定向而不是转发到达主页，避免表单重复提交。
    @RequestMapping("toIndex")
    public String IndexPage(HttpSession session) {
//        session中有用户名和密码代表用户已经登录
        Object loginUser = session.getAttribute("loginUser");

        if (loginUser != null) {
            System.out.println("登陆成功了！当前登录的用户信息为：" + loginUser.toString());
            return "/index.jsp";
        } else {
            System.out.println("登陆失败！跳转到登陆界面！");
////        在重定向的地址中添加隐藏参数，flag=3代表用户未登录
//            attributes.addFlashAttribute("flag", "3");
            return "redirect:/user/user-login-show";
        }
    }
}
