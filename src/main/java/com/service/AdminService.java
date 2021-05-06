package com.service;

import com.bean.*;
import com.github.pagehelper.PageInfo;

import java.util.List;


public interface AdminService {

    public Admin queryAdminByAdminnameAndPwd(Admin admin);

    public PageInfo<Dish> queryAllDishes(Integer currentPage,String dishName);

    void removeCommentBycommentId(Integer commentId);

    void editAnnouncement(Announcement announcement);

     PageInfo<Message> queryMessage(Integer currentPage);

    void delMessageByMid(int mid);

    List<User> queryAllUnregisterUsers();

    void passRegister(Integer userid);
}
