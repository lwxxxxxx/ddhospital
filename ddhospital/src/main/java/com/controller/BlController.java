package com.controller;


import com.github.pagehelper.PageInfo;
import com.pojo.Bl;
import com.pojo.Doctor;
import com.pojo.Patient;
import com.service.BlService;
import com.util.PageUtil;
import com.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import javax.xml.crypto.Data;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

@RestController
public class BlController {
    @Autowired
    private BlService blService;
    @RequestMapping("/bl_gh")
    public Result gh(int id , HttpSession session){
        Patient patient = (Patient) session.getAttribute("patient");
        Integer pid = patient.getId();
        Bl bl = new Bl();
        bl.setDid(id);
        bl.setPid(pid);
        int i = blService.gh(bl);

        if (i>0){
            return new Result(200,"挂号成功");
        }
        else {
            return new Result(400,"挂号失败");
        }
    }

    @RequestMapping("/bl_js")
    public Result js(int id , HttpSession session){
        int i = blService.js(id);
        if (i>0){
            return new Result(200,"付款成功");
        }
        else {
            return new Result(400,"付款失败");
        }
    }
    @RequestMapping("/bl_get")
    public Result getAllMajor(int id){

        Bl bl = blService.queryBlById(id);
        if (bl==null){
            return new Result(201,"该专业号可用");
        }
        return new Result(bl);
    }

    @RequestMapping("/bl_update")
    public Result updateBl(Bl bl){

        int i = blService.updateBl(bl);

        if (i>0){
            return new Result(200,"诊断成功");
        }
        else {
            return new Result(400,"诊断失败");
        }
    }

    @RequestMapping("/zd_list")
    public Result getZdList(@RequestParam(value = "page", defaultValue = "1") int page, @RequestParam(value = "limit", defaultValue = "5")int limit,HttpSession session){
        Doctor doctor = (Doctor) session.getAttribute("doctor");
        Integer id = doctor.getId();
        PageInfo pageInfo = blService.queryAllBlByDoctor(id,new PageUtil(page,limit));
        return new Result(pageInfo);
    }

    @RequestMapping("/bl_list")
    public Result getblList(@RequestParam(value = "page", defaultValue = "1") int page, @RequestParam(value = "limit", defaultValue = "5")int limit){
        PageInfo pageInfo = blService.queryAllBl(new PageUtil(page,limit));
        return new Result(pageInfo);
    }

    //查询已支付的账单
    @RequestMapping("/pat_zdlist")
    public Result getZd(@RequestParam(value = "page", defaultValue = "1") int page, @RequestParam(value = "limit", defaultValue = "5")int limit,HttpSession session){
        Patient patient = (Patient) session.getAttribute("patient");
        Integer pid = patient.getId();
        PageInfo pageInfo = blService.queryZdList(pid,new PageUtil(page,limit));
        return new Result(pageInfo);
    }


    //查询未支付的账单
    @RequestMapping("/pat_nozdlist")
    public Result queryNoZdList(@RequestParam(value = "page", defaultValue = "1") int page, @RequestParam(value = "limit", defaultValue = "5")int limit, HttpSession session){
        Patient patient= (Patient)session.getAttribute("patient");
        int pid = patient.getId();
        PageInfo pageInfo = blService.queryNoZdList(pid,new PageUtil(page, limit));
        System.out.println(pageInfo);
        return new Result(pageInfo);
    }

}
