package com.enterprise.service;

import com.enterprise.entity.ArticleCategory;

/**
 */
public interface ArticleCategoryService extends Services<ArticleCategory>{
	public int selectCount(ArticleCategory e) ;
}
