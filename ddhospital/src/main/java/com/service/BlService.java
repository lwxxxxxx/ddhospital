package com.service;

import com.dao.BlDao;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pojo.Bl;
import com.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class BlService {
    @Autowired
    private BlDao blDao;

    public int gh(Bl bl) {
        System.out.println(bl);
        int gh = blDao.gh(bl);
        System.out.println(gh);
        return gh;
    }

    public PageInfo queryAllBlByDoctor(int id,PageUtil pageUtil) {
        PageHelper.startPage(pageUtil.getPage(),pageUtil.getLimit());
        List<Bl> list = blDao.queryAllBlByDoctor(id);
        return new PageInfo(list);
    }

    public Bl queryBlById(int id) {
        return blDao.queryBlById(id);
    }

    public int updateBl(Bl bl) {
        return blDao.updateBl(bl);
    }


    public PageInfo queryNoZdList(int pid,PageUtil pageUtil) {
        PageHelper.startPage(pageUtil.getPage(),pageUtil.getLimit());
        List<Bl> list = blDao.queryNoZdList(pid);
        return new PageInfo(list);
    }

    public PageInfo queryZdList(int pid,PageUtil pageUtil) {
        PageHelper.startPage(pageUtil.getPage(),pageUtil.getLimit());
        List<Bl> list = blDao.queryZdList(pid);
        return new PageInfo(list);
    }

    public int js(int id) {
        return blDao.js(id);
    }

    public PageInfo queryAllBl(PageUtil pageUtil) {
        PageHelper.startPage(pageUtil.getPage(),pageUtil.getLimit());
        List<Bl> list = blDao.queryAllBl();
        return new PageInfo(list);
    }
}
