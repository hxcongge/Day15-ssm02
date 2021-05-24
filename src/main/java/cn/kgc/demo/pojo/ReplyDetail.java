package cn.kgc.demo.pojo;

import lombok.Data;

import java.util.Date;

@Data
public class ReplyDetail {
    private Integer id;

    private Integer invid;

    private String content;

    private String author;

    private Date createdate;


}