package com.service;

import com.bean.Dish;

public interface DishService {
    public void addDish(Dish dish);

    public Dish queryDishById(Integer dishId);

    public void editDishInfo(Dish dish);

    public void removeDish(Integer dishId);
}
