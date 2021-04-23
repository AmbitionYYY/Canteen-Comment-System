package com.service;

import com.bean.Comment;
import com.bean.Dish;
import com.github.pagehelper.PageInfo;

import java.util.ArrayList;
import java.util.List;

public interface CanteenService {

    public PageInfo<Dish> queryUserAllDishes(Integer currentPage);

    public void addCommentInfo(Comment comment);

    public Dish queryDishInfoByDishid(Integer dishid);

    public List<Comment> queryCommentInfoByDishid(Integer dishid);

    List<Dish> queryRankInfoBycomments();

    List<Dish> queryRankInfoByscore();

    List<Dish> queryRankInfoBylikes();

    ArrayList queryRankScore();

    double queryAvgScore(Integer dishid);
}
