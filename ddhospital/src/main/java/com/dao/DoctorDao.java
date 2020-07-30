package com.dao;

import com.pojo.Doctor;
import com.pojo.Ks;
import com.util.PwdUtil;

import java.util.List;

public interface DoctorDao {


    int insertDoctor(Doctor doctor);

    List<Doctor> queryAllDoctor();

    Doctor queryDoctorById(int id);

    int delDoctor(int id);

    int updateDoctor(Doctor doctor);

    List<Ks> queryAllKD();

    Doctor login(Doctor doctor);

    int updatePwd(PwdUtil pwdUtil);
}
