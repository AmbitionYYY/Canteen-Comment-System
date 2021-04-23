package com.dao;

import com.bean.Dish;

public interface DishDao {
    public void insertDish(Dish dish);

    public Dish selectDishById(Integer dishId);

    public void updateDishInfo(Dish dish);

    public void deleteDish(Integer dishId);
}
