package com.controller;

import com.bean.*;
import com.github.pagehelper.PageInfo;
import com.service.AdminService;
import com.service.CanteenService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.jar.Attributes;

@Controller
@RequestMapping("admin")
public class AdminController {
    @Autowired
    private AdminService adminService;
//    用来调用查询所有菜品的方法
    @Autowired
    private CanteenService canteenService;

    //    管理员登录界面展示
    @RequestMapping("admin-login-show")
    public String adminLoginShow(@ModelAttribute("flag") String flag, Model model) {
        System.out.println("进入了管理员登录界面！");
//        flag的值要么为1要么为空
        model.addAttribute("flag", flag);
        return "/WEB-INF/views/admin/admin-login.jsp";
    }


    //    管理员登录功能
    @RequestMapping("admin-login")
    public String adminLogin(Admin admin, RedirectAttributes attributes, HttpSession session) {
        System.out.println(admin);
//        admin为用户输入的管理员对象，ad或为空或为数据库中管理员对象
        Admin ad = adminService.queryAdminByAdminnameAndPwd(admin);
        if (ad != null) {
            System.out.println("管理员用户密码正确！！进入管理界面！！");
            session.setAttribute("loginAdmin", ad);
            session.setAttribute("name", ad.getAdminname());
            return "/WEB-INF/views/admin/admin-index.jsp";
        } else {
            //         在重定向的地址中添加隐藏参数flag,1代表登录失败
            attributes.addFlashAttribute("flag", "1");
            return "redirect:/admin/admin-login-show";
        }
    }

    //    菜品管理界面展示
    @RequestMapping("dishes-manage-show")
    public String dishesShow(@RequestParam(defaultValue = "1") Integer currentPage,String selectedCanteen, Model model) {
//        System.out.println(selectedCanteen);
        /*if(selectedcanteen.equals("全部餐厅")){
            System.out.println("全部餐厅啊啊啊");
        }else {
            System.out.println(selectedCanteen);
        }*/

        PageInfo<Dish> pageInfo = adminService.queryAllDishes(currentPage);
//     未分页时测试语句代码  List<Dish> dishes =adminService.queryAllDishes();
        model.addAttribute("pageInfo", pageInfo);
        return "/WEB-INF/views/admin/dishes-manage-show.jsp";
    }

//    评论审核功能
@RequestMapping("commentsAudit")
public String commentsAudit(@RequestParam(defaultValue = "1") Integer currentPage, Model model){

    PageInfo<Dish> pageInfo = canteenService.queryUserAllDishes(currentPage);
    model.addAttribute("pageInfo", pageInfo);
    return "/WEB-INF/views/admin/dish/commentsAudit.jsp";
}

//  单个菜品评论展示页面
@ResponseBody
@RequestMapping("viewComments")
public List<Comment> viewCommentsBydishId(Integer dishId){
        System.out.println("传来的Dishid为："+dishId);
        List<Comment> commentList= canteenService.queryCommentInfoByDishid(dishId);
        System.out.println(commentList);
        return commentList;
}

//删除某菜品的某评论
    @RequestMapping("delComment")
    public String delCommentBycommentId(Integer commentId){
//        System.out.println("删除的commentID为"+commentId);
        adminService.removeCommentBycommentId(commentId);
        return "redirect:/admin/commentsAudit";
    }

    /**
     * @Description 进入发布公告页面
     * @Author JXY
     * @Date 13:15 2021/4/17
     * @param
     * @return
     **/
    @RequestMapping("/releaseAnnouncement")
    public String releaseAnouncement(){
        return "/WEB-INF/views/admin/admin-release-announcement.jsp";
    }

    /**
     * @Description 保存公告数据
     * @Author JXY
     * @Date 16:48 2021/4/17
     * @param
     * @return
     **/
    @RequestMapping("saveAnnouncement")
    public String saveAnnouncement(String announcement,String date,String time){
        //        announce1是对象，announce是字符串
        Announcement announcement1=new Announcement();
        announcement1.setAnnouncement(announcement);
        String date1= date.concat(" ");
        String createtime= date1.concat(time);
        announcement1.setCreatetime(createtime);
        adminService.editAnnouncement(announcement1);
        return "/admin/toHomePage";
    }

    /**
     * @Description 查看所有未解决的反馈信息
     * @Author JXY
     * @Date 18:22 2021/4/17
     * @param
     * @return  所有未解决的反馈消息列表
     **/
    @RequestMapping("resolveMessage")
    public String resolveMessage(@RequestParam(defaultValue = "1") Integer currentPage, Model model){
       PageInfo<Message> pageInfo=adminService.queryMessage(currentPage);
        model.addAttribute("pageInfo", pageInfo);
        return "/WEB-INF/views/admin/admin-resolve-message.jsp";
    }

    /**
     * @Description 解决了的反馈用逻辑删除
     * @Author JXY
     * @Date 22:58 2021/4/17
     * @param
     * @return
     **/
    @RequestMapping("/delMessage")
    public String delMessage(@RequestParam(value = "mid") int mid){
        System.out.println(mid);
        adminService.delMessageByMid(mid);
        return "redirect:/admin/resolveMessage";
    }

    //跳转到首页
    @RequestMapping("toHomePage")
    public String toHomePage(){
        return "/WEB-INF/views/admin/admin-index.jsp";
    }
    //    管理员注销功能
    @RequestMapping("admin-logout")
    public String adminLogout(HttpSession session) {
        session.invalidate();
        return "/WEB-INF/views/admin/admin-login.jsp";
    }
}