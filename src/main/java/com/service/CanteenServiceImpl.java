package com.service;

import com.bean.Comment;
import com.bean.Dish;
import com.dao.CanteenDao;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
//@Transactional
public class CanteenServiceImpl implements CanteenService {
    @Autowired
    private CanteenDao canteenDao;
    @Autowired
    private DishService dishService;

    @Override
    public PageInfo<Dish> queryUserAllDishes(Integer currentPage) {

// ***********使用分页插件必须遵守一下顺序**********

//*****此部分与管理员界面的菜品管理界面功能实现代码大体一致*****

//      1.  设置当前页和每页显示的数据条数
        PageHelper.startPage(currentPage, 3);
//      2.  调用持久层方法
        List<Dish> dishList = canteenDao.selectUserAllDishes();
//      3.  设置PageInfo对象，第二个对象是页面上显示的页码数量
        PageInfo<Dish> pageInfo = new PageInfo<>(dishList, 5);
        return pageInfo;
    }

    @Override
    public void addCommentInfo(Comment comment) {
        canteenDao.insertCommentInfo(comment);
        Integer dishId=comment.getDishid();
        canteenDao.updateDishInfo(dishId);
    }

    @Override
    public Dish queryDishInfoByDishid(Integer dishid) {
//        此处调用了管理员页面（DishService）中的方法查询dish信息
        Dish dish = dishService.queryDishById(dishid);
        return dish;
    }

    @Override
    public List<Comment> queryCommentInfoByDishid(Integer dishid) {
        List<Comment> commentList = canteenDao.selectCommentInfoByDishid(dishid);
        return commentList;
    }
//根据评论数查询菜品信息
    @Override
    public List<Dish> queryRankInfoBycomments() {
        List<Dish> dishListbycomments = canteenDao.selectRankInfoBycomments();
        return dishListbycomments;
    }
//根据评分数查询菜品信息
    @Override
    public List<Dish> queryRankInfoByscore() {
        Dish firstdish = canteenDao.selectFirstRankInfoByscore();
        Dish seconddish = canteenDao.selectSecondRankInfoByscore();
        Dish thirddish = canteenDao.selectThirdRankInfoByscore();
        List<Dish> dishListbyscore=new ArrayList<Dish>();
        dishListbyscore.add(firstdish);
        dishListbyscore.add(seconddish);
        dishListbyscore.add(thirddish);
//        System.out.println("查询出来的根据评分排名的菜品列表:"+dishListbyscore);
        return  dishListbyscore;
    }
//根据点赞数查询菜品信息
    @Override
    public List<Dish> queryRankInfoBylikes() {
        List<Dish> dishListbylikes = canteenDao.selectRankInfoBylikes();
        return dishListbylikes;
    }

//    查询排名前三的评分数据
    @Override
    public ArrayList queryRankScore() {
        ArrayList arrayList = canteenDao.selectrankScore();
//        System.out.println(arrayList);
        return arrayList;
    }

    /**
     * @Description 返回菜品平均评分
     * @Author JXY
     * @Date 19:58 2021/5/3
     * @param
     * @return
     **/
    @Override
    public double queryAvgScore(Integer dishid) {
        int number = canteenDao.checkCommentNull(dishid);
        double avgScore=0;
        if (number>0){
             avgScore = canteenDao.selectAvgScore(dishid);
        }
        return avgScore;
    }
}
