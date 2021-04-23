package com.service;

import com.bean.Announcement;
import com.bean.User;


public interface UserService {
    public void saveUser(User user);

    public boolean queryUserByUsername(String username);

    public User queryUserByUsernameAndPwd(User user);

    public void EditUserInfo(User user);

    public Announcement queryAnnounceMent();
}
