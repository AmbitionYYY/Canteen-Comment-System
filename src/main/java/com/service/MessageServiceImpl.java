package com.service;

import com.bean.Message;
import com.bean.User;
import com.dao.MessageDao;
import com.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MessageServiceImpl implements MessageService {
    @Autowired
    MessageDao messageDao;
    @Autowired
    UserDao userDao;

    @Override
    public void addMessage(Message message) {
        messageDao.insertMessage(message);
    }

    @Override
    public List<Message> queryMessageByUsername(String username) {
        User user = userDao.selectUserByUserName(username);
        Integer userid = user.getUserid();
        List<Message> msgList = messageDao.selectMessageByUsername(userid);

        return msgList;
    }
}
