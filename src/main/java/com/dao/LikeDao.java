package com.dao;

import org.apache.ibatis.annotations.Param;

public interface LikeDao {
    Integer query_dish(@Param("userId")Integer userId,@Param("typeId")Integer typeId);
    Integer  add_like(@Param("userId") Integer userId,@Param("typeId") Integer typeId,@Param("type") Integer type);

    Integer delete_like(@Param("userId")Integer userId,@Param("typeId") Integer typeId,@Param("type") Integer type);
//给菜品点赞成功之后的后续操作
    void update_dish_add(Integer typeId);
//给菜品取消点赞之后的后续操作
    void update_dish_sub(Integer typeId);


    //**************以下方法是对评论点赞的相关操作*****************
     Integer query_comment(@Param("userId")Integer userId, @Param("typeId")Integer typeId);
    //给评论点赞成功之后的后续操作
    void update_comment_add(@Param("typeId")Integer typeId);
}