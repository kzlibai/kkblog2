package com.kzewen.services.impl;

import com.kzewen.dao.CommenterMapper;
import com.kzewen.entity.Commenter;
import com.kzewen.services.CommenterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommenterServiceImpl implements CommenterService {
    @Autowired
    CommenterMapper commenterMapper;

    @Override
    public int addCommenter(Commenter commenter) {
        return commenterMapper.insert(commenter);
    }

    @Override
    public Commenter findByEmail(String email) {
        Commenter commenter = new Commenter();
        commenter.setEmail(email);
        return commenterMapper.selectOne(commenter);
    }

    @Override
    public Commenter findByNickName(String nickName) {
        Commenter commenter = new Commenter();
        commenter.setNickName(nickName);
        return commenterMapper.selectOne(commenter);
    }

    @Override
    public Commenter findById(Long id) {
        return commenterMapper.selectByPrimaryKey(id);
    }
}
