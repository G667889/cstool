package com.cstool.service;

import com.cstool.entity.Category;
import com.cstool.entity.Resource;

import java.util.List;

/**
 * Created by shihan on 2017/11/13.
 */
public interface ResourceService {

    //根据ID分查类

    List<Category> findCategoryByParentid(Long parentid);

    //查询分类下的资源

    List<Resource> findResourceByParentid(Long parentid);

    //根据关键字查找资源

    List<Resource> findResourceBykeyword(String keyword);

}
