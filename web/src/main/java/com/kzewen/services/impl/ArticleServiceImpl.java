package com.kzewen.services.impl;


import com.kzewen.common.PageBean;
import com.kzewen.dao.ArticleMapper;
import com.kzewen.entity.Article;

import com.kzewen.services.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
public class ArticleServiceImpl implements ArticleService {
    @Autowired
    ArticleMapper articleMapper;

    @Override
    public List<Article> findAllByKey(String key) {
        List<Article> articleList = articleMapper.finByKey(key);
        return articleList;
    }

    @Override
    public PageBean<Article> findAll(Integer pageNum, Integer pageSize) {
        PageBean<Article> pageBean = new PageBean<>();
        //分页查询
        System.out.println("第"+pageNum+"页");
        System.out.println("每页显示："+pageSize+"条");
        List<Article> list = articleMapper.select(null);
        //实现反转，第一页显示的是最新文章
        Collections.reverse(list);
        //越界则不提供分页
        int totalSize = list.size();
        int totalPage = list.size() / pageSize + 1;//总页数
       // if(pageNum>totalPage || pageNum * pageSize >totalSize) return null;
        //开始分页
        List<Article> res = new ArrayList<>();
        //当前页面第一条是数据库中的第几条，数据库从0开始，页面从1开始
        int start = pageNum * pageSize - pageSize;
        //当前页面最后一条是数据库中的第几条
        int end = pageNum * pageSize;

        if(pageNum * pageSize > totalSize){ //会产生数组越界
            for(int i = start;i < start+totalSize-start;i++){
                res.add(list.get(i));
            }
        }else {
            for (int i = start; i < end; i++) {
                res.add(list.get(i));
            }
        }
        pageBean.setCurrentPage(pageNum);
        pageBean.setPageSize(pageSize);
        pageBean.setTotalPage(totalPage);
        pageBean.setTotalSize(totalSize);
        pageBean.setList(res);
        return pageBean;
    }



    @Transactional
    @Override
    public int addArticle(Article article) {
        return articleMapper.insert(article);
    }

    @Override
    public void deleteById(Long id) {
        articleMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void updateById(Article article) {
        articleMapper.updateByPrimaryKeySelective(article);
    }

    @Override
    public Article findOneById(Long id) {
        return articleMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Article> findAll() {
        return articleMapper.select(null);
    }

    @Override
    public List<Article> findArticleByTitle(String title) {
        Article article = new Article();
        article.setTitle(title);
        return articleMapper.select(article);
    }

    @Override
    public List<Article> findArticleByCategory(String category) {
        Article article = new Article();
        article.setCategory(category);
        return articleMapper.select(article);
    }



}
