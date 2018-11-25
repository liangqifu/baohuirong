package com.enterprise.entity;

import java.util.List;

public class Navigation {
	private String id;
	private String name;
	private String url;
	private List<Navigation> children;
    private List<Article> articles;
    private List<Article> articles2;
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public List<Navigation> getChildren() {
		return children;
	}

	public void setChildren(List<Navigation> children) {
		this.children = children;
	}

	public List<Article> getArticles() {
		return articles;
	}

	public void setArticles(List<Article> articles) {
		this.articles = articles;
	}

	public List<Article> getArticles2() {
		return articles2;
	}

	public void setArticles2(List<Article> articles2) {
		this.articles2 = articles2;
	}
	

}
