package com.cstool.dao;

import com.cstool.entity.Category;
import com.cstool.entity.Resource;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by shihan on 2017/11/13.
 */
public interface ResourceDao extends JpaRepository<Resource, Long> {

    public List<Resource> findByCategoryId(Long CategoryId);

    public List<Resource> findByNameLike(String keyword);

}
