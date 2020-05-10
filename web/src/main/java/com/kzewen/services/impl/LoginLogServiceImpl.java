package com.kzewen.services.impl;

import com.kzewen.dao.LoginLogMapper;
import com.kzewen.entity.LoginLog;
import com.kzewen.services.LoginLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;


@Service
public class LoginLogServiceImpl implements LoginLogService {
    @Autowired
    LoginLogMapper loginLogMapper;

    @Override
    public int add(LoginLog loginLog) {
        return loginLogMapper.insert(loginLog);
    }

    @Override
    public List<LoginLog> findAll() {
        return loginLogMapper.select(null);
    }

    @Override
    public List<LoginLog> findAllByLoginDate(Date loginDate) {
        LoginLog loginLog = new LoginLog();
        loginLog.setLoginDate(loginDate);
        return loginLogMapper.selectByExample(loginLog);
    }
}
