package com.kzewen.services.impl;

import com.kzewen.dao.UpvoteMapper;
import com.kzewen.entity.Upvote;
import com.kzewen.services.UpvoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UpvoteServiceImpl implements UpvoteService {

    @Autowired
    UpvoteMapper upvoteMapper;

    @Override
    public int addUpvote(Upvote upvote) {
        return upvoteMapper.insert(upvote);
    }

    @Override
    public void deleteByArticleId(Long articleId) {
        Upvote upvote = new Upvote();
        upvote.setArticleId(articleId);
        upvoteMapper.deleteByExample(upvote);
    }

    @Override
    public void updateUpvote(Upvote upvote) {
        upvoteMapper.updateByPrimaryKey(upvote);
    }

    @Override
    public List<Upvote> findByArticleId(Long articleId) {
        Upvote upvote = new Upvote();
        upvote.setArticleId(articleId);
        return upvoteMapper.selectByExample(upvote);
    }

    @Override
    public List<Upvote> findByCommenterId(Long commenterId) {
        Upvote upvote = new Upvote();
        upvote.setCommenterId(commenterId);
        return upvoteMapper.selectByExample(upvote);
    }
}
