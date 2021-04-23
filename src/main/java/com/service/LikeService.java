package com.service;

public interface LikeService {

     Integer query_dish(Integer userId, Integer typeId);

    Integer add_like(Integer userId, Integer typeId, Integer type);

    void update_dish_add(Integer typeId);

    Integer query_comment(Integer userId, Integer typeId);

    void update_comment_add(Integer typeId);

    void update_comment_sub(Integer typeId);

    Integer delete_like(Integer userId, Integer typeId, Integer type);

    void update_dish_sub(Integer typeId);
}
