package com.kzewen.services.impl;

import com.kzewen.dao.CommentMapper;
import com.kzewen.entity.Comment;
import com.kzewen.services.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class CommentServiceImpl implements CommentService {
    @Autowired
    CommentMapper commentMapper;

    @Override
    public int addComment(Comment comment) {
        return commentMapper.insert(comment);
    }

    @Override
    public List<Comment> findAll(Long article_id) {
        Comment comment = new Comment();
        comment.setArticleId(article_id);
        return commentMapper.selectByExample(comment);
    }

    @Override
    public void deleteById(Long id) {
        Comment comment = new Comment();
        comment.setId(id);
        commentMapper.updateByPrimaryKeySelective(comment);
    }

    @Override
    public void deleteByArticleId(Long id) {
        commentMapper.deleteByPrimaryKey(id);
    }
}
