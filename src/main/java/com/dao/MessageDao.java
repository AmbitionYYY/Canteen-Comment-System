package com.dao;

import com.bean.Message;

import java.util.List;

public interface MessageDao {

    void insertMessage(Message message);

    /**
     * @Description 根据用户名查反馈信息
     * @Author JXY
     * @Date 23:15 2021/4/14
     * @param
     * @return
     **/
    List<Message> selectMessageByUsername(Integer userid);
}
