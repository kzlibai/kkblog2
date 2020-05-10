package com.kzewen.controller;

import com.kzewen.common.PageBean;
import com.kzewen.entity.Admin;
import com.kzewen.entity.Article;
import com.kzewen.services.ArticleService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Controller
public class ArticleController {
    private final static Logger log = Logger.getLogger(ArticleController.class);
    @Autowired
    ArticleService articleService;

    @RequestMapping("/findAllByPage")
    public String findAllByPage(Model model, @RequestParam(value = "pageNum", required = false) Integer pageNum,
                                @RequestParam(value = "pageSize", required = false) Integer pageSize) {
        log.info("================进入/findAllByPage=======");
        PageBean<Article> pageBean = articleService.findAll(pageNum, pageSize);
        model.addAttribute("pageBean", pageBean);
        return "../index";

    }

    @RequestMapping("/article")
    public String article(Model model, HttpServletRequest request,@RequestParam(value = "title", required = false) String title) {
        List<Article> articleList = articleService.findArticleByTitle(title);
        Article article = articleList.get(0);
        request.getSession().setAttribute("article",article);
        model.addAttribute("article", article);
        return "../article";
    }

    //增加
    @RequestMapping("/doWriteBlog")
    public String writeBlog(Model model,HttpServletRequest request,
                            Article article){


        //直接将管理员id写死，因为只是我一个人
        article.setAdminId((long) 1);

        if(articleService.findOneById(article.getId())==null){//全新的文章
        articleService.addArticle(article);//加入数据库
        }else{
            articleService.updateById(article);//更新文章
        }

        request.getSession().setAttribute("article",article);
        model.addAttribute("article",article);
        return "../article";
    }
//删除
    @RequestMapping("/deleteBlog")
    public String deleteBlog(Model model, HttpServletRequest request) {
        Article article = (Article) request.getSession().getAttribute("article");
        articleService.deleteById(article.getId());
        return "../index";
    }
    //修改
    @RequestMapping("/updateBlog")
    public String updateBlog(Model model, HttpServletRequest request) {
        Article article = (Article) request.getSession().getAttribute("article");
        model.addAttribute("articleUpdate",article);
        request.getSession().setAttribute("articleUpdate",article);
        return "update";
    }

    //查询
    @RequestMapping("/findBlog")
    public String findBlog(Model model, HttpServletRequest request,
                            @RequestParam(value = "keyword" ,required = false)String keyword ) {
        List<Article> articleList = articleService.findAllByKey(keyword);
        log.info("================进入/findAllByPage=======");

        model.addAttribute("articleList", articleList);
        return "../result";

    }




    @RequestMapping("/write")
    public String write(Model model, HttpServletRequest request) {
        Admin admin = (Admin) request.getSession().getAttribute("admin");
        model.addAttribute(admin);
        return "write";
    }




}


