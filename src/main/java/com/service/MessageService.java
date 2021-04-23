package com.service;

import com.bean.Message;

import java.util.List;

public interface MessageService {
     void addMessage(Message message);

     List<Message> queryMessageByUsername(String username);
}
