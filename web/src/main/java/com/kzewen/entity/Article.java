package com.kzewen.entity;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.Date;

public class Article {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Long adminId;

    private String title;

    private String category;

    private String isPrivate;

    private Date reportTime;

    private Integer upvote;

    private Integer downvote;

    private Integer commentNum;

    private String content;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getAdminId() {
        return adminId;
    }

    public void setAdminId(Long adminId) {
        this.adminId = adminId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category == null ? null : category.trim();
    }

    public String getIsPrivate() {
        return isPrivate;
    }

    public void setIsPrivate(String isPrivate) {
        this.isPrivate = isPrivate == null ? null : isPrivate.trim();
    }

    public Date getReportTime() {
        return reportTime;
    }

    public void setReportTime(Date reportTime) {
        this.reportTime = reportTime;
    }

    public Integer getUpvote() {
        return upvote;
    }

    public void setUpvote(Integer upvote) {
        this.upvote = upvote;
    }

    public Integer getDownvote() {
        return downvote;
    }

    public void setDownvote(Integer downvote) {
        this.downvote = downvote;
    }

    public Integer getCommentNum() {
        return commentNum;
    }

    public void setCommentNum(Integer commentNum) {
        this.commentNum = commentNum;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}