package com.kzewen.interceptor;


import com.kzewen.common.PageBean;
import com.kzewen.dao.ArticleMapper;
import com.kzewen.entity.Article;
import com.kzewen.services.ArticleService;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.*;
import java.io.IOException;

public class IndexJspFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        System.out.println("自定义过滤器======================================");
        ServletContext context = request.getServletContext();
        ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(context);
        //ArticleMapper articleMapper = applicationContext.getBean(ArticleMapper.class);
        //filter 初始化时，注解的 bean 还没初始化，加 @Autowired 注解不会起作用，
        //所以通过 ApplicationContext 手动获取 UserContentMapper 对象。
        ArticleService articleService = applicationContext.getBean(ArticleService.class);
        PageBean<Article> pageBean = articleService.findAll(1,5);//默认值
        request.setAttribute("pageBean",pageBean);
        chain.doFilter(request,response);
    }

    @Override
    public void destroy() {

    }
}
