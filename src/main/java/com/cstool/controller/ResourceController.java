package com.cstool.controller;

import com.cstool.entity.Category;
import com.cstool.entity.Resource;
import com.cstool.service.ResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by shihan on 2017/11/13.
 */
@Controller
@RequestMapping("api/v1")
public class ResourceController {

    @Autowired
    private ResourceService resourceService;

    //根据ID分查类
    @RequestMapping("/categorys/bypid")
    @ResponseBody
    public List<Category> findCategoryByParentid(Long pid){
       return resourceService.findCategoryByParentid(pid);
    }

    //查询分类下的资源
    @RequestMapping("/resources/bypid")
    @ResponseBody
    List<Resource> findResourceByParentid(Long pid){
        return resourceService.findResourceByParentid(pid);
    }

    //根据关键字查找资源
    //查询分类下的资源
    @RequestMapping("/resources/bykd")
    @ResponseBody
    List<Resource> findResourceBykeyword(String kd){
        return resourceService.findResourceBykeyword(kd);
    }
}
