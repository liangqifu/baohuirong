package com.enterprise.controller.front;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.enterprise.core.SystemManage;
import com.enterprise.entity.Article;
import com.enterprise.entity.Navigation;
import com.enterprise.service.ArticleService;

/**
 * 主页
 */
@Controller
@RequestMapping("/")
public class IndexAction {
	@Autowired
	private ArticleService articleService;
    @RequestMapping({"/", "/index"})
    public String index(ModelMap model) {
    	Navigation news = SystemManage.getInstance().getNavigation("3");
    	for (Navigation child : news.getChildren()) {
    		child.setArticles(getTopArticles(child.getId(),0,5));
		}
    	model.addAttribute("news", news);
    	Navigation technology = SystemManage.getInstance().getNavigation("5");
    	for (Navigation child : technology.getChildren()) {
    		child.setArticles(getTopArticles(child.getId(),0,5));
		}
    	model.addAttribute("technology", technology);
    	Navigation army = SystemManage.getInstance().getNavigation("6");
    	for (Navigation children : army.getChildren()) {
    		for (Navigation child : children.getChildren()) {
    			child.setArticles(getTopArticles(child.getId(),0,5));
    		}
		}
    	model.addAttribute("army", army);
    	Navigation industry = SystemManage.getInstance().getNavigation("4");
    	for (Navigation child : industry.getChildren()) {
    		child.setArticles(getTopArticles(child.getId(),0,5));
    		child.setArticles2(getTopArticles(child.getId(),5,5));
		}
    	model.addAttribute("industry", industry);
    	
    	Navigation service = SystemManage.getInstance().getNavigation("7");
    	for (Navigation child : service.getChildren()) {
    		child.setArticles(getTopArticles(child.getId(),0,5));
    		child.setArticles2(getTopArticles(child.getId(),5,5));
		}
    	model.addAttribute("service", service);
    	
        return "/front/index";
    }
    
    private List<Article> getTopArticles(String categoryId,int offset ,int pageSize){
    	Article e = new Article();
		e.setCategoryId(categoryId);
		e.setStatus("y");
		e.setOffset(offset);
		e.setPageSize(pageSize);
		e.setOrderBy("createtime");
		e.setSort("DESC");
		return articleService.selectPageList(e).getList();
    }

}

