package com.service;

import com.bean.Announcement;
import com.bean.User;
import com.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    @Override
    public void saveUser(User user) {
        userDao.insertUser(user);
    }

    @Override
    public boolean queryUserByUsername(String username) {

        User user = userDao.selectUserByUserName(username);
        if (user != null) {
            return true;
        } else
            return false;
    }

    @Override
    public User queryUserByUsernameAndPwd(User u) {
//        u为传回来的用户对象，us为数据库中的用户对象
        User us = userDao.selectUserByUserName(u.getUsername());
        if (us != null) {
            String password = us.getPassword();
            if (password.equals(u.getPassword())) {
                //防止被获取密码数据，直接给赋空值
                //此处因修改资料时需要用到password值故注释
                // us.setPassword("");
                return us;
            }
        }
        return null;
    }

    @Override
    public void EditUserInfo(User user) {
      /* String avatar= user.getAvatar().toString();
       System.out.println("看看经过转换到字符串的头像："+avatar);
       user.setAvatar(avatar);*/
        userDao.updateUserInfo(user);
    }

    /**
     * @Description 查询校园公告内容
     * @Author JXY
     * @Date 13:57 2021/4/17
     * @param
     * @return 校园公告信息
     **/
    @Override
    public Announcement queryAnnounceMent() {
        Announcement announcement = userDao.selectAnnounceMent();
        return announcement;
    }
}
