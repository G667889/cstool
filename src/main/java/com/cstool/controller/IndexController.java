package com.cstool.controller;

import com.cstool.entity.Category;
import com.cstool.service.ResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by shihan on 2017/11/13.
 */
@Controller
@RequestMapping("")
public class IndexController {

    @Autowired
    private ResourceService resourceService;

    @RequestMapping("")
    public String index(Model model){
        List<Category> categories = resourceService.findCategoryByParentid(0L);
        model.addAttribute("categorys",categories);
        return "index";
    }
}
