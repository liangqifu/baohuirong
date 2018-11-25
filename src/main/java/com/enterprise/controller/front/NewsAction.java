package com.enterprise.controller.front;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller("newsActionController")
@RequestMapping("/")
public class NewsAction {

    @RequestMapping("news")
    public String news() {
        return "/front/news";
    }

}
