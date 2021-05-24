package cn.kgc.demo.pojo;

import lombok.Data;

import java.util.Date;

@Data
public class Invitation {
    private Integer id;

    private String title;

    private String summary;

    private String author;

    private Date createdate;


}