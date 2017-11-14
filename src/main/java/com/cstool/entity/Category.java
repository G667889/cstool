package com.cstool.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by shihan on 2017/11/13.
 */
@Entity
@Data
public class Category implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Long parentId;

    private String name;

}
