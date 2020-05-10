package com.kzewen.services.impl;

import com.kzewen.dao.AdminMapper;
import com.kzewen.entity.Admin;
import com.kzewen.services.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;

    @Override
    public Admin login(Admin admin) {
        /*return adminMapper.login(admin);*/
        return adminMapper.selectOne(admin);
    }
}
