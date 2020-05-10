package com.kzewen.entity;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.Date;

public class Comment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Long articleId;

    private Long commenterId;

    private Date commentTime;

    private Long childrenComment;

    private Integer upvote;

    private String commentContent;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getArticleId() {
        return articleId;
    }

    public void setArticleId(Long articleId) {
        this.articleId = articleId;
    }

    public Long getCommenterId() {
        return commenterId;
    }

    public void setCommenterId(Long commenterId) {
        this.commenterId = commenterId;
    }

    public Date getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(Date commentTime) {
        this.commentTime = commentTime;
    }

    public Long getChildrenComment() {
        return childrenComment;
    }

    public void setChildrenComment(Long childrenComment) {
        this.childrenComment = childrenComment;
    }

    public Integer getUpvote() {
        return upvote;
    }

    public void setUpvote(Integer upvote) {
        this.upvote = upvote;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent == null ? null : commentContent.trim();
    }
}