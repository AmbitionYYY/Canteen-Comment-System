package com.service;

import com.dao.LikeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LikeServiceImpl implements LikeService {

    @Autowired
    private LikeDao likeDao;

//    查询菜品是否被点赞信息
    @Override
    public Integer query_dish(Integer userId, Integer typeId) {
        Integer result = likeDao.query_dish(userId, typeId);
        return result;
    }

    //给菜品添加点赞信息
    @Override
    public Integer add_like(Integer userId, Integer typeId, Integer type) {
        Integer last_insert_id = likeDao.add_like(userId, typeId, type);
        return last_insert_id;
    }
//更新菜品点赞信息
    @Override
    public void update_dish_add(Integer typeId) {
        likeDao.update_dish_add(typeId);
    }
//查询评论点赞信息
    @Override
    public Integer query_comment(Integer userId, Integer typeId) {
        Integer result = likeDao.query_comment(userId, typeId);
        return result;
    }
//更新评论点赞信息
    @Override
    public void update_comment_add(Integer typeId) {
        likeDao.update_comment_add(typeId);
    }

    @Override
    public void update_comment_sub(Integer typeId) {

    }


//    删除评论的点赞
    @Override
    public Integer delete_like(Integer userId, Integer typeId, Integer type) {
        Integer delresult = likeDao.delete_like(userId, typeId, type);
        return delresult;
    }
//更新取消菜品点赞的信息
    @Override
    public void update_dish_sub(Integer typeId) {
        likeDao.update_dish_sub(typeId);
    }
}
