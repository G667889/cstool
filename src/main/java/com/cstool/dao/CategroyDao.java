package com.cstool.dao;

import com.cstool.entity.Category;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by shihan on 2017/11/13.
 */
public interface CategroyDao extends JpaRepository<Category, Long> {

    public List<Category> findByParentId(Long parentId);


}
