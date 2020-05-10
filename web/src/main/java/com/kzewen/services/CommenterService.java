package com.kzewen.services;

import com.kzewen.entity.Commenter;

public interface CommenterService {
    /**
     * 添加评论者
     * @param commenter
     * @return
     */
    int addCommenter(Commenter commenter);

    /**
     * 通过邮箱查找评论者
     * @param email
     * @return
     */
    Commenter findByEmail(String email);

    /**
     * 通过昵称查找评论者
     * @param nickName
     * @return
     */
    Commenter findByNickName(String nickName);

    /**
     * 通过ID查找评论者
     * @param id
     * @return
     */
    Commenter findById(Long id);
}
