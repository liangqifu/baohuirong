package com.enterprise.controller.manage;

import com.enterprise.service.Services;
import com.enterprise.entity.Article;
import com.enterprise.entity.ArticleCategory;
import com.enterprise.service.ArticleCategoryService;
import com.enterprise.service.ArticleService;
import com.enterprise.controller.BaseController;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * 文章管理Action
 */
@Controller
@RequestMapping("/manage/article/")
public class ArticleAction extends BaseController<Article>{
    private static final String page_toList = "/manage/article/articleList";
    private static final String page_toEdit = "/manage/article/articleEdit";
    private static final String page_toAdd = "/manage/article/articleEdit";
    @Autowired
    private ArticleService articleService;
    @Autowired
    private ArticleCategoryService articleCategoryService;
    @Override
    public Services<Article> getService() {
        return articleService;
    }
    private ArticleAction(){
        super.page_toList = page_toList;
        super.page_toEdit = page_toEdit;
        super.page_toAdd = page_toAdd;
    }
    
    /**
	 * 转到添加页面
	 * @param e
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("toAdd")
	@Override
	public String toAdd(@ModelAttribute("e") Article e,ModelMap model) throws Exception{
		e.clean();
		model.addAttribute("categoryList", articleCategoryService.selectList(new ArticleCategory(34)));
		return page_toAdd;
	}
	
	/**
	 * 插入数据
	 * @param request
	 * @param e
	 * @param flushAttrs
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="save",method=RequestMethod.POST)
	public String save(HttpServletRequest request , @ModelAttribute("e") Article e,RedirectAttributes flushAttrs) throws Exception{
		if(e.getId() == 0) {
			getService().insert(e);
		}else {
			getService().update(e);
		}
		addMessage(flushAttrs,"操作成功！");
		return "redirect:selectList";
	}
	
	
	@RequestMapping(value="delete",method = RequestMethod.GET)
	public String delete(HttpServletRequest request,@ModelAttribute("e") Article e,RedirectAttributes flushAttrs) throws Exception{
		getService().delete(e);
		addMessage(flushAttrs,"操作成功！");
		return "redirect:selectList";
	}
	


}
