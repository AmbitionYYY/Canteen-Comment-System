package com.service;

import com.bean.Admin;
import com.bean.Announcement;
import com.bean.Dish;
import com.bean.Message;
import com.github.pagehelper.PageInfo;

import java.util.List;


public interface AdminService {

    public Admin queryAdminByAdminnameAndPwd(Admin admin);

    public PageInfo<Dish> queryAllDishes(Integer currentPage);

    void removeCommentBycommentId(Integer commentId);

    void editAnnouncement(Announcement announcement);

     PageInfo<Message> queryMessage(Integer currentPage);

    void delMessageByMid(int mid);
}
