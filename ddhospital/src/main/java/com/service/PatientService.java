package com.service;


import com.dao.PatientDao;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import com.pojo.Patient;
import com.util.PageUtil;
import com.util.PwdUtil;
import com.vo.Vo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PatientService {
  @Autowired
    private PatientDao patientDao;

    public int insertPatient(Patient patient){
        //为教师设置初始密码
        patient.setPassword("1234");
        return patientDao.insertPatient(patient);
    }

    public PageInfo queryAllPatient(PageUtil pageUtil){
        PageHelper.startPage(pageUtil.getPage(),pageUtil.getLimit());
        List<Patient> list = patientDao.queryAllPatient();
        return new PageInfo(list);
    }

    public Patient queryPatientById(int id) {
        return patientDao.queryPatientById(id);
    }

    public int delPatient(int id) {
        return patientDao.delPatient(id);
    }

    public int updatePatient(Patient patient) {
        return patientDao.updatePatient(patient);
    }

    public Patient login(Patient patient) {
        return patientDao.login(patient);
    }

    public int updatePwd(PwdUtil pwdUtil) {
        return patientDao.updatePwd(pwdUtil);
    }

    public List<Vo> queryCount() {
        return patientDao.queryCount();
    }
}
