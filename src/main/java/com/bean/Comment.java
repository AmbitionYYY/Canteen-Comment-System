package com.bean;

public class Comment {
    private int comment_id;    //评论id号 int
    private String username;   //用户名 varchar(10)
    private String content;    //评论内容 varcar(100)
    private String createtime; //评论时间 varchar(25)
    private int dishid; //评论菜品id
    private int score; //菜品得分
    private int userid;//用户id
    private int likes;//评论的点赞数

    @Override
    public String toString() {
        return "Comment{" +
                "comment_id=" + comment_id +
                ", username='" + username + '\'' +
                ", content='" + content + '\'' +
                ", createtime='" + createtime + '\'' +
                ", dishid=" + dishid +
                ", score=" + score +
                ", userid=" + userid +
                ", likes=" + likes +
                '}';
    }

    public int getLikes() {
        return likes;
    }

    public void setLikes(int likes) {
        this.likes = likes;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public int getComment_id() {
        return comment_id;
    }

    public void setComment_id(int comment_id) {
        this.comment_id = comment_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public int getDishid() {
        return dishid;
    }

    public void setDishid(int dishid) {
        this.dishid = dishid;
    }
}
