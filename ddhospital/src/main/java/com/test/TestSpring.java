package com.test;


import com.dao.KsDao;
import com.github.pagehelper.PageInfo;
import com.pojo.Bl;
import com.pojo.Doctor;
import com.pojo.Ks;
import com.pojo.Patient;
import com.service.*;
import com.util.PageUtil;
import org.testng.annotations.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class TestSpring {

   /* @Test
    public void run1(){
        // 加载配置文件
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        // 获取对象
        KsService as = (KsService) ac.getBean("ksService");
        // 调用方法
        List<Ks> ksDoctor = as.findKsDoctor(1,);
        System.out.println(ksDoctor);
    }
*/
    @Test
    public void run2(){
        // 加载配置文件
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        // 获取对象
        KsService as = (KsService) ac.getBean("ksService");
        // 调用方法
        Ks ks = as.queryKsById(1);
        System.out.println(ks);
    }

    @Test
    public void run3(){
        // 加载配置文件
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        // 获取对象
        BlService as = (BlService) ac.getBean("blService");
        // 调用方法
        int js = as.js(6);
        System.out.println(js);

    }

}
