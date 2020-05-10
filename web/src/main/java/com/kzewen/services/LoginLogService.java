package com.kzewen.services;

import com.kzewen.entity.LoginLog;

import java.util.Date;
import java.util.List;

public interface LoginLogService {
    /**
     * 添加日志
     * @param loginLog
     * @return
     */
    int add(LoginLog loginLog);

    /**
     * 查询所有日志
     * @return
     */
    List<LoginLog> findAll();

    /**
     * 根据登录日期查询当日所有登录日志
     * @param loginDate
     * @return
     */
    List<LoginLog> findAllByLoginDate(Date loginDate);
}
