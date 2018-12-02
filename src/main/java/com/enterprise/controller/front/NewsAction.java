package com.enterprise.controller.front;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.enterprise.core.SystemManage;
import com.enterprise.entity.Article;
import com.enterprise.entity.ArticleCategory;
import com.enterprise.entity.Navigation;
import com.enterprise.entity.page.PageModel;
import com.enterprise.service.ArticleService;


@Controller
@RequestMapping("/")
public class NewsAction {
	 @Autowired
	 private ArticleService articleService;
     @RequestMapping(value="newsList",method = RequestMethod.GET)
     public String newsList(HttpServletRequest request, @RequestParam("parentCategoryId") String parentCategoryId,@RequestParam("categoryId")String categoryId) throws Exception{
    	Navigation navigation = SystemManage.getInstance().getNavigation(parentCategoryId);
    	request.setAttribute("navigation", navigation);
    	String firstCategoryId = categoryId;
    	List<Navigation> children =  navigation.getChildren();
    	if(!CollectionUtils.isEmpty(children)) {
    		firstCategoryId = children.get(0).getId();
    		for (Navigation child : children) {
    			if(String.valueOf(child.getId()).equals(categoryId)) {
    				request.setAttribute("curNavigation", child);
    				break;
    			}
			}
    	}
    	request.setAttribute("firstCategoryId",firstCategoryId );
    	request.setAttribute("parentCategoryId", parentCategoryId);
    	request.setAttribute("categoryId", categoryId);
    	
    	int offset = 0;
        if(request.getParameter("offset")!=null){
            offset = Integer.parseInt(request.getParameter("offset"));
        }
        if(offset < 0){
            offset=0;
        }
        Article article = new Article();
        article.setCategoryId(categoryId);
        article.setStatus("y");
        article.setOrderBy("createtime");
        article.setSort("DESC");
        article.setOffset(offset);

        PageModel page = articleService.selectPageList(article);
        if(page == null){
            page = new PageModel();
        }
        page.setOffset(offset);
        page.setPagerSize(page.getPageSize() == 0 ? 0 : (int)Math.ceil((double)page.getTotal()/page.getPageSize()));
        
        page.setPagerUrl("newsList?parentCategoryId="+parentCategoryId+"&categoryId="+categoryId);
        request.setAttribute("pager", page);
    	return "/front/newsList";
    }
     
     
     @RequestMapping(value="detail",method = RequestMethod.GET)
     public String detail(HttpServletRequest request, @RequestParam("parentCategoryId") String parentCategoryId,@RequestParam("categoryId")String categoryId,@RequestParam("id")String id) throws Exception{
    	Navigation navigation = SystemManage.getInstance().getNavigation(parentCategoryId);
    	request.setAttribute("navigation", navigation);
    	String firstCategoryId = categoryId;
    	List<Navigation> children =  navigation.getChildren();
    	if(!CollectionUtils.isEmpty(children)) {
    		firstCategoryId = children.get(0).getId();
    		for (Navigation child : children) {
    			if(String.valueOf(child.getId()).equals(categoryId)) {
    				request.setAttribute("curNavigation", child);
    				break;
    			}
			}
    	}
    	request.setAttribute("firstCategoryId",firstCategoryId );
    	request.setAttribute("parentCategoryId", parentCategoryId);
    	request.setAttribute("categoryId", categoryId);
    	
    	Article e = articleService.selectById(Integer.parseInt(id));
        e.setHit(String.valueOf(Integer.parseInt(e.getHit())+1));
        articleService.update(e);       //更新浏览量     --优化建议：可使用缓存或者redis暂存  然后再刷入数据库
        Article next = articleService.selectNext(Integer.parseInt(id));
        if(next==null){
            next = new Article();
        }
        Article previous = articleService.selectPrevious(Integer.parseInt(id));
        if(previous==null){
            previous = new Article();
        }
        request.setAttribute("e", e);
        request.setAttribute("next", next);
        request.setAttribute("previous", previous);
       
    	return "/front/detail";
    }

}
