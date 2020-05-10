package com.kzewen.entity;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.Date;

public class Upvote {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Long commenterId;

    private Long articleId;

    private String upvote;

    private String downvote;

    private Date voteTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getCommenterId() {
        return commenterId;
    }

    public void setCommenterId(Long commenterId) {
        this.commenterId = commenterId;
    }

    public Long getArticleId() {
        return articleId;
    }

    public void setArticleId(Long articleId) {
        this.articleId = articleId;
    }

    public String getUpvote() {
        return upvote;
    }

    public void setUpvote(String upvote) {
        this.upvote = upvote == null ? null : upvote.trim();
    }

    public String getDownvote() {
        return downvote;
    }

    public void setDownvote(String downvote) {
        this.downvote = downvote == null ? null : downvote.trim();
    }

    public Date getVoteTime() {
        return voteTime;
    }

    public void setVoteTime(Date voteTime) {
        this.voteTime = voteTime;
    }
}