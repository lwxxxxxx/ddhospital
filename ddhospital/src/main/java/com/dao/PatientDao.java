package com.dao;


import com.pojo.Patient;
import com.util.PwdUtil;
import com.vo.Vo;

import java.util.List;

public interface PatientDao {


    int insertPatient(Patient patient);

    List<Patient> queryAllPatient();

    Patient queryPatientById(int id);

    int delPatient(int id);

    int updatePatient(Patient patient);

    Patient login(Patient patient);

    int updatePwd(PwdUtil pwdUtil);

    List<Vo> queryCount();

}
