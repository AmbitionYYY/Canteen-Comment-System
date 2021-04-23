package com.controller;

import com.service.LikeService;
import com.util.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("like")
public class LikeController {
    @Autowired
  private   LikeService likeService;

    Map<String, Object> data = new HashMap<>();

//userId表示哪个用户，
// Type有1,2两个值，用来确定点赞的是菜品还是评论。
// typeid表示点赞或评论的的id

    @RequestMapping("add")
    public Object add_like(@RequestParam Integer userId,
                           @RequestParam Integer type,
                           @RequestParam Integer typeId) throws Exception {
        System.out.println("传来的userId:" + userId + "传来的type:" + type + "传来的typeId:" + typeId);
        data.clear();
        if (userId == null || type == null || typeId == null) return ResultUtil.error(505, "传入参数不正确");
        Integer n;
        if (type == 1) {
            n = 0;
//            查询这个菜品是否已经被当前登录用户点过赞，如果点过赞就返回一个int型结果
            n = likeService.query_dish(userId, typeId);
//            System.out.println("result的值为："+n);
            if (n != null) {
                return ResultUtil.error(505, "您已经点过赞了!");
            } else {
//                如果没点过赞就点个赞，插入数据并返回最后插入的数据id给n
                n = likeService.add_like(userId, typeId, type);
                if (n == 0) return ResultUtil.error(500, "未知错误");
                else {
//                    System.out.println("点赞成功时候的n为："+n);
//                    此处点赞成功，执行后续操作。
                    likeService.update_dish_add(typeId);
                    data.put("like_id", n);
                    return ResultUtil.success(data);
                }
            }
        } else if (type == 2) {
            n = 0;
            n = likeService.query_comment(userId, typeId);
            if (n != null) {    //数据库中有数据，点赞过了
                return ResultUtil.error(505, "您已经给此评论点过赞了！");
            } else {    //没点过赞
                n = likeService.add_like(userId, typeId, type);
                if (n == 0) {return ResultUtil.error(500, "未知错误.");}
                else {
                    data.put("like_id", n);
                    likeService.update_comment_add(typeId);
                    return ResultUtil.success(data);
                }
            }
        } else {
            return ResultUtil.error(505, "type参数有误");
        }
    }
    @RequestMapping("cancel")
    public  Object cancel_like(
            @RequestParam Integer userId,
            @RequestParam Integer type,
            @RequestParam Integer typeId
    )throws  Exception{
        if(userId == null || type ==null || typeId==null) return ResultUtil.error(505,"传入参数不正确");
        Integer n;
        data.clear();

        if(type == 1){
            n=likeService.query_dish(userId,typeId);
            if(n == null) {
                return ResultUtil.error(505, "您还未点过赞！");
            }else{
                n=0;
//                若存在这条点赞数据则删除。
                 n = likeService.delete_like(userId, typeId,type);
//                System.out.println("删除后返回的值赋给n，此时n的值不为0时执行这个删除语句。n为："+n);
                if(n==0) return ResultUtil.error(500,"未知错误.");
                else{
                    likeService.update_dish_sub(typeId);
                    data.put("status","删除成功!");
                    return  ResultUtil.success(200,"删除成功！");
                }
            }
        }else if(type == 2){
            n=likeService.query_comment(userId,typeId);
            if(n == null) {
                return ResultUtil.error(505, "此评论未点过赞");
            }else{
                n=0;
                n=likeService.delete_like(userId, typeId, type);
                if(n==0) return ResultUtil.error(500,"未知错误");
                else{
                    likeService.update_comment_sub(typeId);
                    data.put("status","删除成功");
                    return  ResultUtil.success(data);
                }
            }

        }else{
            return ResultUtil.error(505,"type参数有误");
        }
    }

    }
