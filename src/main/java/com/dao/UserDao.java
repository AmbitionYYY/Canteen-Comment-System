package com.dao;

import com.bean.Announcement;
import com.bean.User;

public interface UserDao {
    public void insertUser(User user);

    public User selectUserByUserName(String username);

    public void updateUserInfo(User user);

    public Announcement selectAnnounceMent();
}
