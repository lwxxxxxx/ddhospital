package com.controller;

import com.github.pagehelper.PageInfo;

import com.pojo.Patient;
import com.service.DoctorService;
import com.service.PatientService;
import com.util.PageUtil;
import com.util.PwdUtil;
import com.util.Result;
import com.vo.Vo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.List;

//import jdk.nashorn.internal.ir.RuntimeNode;

@RestController
public class PatientController {
    @Autowired
    private PatientService patientService;



    @RequestMapping("/pat_login")
    public Result login(Patient patient, HttpSession session){
        Patient login = patientService.login(patient);
        if (login!=null){
            session.setAttribute("patient", login);
            return new Result(200,"登录成功");
        }
        else {
            return new Result(400,"账号/密码错误");
        }

    }

    @RequestMapping("/pat_myinfo")
    public Result myInfo(HttpSession session){

        Patient patient= (Patient) session.getAttribute("patient");
        Patient info = patientService.queryPatientById(patient.getId());
        return new Result(info);
    }


    @RequestMapping("/pat_updatePwd")
    public Result updatePwd(PwdUtil pwdUtil, HttpSession session){
        Patient patient= (Patient) session.getAttribute("patient");
        pwdUtil.setUsername(Integer.toString(patient.getId()));
        int i= patientService.updatePwd(pwdUtil);
        if (i>0){
            return new Result(200,"修改密码成功");
        }
        else {
            return new Result(400,"修改密码失败，请认真核对信息");
        }
    }


    @RequestMapping("/pat_list")
    public Result getPatientList(@RequestParam(value = "page", defaultValue = "1") int page, @RequestParam(value = "limit", defaultValue = "5")int limit){
        PageInfo pageInfo = patientService.queryAllPatient(new PageUtil(page,limit));
        return new Result(pageInfo);
    }
    @RequestMapping("/pat_add")
    public Result addPatient(Patient patient){
        int i = patientService.insertPatient(patient);
        if (i>0){
            return new Result(200,"新增患者成功");
        }
        else {
            return new Result(400,"新增患者失败");
        }
    }

    @RequestMapping("/pat_get")
    public Result getPatientById(int id){
        Patient patient = patientService.queryPatientById(id);
        if (patient==null){
            return new Result(201,"该编号可用");
        }
        return new Result(patient);

    }

    @RequestMapping("/pat_update")
    public Result updatePatient(Patient patient){
        int i = patientService.updatePatient(patient);
        if (i>0){
            return new Result(200,"修改患者成功");
        }
        else {
            return new Result(400,"修改患者失败");
        }
    }
    @RequestMapping("/pat_delete")
    public Result delPatient(int id){
        int i = patientService.delPatient(id);
        if (i>0){
            return new Result(200,"删除患者成功");
        }
        else {
            return new Result(400,"删除患者失败");
        }
    }

    @RequestMapping("/pat_count")  //统计每个科室医生
    public Result getPatientCount(){
        List<Vo> patVos = patientService.queryCount();
        return new Result(patVos);
    }
}
