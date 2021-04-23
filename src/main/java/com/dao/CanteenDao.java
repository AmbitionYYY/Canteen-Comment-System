package com.dao;

import com.bean.Comment;
import com.bean.Dish;

import java.util.ArrayList;
import java.util.List;

public interface CanteenDao {
    public List<Dish> selectUserAllDishes();

    public void insertCommentInfo(Comment comment);

//    public Dish selectDishInfoByDishid(Integer dishid);

    public List<Comment> selectCommentInfoByDishid(Integer dishid);

//在插入评论信息后，应该更新菜品信息
void updateDishInfo(Integer dishId);

//根据评论数查询菜品信息
    List<Dish> selectRankInfoBycomments();

//根据评分数查询菜品第一名信息
    Dish selectFirstRankInfoByscore();
    //根据评分数查询菜品第二名信息
    Dish selectSecondRankInfoByscore();
    //根据评分数查询菜品第三名信息
    Dish selectThirdRankInfoByscore();
//根据点赞数查询菜品信息
    List<Dish> selectRankInfoBylikes();
//查询排名前三的菜品分数
    ArrayList selectrankScore();

    double selectAvgScore(Integer dishid);
}
