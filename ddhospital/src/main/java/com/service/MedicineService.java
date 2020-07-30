package com.service;


import com.dao.MedicineDao;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import com.pojo.Medicine;
import com.util.PageUtil;
import com.vo.Vo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MedicineService {
  @Autowired
    private MedicineDao medicineDao;

    public int insertMedicine(Medicine medicine){

        return medicineDao.insertMedicine(medicine);
    }

    public PageInfo queryAllMedicine(PageUtil pageUtil){
        PageHelper.startPage(pageUtil.getPage(),pageUtil.getLimit());
        List<Medicine> list = medicineDao.queryAllMedicine();
        return new PageInfo(list);
    }

    public Medicine queryMedicineById(int id) {
        return medicineDao.queryMedicineById(id);
    }

    public int delMedicine(int id) {
        return medicineDao.delMedicine(id);
    }

    public int updateMedicine(Medicine medicine) {
        return medicineDao.updateMedicine(medicine);
    }

    public List<Vo> queryCount() {
        return medicineDao.queryCount();
    }
}
