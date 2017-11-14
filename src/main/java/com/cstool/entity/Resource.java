package com.cstool.entity;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.io.Serializable;

/**
 * Created by shihan on 2017/11/13.
 */
@Entity
@Data
public class Resource implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Long categoryId;

    private String name;

    private String filename;

    private Long size;

    private String url;

    private String sha1;

    //stat

    private Long look;

    private Long down;

}
