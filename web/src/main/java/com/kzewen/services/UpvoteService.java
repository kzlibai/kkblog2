package com.kzewen.services;


import com.kzewen.entity.Upvote;

import java.util.List;

public interface UpvoteService {
    /**
     * 添加点赞
     * @param upvote
     * @return
     */
    int addUpvote(Upvote upvote);

    /**
     * 根据文章id删除对应的点赞
     * @param articleId
     */
    void deleteByArticleId(Long articleId);

    /**
     * 更新点赞
     * @param upvote
     */
    void updateUpvote(Upvote upvote);

    /**
     * 根据文章id查询所有的点赞
     * @param articleId
     * @return
     */
    List<Upvote> findByArticleId(Long articleId);

    /**
     * 根据点赞者id查询所有的点赞
     * @param commenterId
     * @return
     */
    List<Upvote> findByCommenterId(Long commenterId);
}
