package com.kzewen.controller;

import com.kzewen.entity.Admin;
import com.kzewen.services.AdminService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class AdminController {
    private final static Logger log = Logger.getLogger(AdminController.class);

    @Autowired
    AdminService adminService;

    @RequestMapping("/login")
    @ResponseBody
    public Object login(Model model, HttpServletRequest request, @RequestBody Admin admin){//@RequestBody：把json数据封装称对应对象进行转化
        //log.info("admin:---------------"+admin.toString());
        Admin res = adminService.login(admin);
        if(res == null){
            return "error";
        }else{
            //用户登录成功后，在return语句之前将用户信息保存入session中
            //session有效期为15分钟，在web.xml中可以配置
            request.getSession().setAttribute("admin",admin);
            //model.addAttribute("admin",admin);
            log.info("登录成功");
            return "ok";
        }
    }


    @RequestMapping("/loginOut")
    public String loginOut(Model model, HttpServletRequest request){
        log.info("退出登录");
        request.getSession().removeAttribute("admin");

        return "../index";
    }
}
