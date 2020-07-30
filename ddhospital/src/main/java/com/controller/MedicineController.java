package com.controller;

import com.github.pagehelper.PageInfo;

import com.pojo.Medicine;
import com.service.MedicineService;
import com.util.PageUtil;
import com.util.Result;
import com.vo.Vo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

//import jdk.nashorn.internal.ir.RuntimeNode;

@RestController
public class MedicineController {
    @Autowired
    private MedicineService medicineService;



    @RequestMapping("/med_list")
    public Result getMedicineList(@RequestParam(value = "page", defaultValue = "1") int page, @RequestParam(value = "limit", defaultValue = "5")int limit){
        PageInfo pageInfo = medicineService.queryAllMedicine(new PageUtil(page,limit));
        return new Result(pageInfo);
    }
    @RequestMapping("/med_add")
    public Result addMedicine(Medicine medicine){
        int i = medicineService.insertMedicine(medicine);
        if (i>0){
            return new Result(200,"新增药物成功");
        }
        else {
            return new Result(400,"新增药物失败");
        }
    }

    @RequestMapping("/med_get")
    public Result getMedicineById(int id){
        Medicine medicine = medicineService.queryMedicineById(id);
        if (medicine==null){
            return new Result(201,"该编号可用");
        }
        return new Result(medicine);

    }

    @RequestMapping("/med_update")
    public Result updateMedicine(Medicine medicine){
        int i = medicineService.updateMedicine(medicine);
        if (i>0){
            return new Result(200,"修改药物成功");
        }
        else {
            return new Result(400,"修改药物失败");
        }
    }
    @RequestMapping("/med_delete")
    public Result delMedicine(int id){
        int i = medicineService.delMedicine(id);
        if (i>0){
            return new Result(200,"删除药物成功");
        }
        else {
            return new Result(400,"删除药物失败");
        }
    }

    @RequestMapping("/med_count")  //统计每个科室医生
    public Result getPatientCount(){
        List<Vo> medVos = medicineService.queryCount();
        return new Result(medVos);
    }
}
