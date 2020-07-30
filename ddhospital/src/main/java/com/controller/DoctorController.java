package com.controller;

import com.github.pagehelper.PageInfo;
import com.pojo.Doctor;
import com.service.DoctorService;
import com.util.PageUtil;
import com.util.PwdUtil;
import com.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.List;

//import jdk.nashorn.internal.ir.RuntimeNode;

@RestController
public class DoctorController {
    @Autowired
    private DoctorService doctorService;


    @RequestMapping("/doc_login")
    public Result login(Doctor doctor, HttpSession session){
        Doctor login = doctorService.login(doctor);
        if (login!=null){
            session.setAttribute("doctor", login);
            return new Result(200,"登录成功");
        }
        else {
            return new Result(400,"账号/密码错误");
        }

    }


    @RequestMapping("/doc_updatePwd")
    public Result updatePwd(PwdUtil pwdUtil, HttpSession session){
        Doctor doctor= (Doctor) session.getAttribute("doctor");
        pwdUtil.setUsername(Integer.toString(doctor.getId()));
        int i= doctorService.updatePwd(pwdUtil);
        if (i>0){
            return new Result(200,"修改密码成功");
        }
        else {
            return new Result(400,"修改密码失败，请认真核对信息");
        }
    }

    @RequestMapping("/doc_myinfo")
    public Result myInfo(HttpSession session){

        Doctor doctor= (Doctor) session.getAttribute("doctor");
        Doctor info = doctorService.queryDoctorById(doctor.getId());
        return new Result(info);
    }

    @RequestMapping("/doc_list")
    public Result getTeacherList(@RequestParam(value = "page", defaultValue = "1") int page, @RequestParam(value = "limit", defaultValue = "5")int limit){
        PageInfo pageInfo = doctorService.queryAllDoctor(new PageUtil(page,limit));
        return new Result(pageInfo);

    }


    @RequestMapping("/doc_add")
    public Result addDoctor(Doctor doctor){
        int i = doctorService.insertDoctor(doctor);
        if (i>0){
            return new Result(200,"新增医生成功");
        }
        else {
            return new Result(400,"新增医生失败");
        }
    }

    @RequestMapping("/doc_get")
    public Result getDoctorById(int id){
        Doctor doctor = doctorService.queryDoctorById(id);
        if (doctor==null){
            return new Result(201,"该编号可用");
        }
        return new Result(doctor);

    }

    @RequestMapping("/doc_update")
    public Result updateDoctor(Doctor doctor){
        int i = doctorService.updateDoctor(doctor);
        if (i>0){
            return new Result(200,"修改医生成功");
        }
        else {
            return new Result(400,"修改医生失败");
        }
    }
    @RequestMapping("/doc_delete")
    public Result delDoctor(int id){
        int i = doctorService.delDoctor(id);
        if (i>0){
            return new Result(200,"删除医生成功");
        }
        else {
            return new Result(400,"删除医生失败");
        }
    }
}
