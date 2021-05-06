package com.dao;

import com.bean.*;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

public interface AdminDao {
    public Admin selectAdminByAdminname(String adminname);

    public List<Dish> selectAllDishes(@RequestParam("dishName")String dishName);

    void deleteCommentBycommentId(@RequestParam("commentId") Integer commentId);

//    通过评论id查菜品id
    Integer selectCommentBycommentId(Integer commentId);

    void updateAnnouncement(Announcement announcement);

    List<Message> selectMessage();

    void removeMessageByMid(int mid);

    List<User> selectAllUnregisterUsers();

    void passRegisterUser(Integer userid);
}
