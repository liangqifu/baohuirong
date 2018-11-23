package com.enterprise.entity;

import com.enterprise.entity.page.PageModel;

import java.io.Serializable;

/**
 * 关于我们
 */
public class About extends PageModel implements Serializable{
    private static final long serialVersionUID = 1L;
    private String contentHtml;
    private String title;
    private Integer orders;

    @Override
    public void clean() {
        super.clean();
        contentHtml=null;
        title=null;
    }

    public String getContentHtml() {
        return contentHtml;
    }

    public void setContentHtml(String contentHtml) {
        this.contentHtml = contentHtml;
    }

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getOrders() {
		return orders;
	}

	public void setOrders(Integer orders) {
		this.orders = orders;
	}
	
    
}
