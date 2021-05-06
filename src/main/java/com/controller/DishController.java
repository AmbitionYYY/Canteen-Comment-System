package com.controller;

import com.bean.Dish;
import com.service.DishService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.IOException;


/**
 * @Description 管理员对餐厅菜品的管理
 * @Author JXY
 * @Date 21:54 2021/4/17
 * @version 1.0
 **/
@Controller
@RequestMapping("dish")
public class DishController {
    @Autowired
    private DishService dishService;

    //    跳转到添加菜品界面
    @RequestMapping("add-dish-show")
    public String addDishshow() {
        System.out.println("正在添加菜品");
        return "/WEB-INF/views/admin/dish/add-dish.jsp";
    }

    //    添加菜品
    @RequestMapping("add-dish")
    public String addDish(Dish dish, MultipartFile dishavatar) throws IOException {
        if (dishavatar != null && !dishavatar.isEmpty()) {
            String oname = dishavatar.getOriginalFilename();
            //指定的位置保存文件，指定名称
            File file = new File("D:\\ideaIU\\dish", oname);
            //复制
            dishavatar.transferTo(file);
//            如果上传了头像的话直接将avatar的值赋给user对象
            dish.setAvatar(oname);
//            如果没上传头像则使用固定头像
        } else {
            dish.setAvatar("f.jpg");
        }
        System.out.println("添加的菜品信息：" + dish);
        dishService.addDish(dish);
        return "/admin/dishes-manage-show";
    }

    //    修改菜品信息页面展示
    @RequestMapping("edit-DishInfo-show")
    public ModelAndView editDishInfoShow(Integer dishId) {
        System.out.println(dishId);
        Dish dish = dishService.queryDishById(dishId);
        ModelAndView mv = new ModelAndView("/WEB-INF/views/admin/dish/edit-dish.jsp");
        mv.addObject("dish", dish);
        return mv;
    }

    //    修改菜品信息
    @RequestMapping("edit-DishInfo")
    public String editDishInfo(Dish dish, MultipartFile dishavatar) throws IOException {
        if (dishavatar != null && !dishavatar.isEmpty()) {
            String oname = dishavatar.getOriginalFilename();
            //指定的位置保存文件，指定名称
            File file = new File("D:\\ideaIU\\dish", oname);
            //复制
            dishavatar.transferTo(file);
//            如果上传了头像的话直接将avatar的值赋给user对象
            dish.setAvatar(oname);
//            如果没上传头像则使用固定头像
        } else {
            dish.setAvatar("pu1.jpg");
        }
        dishService.editDishInfo(dish);
        System.out.println("修改后的dish信息为：" + dish);
        return "/admin/dishes-manage-show";
    }

    //    删除菜品功能
    @RequestMapping("removeDish")
    public String removeDish(Integer dishId) {
        dishService.removeDish(dishId);
        System.out.println("您删了的菜品的ID是:" + dishId);
        return "/admin/dishes-manage-show";
    }
}
