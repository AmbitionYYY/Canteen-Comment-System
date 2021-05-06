package com.controller;

import com.alibaba.druid.util.StringUtils;
import com.bean.Announcement;
import com.bean.User;
import com.service.UserService;
import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    private UserService userService;

    //    注册功能实现
    @RequestMapping("user-register-show")
    public String UserRegisterShow(Model model) {
        User user = new User();
        model.addAttribute("user", user);
        return "/WEB-INF/views/user/user-register.jsp";
    }

    @RequestMapping("user-register")
    public String UserRegister(User user) {
        if (user != null && !user.equals("")) {
            userService.saveUser(user);
        } else {
            System.out.println("输入的用户信息有误！！");
        }
        return "/WEB-INF/views/user/user-register-success.jsp";
    }

    @RequestMapping("check-username")
    @ResponseBody
    public Map<String, Object> checkUserName(String username) {
        System.out.println(username);
        boolean bo = userService.queryUserByUsername(username);
        Map<String, Object> map = new HashMap<>();
//存在此用户名
        if (bo) {
            map.put("key", true);
//不存在重复用户名
        } else {
            map.put("key", false);
        }
        return map;
    }

    //    登录功能实现
    @RequestMapping("user-login-show")
//    @ModelAttribute("flag")为获取添加的隐藏参数
    public String userLoginShow(@ModelAttribute("flag") String flag, Model model) {
        model.addAttribute("flag", flag);
        return "/login.jsp";
    }


    @RequestMapping("user-login")
    public String userLogin(User user, HttpSession session, RedirectAttributes attributes) {
        if (!StringUtils.isEmpty(user.getUsername()) && !StringUtils.isEmpty(user.getPassword())) {
            System.out.println(user);
//        user 中的内容为用户输入的账号和密码,us中的内容为通过查询数据库查到的us对象，内容为null或一个已存在的user对象
            User us = userService.queryUserByUsernameAndPwd(user);
            if (us != null) {
                session.setAttribute("loginUser", us);
                session.setAttribute("name", us.getName());
                session.setAttribute("username", us.getUsername());
                session.setAttribute("password", us.getPassword());
                session.setAttribute("avatar", us.getAvatar());
//            登陆成功重定向到index.jsp路径，防止表单重复提交。
                return "redirect:/toIndex";
            } else {
//         在重定向的地址中添加隐藏参数,flag=1代表用户名账号密码错误
                attributes.addFlashAttribute("flag", "1");
                return "redirect:/user/user-login-show";
            }
        } else {
//         在重定向的地址中添加隐藏参数，flag=2代表用户名或密码某一项为空
            attributes.addFlashAttribute("flag", "2");
            return "redirect:/user/user-login-show";
        }
    }


    //  用户修改个人信息功能
    @RequestMapping("user-EditInfo-show")
    public ModelAndView editUserInfoshow(String username, String password) {
        System.out.println("用户跳转到了修改信息界面！");
        System.out.println("当前登录用户：" + username);
        System.out.println("当前登录用户密码：" + password);
//        使用session传递username和password参数回到此函数
//        创建User类对象u调用Service方法，查到对象后将数据返回给us对象
        User u = new User();
        u.setUsername(username);
        u.setPassword(password);
        User us = userService.queryUserByUsernameAndPwd(u);
        ModelAndView mv = new ModelAndView("/WEB-INF/views/user/user-Edit-info.jsp");
        mv.addObject("user", us);
        return mv;
    }

    @RequestMapping("user-EditInfo")
    public String editUserInfo(User user, HttpSession session, MultipartFile uploadavatar) throws IOException {
        if (uploadavatar != null && !uploadavatar.isEmpty()) {
            String oname = uploadavatar.getOriginalFilename();
            //指定的位置保存文件，指定名称
            File file = new File("D:\\ideaIU\\upload", oname);
            //复制
            uploadavatar.transferTo(file);
//            如果上传了头像的话直接将avatar的值赋给user对象
            user.setAvatar(oname);
//            如果没上传对象则使用原头像
        } else {
            user.setAvatar("dog.jpg");
        }
        System.out.println("上传的头像输出为：" + user.getAvatar());
        userService.EditUserInfo(user);
        session.invalidate();
        return "/login.jsp";
    }

    /**
     * @Description 加载页面时直接获取公告信息
     * @Author JXY
     * @Date 13:55 2021/4/17
     * @param
     * @return
     **/
    @ResponseBody
    @RequestMapping("/loadAnnouncement")
    public  Announcement loadAnnouncement(Model model){
        Announcement announcement = userService.queryAnnounceMent();
        model.addAttribute("announcement",announcement);
        return  announcement;
    }

    //注销功能实现
    @RequestMapping("user-logout")
    public String userLogout(HttpSession session) {
        session.invalidate();
//        return "/login.jsp";
        return "user-login-show";
    }
}


