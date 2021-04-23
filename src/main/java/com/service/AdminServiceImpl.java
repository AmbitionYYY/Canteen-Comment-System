package com.service;

import com.bean.*;
import com.dao.AdminDao;
import com.dao.CanteenDao;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminDao adminDao;
    @Autowired
    private CanteenDao canteenDao;

    @Override
    public Admin queryAdminByAdminnameAndPwd(Admin a) {
//        a为用户输入的管理员对象 ,ad为从数据库中查回来的管理员对象
        Admin ad = adminDao.selectAdminByAdminname(a.getAdminname());
        if (ad != null) {
            String password = ad.getAdminpassword();
            if (password.equals(a.getAdminpassword())) {
                //防止被获取密码数据，直接给赋空值
                ad.setAdminpassword("");
                return ad;
            }
        }
        return null;
    }

    //    查询并展示所有菜品信息
    @Override
    public PageInfo<Dish> queryAllDishes(Integer currentPage) {
// ***********使用分页插件必须遵守一下顺序**********

//      1.  设置当前页和每页显示的数据条数
        PageHelper.startPage(currentPage, 3);
//      2.  调用持久层方法
        List<Dish> dishList = adminDao.selectAllDishes();
//      3.  设置PageInfo对象，第二个对象是页面上显示的页码数量
        PageInfo<Dish> pageInfo = new PageInfo<>(dishList, 10);
        return pageInfo;
    }

    @Override
    public void removeCommentBycommentId(Integer commentId) {
        Integer dishId = adminDao.selectCommentBycommentId(commentId);
        adminDao.deleteCommentBycommentId(commentId);
        System.out.println("删除的评论的菜品id是"+dishId);
        canteenDao.updateDishInfo(dishId);
    }

    @Override
    public void editAnnouncement(Announcement announcement) {
        adminDao.updateAnnouncement(announcement);
    }


    /**
     * @Description 分页查询所有未解决的反馈
     * @Author JXY
     * @Date 18:49 2021/4/17
     * @param
     * @return
     **/
    @Override
    public PageInfo<Message> queryMessage(Integer currentPage) {

//      1.  设置当前页和每页显示的数据条数
        PageHelper.startPage(currentPage, 3);
//      2.  调用持久层方法
        List<Message> messageList = adminDao.selectMessage();
//      3.  设置PageInfo对象，第二个对象是页面上显示的页码数量
        PageInfo<Message> pageInfo = new PageInfo<>(messageList, 3);
        return pageInfo;
    }

    @Override
    public void delMessageByMid(int mid) {
        adminDao.removeMessageByMid(mid);
    }


}
