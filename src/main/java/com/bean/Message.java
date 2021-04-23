package com.bean;

import java.util.Date;

public class Message {
    private int mid;
    private String feedbackTitle;
    private String address;
    private String email;
    private String phoneNumber;
    private String qq;
    private int userid;
    private String feedbackContent;
    private String createtime;
    private int ResolveType;

    public int getMid() {
        return mid;
    }

    public void setMid(int mid) {
        this.mid = mid;
    }

    public int getResolveType() {
        return ResolveType;
    }

    public void setResolveType(int resolveType) {
        ResolveType = resolveType;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public String getFeedbackTitle() {
        return feedbackTitle;
    }

    public void setFeedbackTitle(String feedbackTitle) {
        this.feedbackTitle = feedbackTitle;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getFeedbackContent() {
        return feedbackContent;
    }

    public void setFeedbackContent(String feedbackContent) {
        this.feedbackContent = feedbackContent;
    }

    @Override
    public String toString() {
        return "Message{" +
                "mid=" + mid +
                ", feedbackTitle='" + feedbackTitle + '\'' +
                ", address='" + address + '\'' +
                ", email='" + email + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", qq='" + qq + '\'' +
                ", userid=" + userid +
                ", feedbackContent='" + feedbackContent + '\'' +
                ", createtime='" + createtime + '\'' +
                ", ResolveType=" + ResolveType +
                '}';
    }
}
