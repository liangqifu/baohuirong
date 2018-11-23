package com.enterprise.controller.manage;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.enterprise.cache.FrontCache;
import com.enterprise.controller.BaseController;
import com.enterprise.entity.ArticleCategory;
import com.enterprise.entity.TreeNode;
import com.enterprise.entity.page.PageModel;
import com.enterprise.service.ArticleCategoryService;
import com.enterprise.service.Services;

/**
 * 文章分类Action
 */
@Controller
@RequestMapping("/manage/articleCategory/")
public class ArticleCategoryAction extends BaseController<ArticleCategory>{
    private static final String page_toList = "/manage/articleCategory/articleCategoryList";
    private static final String page_toEdit = "/manage/articleCategory/articleCategoryEdit";
    private static final String page_toAdd = "/manage/articleCategory/articleCategoryEdit";
    private static final String page_toOpen = "/manage/articleCategory/articleCategoryOpen";
    @Autowired
    private ArticleCategoryService articleCategoryService;
    @Autowired
    private FrontCache frontCache;
    @Override
    public Services<ArticleCategory> getService() {
        return articleCategoryService;
    }
    public ArticleCategoryAction(){
        super.page_toList = page_toList;
        super.page_toEdit = page_toEdit;
        super.page_toAdd = page_toAdd;
    }
    @RequestMapping("articleCategoryOpen")
	public String articleCategoryOpen(HttpServletRequest request) throws Exception {
		return page_toOpen;
	}
    
    @RequestMapping("selectList")
    @Override
	public String selectList(HttpServletRequest request, ArticleCategory e) throws Exception {
    	List<ArticleCategory> list = articleCategoryService.selectList(e);
		request.setAttribute("list", list);
		request.setAttribute("parentid", e.getParentid());
		return page_toList;
	}
    
	@RequestMapping(value = "getListAll",method = RequestMethod.GET)
	@ResponseBody
	public List<TreeNode> getListAll(HttpServletRequest request) throws Exception{
		ArticleCategory e = new ArticleCategory();
		List<ArticleCategory> list = articleCategoryService.selectList(e);
		List<TreeNode> treeNodes = new ArrayList<TreeNode>(list.size());
		treeNodes.add(new TreeNode("0","", "根节点", true, false, false));
		for (ArticleCategory articleCategory : list) {
			
			treeNodes.add(new TreeNode(articleCategory.getId()+"", articleCategory.getParentid()+"", articleCategory.getCatename(), false, false, false));
		}
		return treeNodes;
	}
	
	@RequestMapping(value = "getUseListAll",method = RequestMethod.GET)
	@ResponseBody
	public List<TreeNode> getUseListAll(HttpServletRequest request) throws Exception{
		ArticleCategory e = new ArticleCategory();
		List<ArticleCategory> list = articleCategoryService.selectList(e);
		List<TreeNode> treeNodes = new ArrayList<TreeNode>(list.size());
		for (ArticleCategory articleCategory : list) {
			if("应用领域".equals(articleCategory.getCatename())) {
				continue;
			}
			if(!String.valueOf(articleCategory.getParentid()).equals("34")) {
				treeNodes.add(new TreeNode(articleCategory.getId()+"", articleCategory.getParentid()+"", articleCategory.getCatename(), true, false, false));
			}
		}
		return treeNodes;
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
	public String toAdd(@ModelAttribute("e") ArticleCategory e,ModelMap model) throws Exception{
		model.addAttribute("e", e);
		return page_toAdd;
	}

    @RequestMapping(value="save",method=RequestMethod.POST)
    public String save(HttpServletRequest request, @ModelAttribute("e") ArticleCategory e, RedirectAttributes flushAttrs) throws Exception {
    	if(e.getId() == 0) {
        	articleCategoryService.insert(e);
        }else {
        	articleCategoryService.update(e);
        }
        addMessage(flushAttrs,"操作成功！");
        frontCache.loadArticleCategroy();//加载缓存
        
        return "redirect:selectList?parentid="+e.getParentid();
    }
    
    @RequestMapping("delete")
    public String delete(HttpServletRequest request, @ModelAttribute("e") ArticleCategory articleCategory, RedirectAttributes flushAttrs) throws Exception{
        articleCategoryService.delete(articleCategory);
        insertAfter(articleCategory);
        addMessage(flushAttrs, "操作成功！");
        frontCache.loadArticleCategroy();//加载缓存
        return "redirect:selectList?parentid="+articleCategory.getParentid();
    }
    @RequestMapping(value="unique",method=RequestMethod.POST)
    @ResponseBody
    public String unique(@ModelAttribute("e") ArticleCategory e,HttpServletResponse response) throws IOException {
        response.setCharacterEncoding("utf-8");//设置响应编码为utf-8
        if(StringUtils.isNotBlank(e.getCatename())){
            ArticleCategory articleCategory = new ArticleCategory();
            articleCategory.setCatename(e.getCatename());
            articleCategory.setParentid(e.getParentid());
            articleCategory = articleCategoryService.selectOne(articleCategory);
            if(articleCategory==null){
                return "{}";
            }else{
                if(e.getId()!=0 && e.getId()==articleCategory.getId()){
                    return "{}";
                }else {
                    return "{\"error\":\"分类名称已经存在!\"}";
                }
            }
        }else if(StringUtils.isNotBlank(e.getCode())){
            ArticleCategory articleCategory = new ArticleCategory();
            articleCategory.setCode(e.getCode());
            articleCategory.setParentid(e.getParentid());
            articleCategory = articleCategoryService.selectOne(articleCategory);
            if(articleCategory==null){
                return "{}";
            }else{
                if(e.getId()!=0 && e.getId()==articleCategory.getId()){
                    return "{}";
                }else {
                    return "{\"error\":\"编码已经存在!\"}";
                }
            }
        }
        return null;
    }
}
