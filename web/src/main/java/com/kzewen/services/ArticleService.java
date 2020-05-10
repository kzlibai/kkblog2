package com.kzewen.services;



import com.kzewen.common.PageBean;
import com.kzewen.entity.Article;
import org.springframework.web.multipart.MultipartFile;


import java.util.List;

public interface ArticleService {

    /**
     * 根据keyword模糊查询
     */
    List<Article> findAllByKey(String key);

    /**
     * 查询所有Article并进行分页
     * @param pageNum
     * @param pageSize
     * @return
     */
    PageBean<Article> findAll(Integer pageNum, Integer pageSize);

    /**
     * 添加博文
     * @param article
     * @return
     */
    int addArticle(Article article);

    /**
     * 根据博文id删除博文
     * @param id
     */
    void deleteById(Long id);

    /**
     * 根据博文id更新博文
     */
    void updateById(Article article);


    /**
     * 根据博文id查询博文
     */
    Article findOneById(Long id);

    /**
     * 查询所有博文
     * @return
     */
    List<Article> findAll();

    /**
     * 根据文章标题查找博文
     * @param title 博文标题
     * @return
     */
    List<Article> findArticleByTitle(String title);

    /**
     * 根据文章类型查找文章
     * @param category 博文类型
     * @return
     */
    List<Article> findArticleByCategory(String category);


}
