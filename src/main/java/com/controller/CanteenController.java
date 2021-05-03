package com.controller;

import com.bean.Comment;
import com.bean.Dish;
import com.bean.User;
import com.github.pagehelper.PageInfo;
import com.service.AdminService;
import com.service.CanteenService;
import com.service.DishService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


/**
 * @Description 用户对餐厅内信息的处理
 * @Author JXY
 * @Date 21:54 2021/4/17
 * @version 1.0
 **/
@Controller
@RequestMapping("canteen")
public class CanteenController {
    @Autowired
    private CanteenService canteenService;
    //    第一餐厅菜品展示界面
    @RequestMapping("canteenDishes-show")
    public String canteenDishesShow(@RequestParam(defaultValue = "1") Integer currentPage, Model model) {
        PageInfo<Dish> pageInfo = canteenService.queryUserAllDishes(currentPage);
        model.addAttribute("pageInfo", pageInfo);
        return "/WEB-INF/views/user/canteen/dishes-show.jsp";
    }

    //    用户进行菜品点评页面展示
    @RequestMapping("comment-dish-show")
    public String commentDishShow(Integer dishid, Model model) {
//        System.out.println("点击的菜品id是"+dishid);
        model.addAttribute("dishid", dishid);
        return "/WEB-INF/views/user/canteen/comment-dish-show.jsp";
    }

    //    用户进行菜品点评页面数据处理与提交
    @RequestMapping("comment-dish")
    public String commentDish(Integer score, String content, Integer dishid, HttpSession session) {
        Comment comment = new Comment();
        comment.setContent(content);
        //创建一个时间对象，获取到当前的时间
        Date date = new Date();
        //设置时间显示格式
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
        //将当前时间格式化为需要的类型
        String currentTime = sdf.format(date);
        comment.setCreatetime(currentTime);
//        System.out.println("当前时间为：" + currentTime);
        // 从session中取出当前用户名存放到comment对象中
        String username = session.getAttribute("username").toString();
        System.out.println("当前的用户名为：" + username);
        comment.setUsername(username);
        comment.setDishid(dishid);
        comment.setScore(score);
        canteenService.addCommentInfo(comment);
        return "redirect:/canteen/canteenDishes-show";
    }


    //    用户查看菜品详情
    @RequestMapping("dish-detail-show")
    public ModelAndView dishDetailshow(Integer dishid, HttpSession session) {
        System.out.println("查看的菜品id是" + dishid);
//        从session中获取到当前登录的用户对象
      User loginUser = (User) session.getAttribute("loginUser");
//       通过dishid查询Dish信息返回给页面
        Dish dish = canteenService.queryDishInfoByDishid(dishid);
//      返回菜品的平均分
        double avgScore = canteenService.queryAvgScore(dishid);
//        通过dish查询Comment信息返回给页面
        List<Comment> commentList = canteenService.queryCommentInfoByDishid(dishid);

//能够将点击的菜品的dish和comment信息再controller层打印输出，但多个用户同时评价一个菜品时情况未考虑，后续优化。
//此时comment只能打印出一个用户的所有评论信息。

        ModelAndView mv=new ModelAndView("/WEB-INF/views/user/canteen/dish-detail-show.jsp");
        mv.addObject("dishid", dishid);
        mv.addObject("avgScore",avgScore);
        //      将查询到的菜品详细信息放入菜品细节展示界面
        mv.addObject("dish",dish);
//        将查询到的菜品评论信息放入菜品细节展示界面
        mv.addObject("commentList",commentList);
        mv.addObject("user",loginUser);
        return mv;
    }


//    菜品排名界面
    @RequestMapping("Dishes-rank-show")
    public ModelAndView Dishesrankshow(){
        System.out.println("进入了菜品排行界面！");
       ModelAndView mv=new ModelAndView("/WEB-INF/views/user/canteen/dishes-rank-show.jsp");
        List<Dish> dishrankListBycomments = canteenService.queryRankInfoBycomments();
        List<Dish> dishrankListByscore = canteenService.queryRankInfoByscore();
        List<Dish> dishrankListBylikes = canteenService.queryRankInfoBylikes();
        ArrayList scoreList = canteenService.queryRankScore();

//        System.out.println("排名分数列表："+scoreList);
        mv.addObject("scoreList",scoreList);
        mv.addObject("dishrankListBycomments",dishrankListBycomments);
        mv.addObject("dishrankListByscore",dishrankListByscore);
        mv.addObject("dishrankListBylikes",dishrankListBylikes);
        return mv;

    }



}
