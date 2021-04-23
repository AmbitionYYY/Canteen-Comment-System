package com.service;

import com.bean.Dish;
import com.dao.DishDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DishServiceImpl implements DishService {
    @Autowired
    private DishDao dishDao;

    //添加菜品
    @Override
    public void addDish(Dish dish) {
        dishDao.insertDish(dish);
    }

    //通过ID查找菜品信息
    @Override
    public Dish queryDishById(Integer dishId) {
        Dish dish = dishDao.selectDishById(dishId);
        dish.setDishid(dishId);
        return dish;
    }

    //    修改菜品信息功能
    @Override
    public void editDishInfo(Dish dish) {
        dishDao.updateDishInfo(dish);
    }

    //    删除菜品功能
    @Override
    public void removeDish(Integer dishId) {

        dishDao.deleteDish(dishId);
    }
}
