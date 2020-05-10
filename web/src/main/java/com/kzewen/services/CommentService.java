package com.kzewen.services;

import com.kzewen.entity.Comment;

import java.util.List;

public interface CommentService {
    /**
     * 添加评论
     * @param comment
     * @return
     */
    int addComment(Comment comment);

    /**
     * 通过博文id查询所有的评论
     * @param article_id
     * @return
     */
    List<Comment> findAll(Long article_id);

    /**
     * 根据ID删除评论
     * @param id
     */
    void deleteById(Long id);

    /**
     * 根据文章ID删除所有评论
     * @param id
     */
    void deleteByArticleId(Long id);
}
