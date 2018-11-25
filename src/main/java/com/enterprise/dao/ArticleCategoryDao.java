package com.enterprise.dao;


import com.enterprise.entity.ArticleCategory;

/**
 */
public interface ArticleCategoryDao extends DaoManage<ArticleCategory>{
	public int selectCount(ArticleCategory e) ;
}
