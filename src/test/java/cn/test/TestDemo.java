package cn.test;


import cn.kgc.demo.service.DemoService;
import com.github.pagehelper.PageInfo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

//指定在单元测试启动的时候创建spring的工厂类对象
@ContextConfiguration(locations = {"classpath:spring-config.xml"})
//RunWith的value属性指定以spring test的SpringJUnit4ClassRunner作为启动类
//如果不指定启动类，默认启用的junit中的默认启动类
@RunWith(value = SpringJUnit4ClassRunner.class)
public class TestDemo {

    @Autowired
    private DemoService demoService;

    @Test
    public void test(){
        PageInfo info = demoService.findInvitationByPage(null, 2, 3);
        List list = info.getList();
        list.forEach(temp-> System.out.println(temp));


    }
}
