package com.controller;

import com.github.pagehelper.PageInfo;
import com.pojo.Bl;
import com.pojo.Ks;
import com.service.KsService;
import com.util.PageUtil;
import com.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class KsContriller {
    @Autowired
    private KsService ksService;

    @RequestMapping("/allKs")
    public Result getAllMajor(){
        List<Ks> ks =ksService.queryAllKs();
        return new Result(ks);
    }

    @RequestMapping("/allKD")

    public Result getAllKD(@RequestParam(value = "page", defaultValue = "1") int page, @RequestParam(value = "limit", defaultValue = "5")int limit){
        PageInfo pageInfo = ksService.findKsDoctor(new PageUtil(page, limit));
        return new Result(pageInfo);

    }

    @RequestMapping("/ks_list")
    public Result getTeacherList(@RequestParam(value = "page", defaultValue = "1") int page, @RequestParam(value = "limit", defaultValue = "5")int limit){
        PageInfo pageInfo = ksService.queryAllKs(new PageUtil(page, limit));
        return new Result(pageInfo);
    }

    @RequestMapping("/ks_add")
    public Result addKs(Ks ks){
        int i = ksService.insertKs(ks);
        if (i>0){
            return new Result(200,"新增科室成功");
        }
        else {
            return new Result(400,"新增科室失败");
        }
    }
    @RequestMapping("/ks_delete")
    public Result delKs(int id){
        int i = ksService.delKs(id);
        if (i>0){
            return new Result(200,"删除科室成功");
        }
        else {
            return new Result(400,"删除科室失败");
        }
    }

    @RequestMapping("/ks_update")
    public Result updateKs(Ks ks){
        int i = ksService.updateKs(ks);
        if (i>0){
            return new Result(200,"修改成功");
        }
        else {
            return new Result(400,"修改失败");
        }
    }


    @RequestMapping("/ks_get")
    public Result getAllKs(int id){

        Ks ks = ksService.queryKsById(id);
        if (ks==null){
            return new Result(201,"该科室号可用");
        }
        return new Result(ks);
    }
}
