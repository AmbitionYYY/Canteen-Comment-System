package com.bean;

public class Dish {
    private Integer dishid;
    private String name;
    private String avatar;
    private Double price;
    private String loc_Canteen;
    private String loc_Window;
    private String discription;
    private Integer likes;
    private Integer comments;

    public Integer getDishid() {
        return dishid;
    }

    public void setDishid(Integer dishid) {
        this.dishid = dishid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getLoc_Canteen() {
        return loc_Canteen;
    }

    public void setLoc_Canteen(String loc_Canteen) {
        this.loc_Canteen = loc_Canteen;
    }

    public String getLoc_Window() {
        return loc_Window;
    }

    public void setLoc_Window(String loc_Window) {
        this.loc_Window = loc_Window;
    }

    public String getDiscription() {
        return discription;
    }

    public void setDiscription(String discription) {
        this.discription = discription;
    }

    public Integer getLikes() {
        return likes;
    }

    public void setLikes(Integer likes) {
        this.likes = likes;
    }

    public Integer getComments() {
        return comments;
    }

    public void setComments(Integer comments) {
        this.comments = comments;
    }


    @Override
    public String toString() {
        return "Dish{" +
                "dishid=" + dishid +
                ", name='" + name + '\'' +
                ", avatar='" + avatar + '\'' +
                ", price=" + price +
                ", loc_Canteen='" + loc_Canteen + '\'' +
                ", loc_Window='" + loc_Window + '\'' +
                ", discription='" + discription + '\'' +
                ", likes=" + likes +
                ", comments=" + comments +
                '}';
    }
}
