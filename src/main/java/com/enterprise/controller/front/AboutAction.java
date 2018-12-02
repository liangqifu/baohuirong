package com.enterprise.controller.front;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 关于我们
 */
@Controller("aboutActionController")
@RequestMapping("/")
public class AboutAction {

    @RequestMapping("about")
    public String about(HttpServletRequest request, @RequestParam("id") String id) {
    	request.setAttribute("id",id );
        return "/front/about";
    }

}
