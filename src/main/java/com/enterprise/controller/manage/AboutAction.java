package com.enterprise.controller.manage;

import com.enterprise.cache.FrontCache;
import com.enterprise.service.Services;
import com.enterprise.entity.About;
import com.enterprise.service.AboutService;
import com.enterprise.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

/**
 * 关于我们  管理
 */
@Controller
@RequestMapping("/manage/about")
public class AboutAction extends BaseController<About>{
    private static final String page_toEdit="/manage/about/aboutEdit";
    private static final String page_toList="/manage/about/aboutList";
    @Autowired
    private AboutService aboutService;
    @Autowired
    private FrontCache frontCache;
    @Override
    public Services<About> getService() {
        return aboutService;
    }

    public AboutAction() {
        super.page_toEdit=page_toEdit;
        super.page_toList=page_toList;
    }


    @Override
    @RequestMapping("selectList")
    public String selectList(HttpServletRequest request, About about) throws Exception {
        request.setAttribute("list", aboutService.selectList(new About()));
        return page_toList;
    }
    
    @RequestMapping("toEdit")
    @Override
	public String toEdit(@ModelAttribute("e") About e , ModelMap model) throws Exception{
		model.addAttribute("e", getService().selectById(e.getId()));
		return page_toEdit;
	}
    
    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String save(HttpServletRequest request, @ModelAttribute("e") About e, RedirectAttributes flushAttrs) throws Exception {
    		if(e.getId() == 0) {
        	 getService().insert(e);
        } else {
        	getService().update(e);
        }
        addMessage(flushAttrs, "操作成功！");
        frontCache.loadAbout();
        return "redirect:selectList";
    }
    
}
