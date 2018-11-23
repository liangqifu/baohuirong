package com.enterprise.entity;

import com.enterprise.entity.page.PageModel;

import java.io.Serializable;

/**
 * 文章分类实体类
 */
public class ArticleCategory extends PageModel implements Serializable{
    private static final long serialVersionUID = 1L;
    private String catename;        //分类名
    private int orders;             //排序
    private String code;            //编码
    private String description;     //描述
    private Integer parentid;	//

    @Override
    public void clean() {
        super.clean();
        catename=null;
        orders = 0;
        code = null;
        description=null;
    }
    
    public ArticleCategory() {
    	
	}
    
    public ArticleCategory(Integer parentid) {
		this.parentid = parentid;
	}


	public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCatename() {
        return catename;
    }

    public void setCatename(String catename) {
        this.catename = catename;
    }

    public int getOrders() {
        return orders;
    }

    public void setOrders(int orders) {
        this.orders = orders;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

	public Integer getParentid() {
		return parentid;
	}

	public void setParentid(Integer parentid) {
		this.parentid = parentid;
	}
    
}
