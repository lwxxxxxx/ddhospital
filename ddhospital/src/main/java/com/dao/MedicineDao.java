package com.dao;

import com.pojo.Medicine;
import com.vo.Vo;

import java.util.List;

public interface MedicineDao {


    int insertMedicine(Medicine medicine);

    List<Medicine> queryAllMedicine();

    Medicine queryMedicineById(int id);

    int delMedicine(int id);

    int updateMedicine(Medicine medicine);

    List<Vo> queryCount();
}
