package com.service;

import com.dao.DoctorDao;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pojo.Doctor;
import com.util.PageUtil;
import com.util.PwdUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DoctorService {
  @Autowired
    private DoctorDao doctorDao;

    public int insertDoctor(Doctor doctor){
        //为教师设置初始密码
        doctor.setPassword("1234");
        return doctorDao.insertDoctor(doctor);
    }

    public PageInfo queryAllDoctor(PageUtil pageUtil){
        PageHelper.startPage(pageUtil.getPage(),pageUtil.getLimit());
        List<Doctor> list = doctorDao.queryAllDoctor();
        return new PageInfo(list);
    }


    public Doctor queryDoctorById(int id) {
        return doctorDao.queryDoctorById(id);
    }

    public int delDoctor(int id) {
        return doctorDao.delDoctor(id);
    }

    public int updateDoctor(Doctor doctor) {
        return doctorDao.updateDoctor(doctor);
    }

    public Doctor login(Doctor doctor) {
        return doctorDao.login(doctor);
    }

    public int updatePwd(PwdUtil pwdUtil) {
        return doctorDao.updatePwd(pwdUtil);
    }
}
