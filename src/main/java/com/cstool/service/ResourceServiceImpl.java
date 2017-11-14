package com.cstool.service;

import com.cstool.dao.CategroyDao;
import com.cstool.dao.ResourceDao;
import com.cstool.entity.Category;
import com.cstool.entity.Resource;
import javassist.tools.reflect.Sample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by shihan on 2017/11/13.
 */
@Service
public class ResourceServiceImpl implements  ResourceService{

    @Autowired
    private ResourceDao resourceDao;

    @Autowired
    private CategroyDao categroyDao;

    @Override
    public List<Category> findCategoryByParentid(Long parentid) {
        return categroyDao.findByParentId(parentid);
    }

    @Override
    public List<Resource> findResourceByParentid(Long parentid) {
        return resourceDao.findByCategoryId(parentid);
    }

    @Override
    public List<Resource> findResourceBykeyword(String keyword) {
        return resourceDao.findByNameLike(keyword);
    }
}
