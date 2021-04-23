package com.bean;

import java.util.Date;

/**
 * @Author JXY
 * @Date 2021/4/17 14:00
 * @Version 1.0
 **/
public class Announcement {
    private int aid;
    private String announcement;
    private String createtime;

    public String getAnnouncement() {
        return announcement;
    }

    public void setAnnouncement(String announcement) {
        this.announcement = announcement;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public int getAid() {
        return aid;
    }

    public void setAid(int aid) {
        this.aid = aid;
    }

    @Override
    public String toString() {
        return "Announcement{" +
                "aid=" + aid +
                ", announcement='" + announcement + '\'' +
                ", createtime=" + createtime +
                '}';
    }
}
