package com.kzewen.dao;

import com.kzewen.entity.Article;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface ArticleMapper extends Mapper<Article> {
    List<Article> finByKey(@Param("title") String key);
}
