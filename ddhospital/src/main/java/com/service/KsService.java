package com.service;

import com.dao.KsDao;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pojo.Ks;
import com.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class KsService {
    @Autowired
    private KsDao ksDao;

    /**
     * 添加科室
     * @param ks
     * @return
     */
    public int insertKs(Ks ks){
        return   ksDao.insertKs(ks);
    }

    /**
     * 不分页查询全部科室
     * @return
     */
    public List<Ks> queryAllKs(){
        return ksDao.queryAllKs();
    }


    public PageInfo findKsDoctor(PageUtil pageUtil){

        PageHelper.startPage(pageUtil.getPage(),pageUtil.getLimit());
        List<Ks> list = ksDao.findKsDoctor();
        return new PageInfo(list);
    }
    /**
     * 分页查询全部科室
     * @return
     */
    public PageInfo queryAllKs(PageUtil pageUtil){
        PageHelper.startPage(pageUtil.getPage(),pageUtil.getLimit());
        List<Ks> list = ksDao.queryAllKs();
        return new PageInfo(list);
    }

    /**
     * 通过id查科室
     * @param id
     * @return
     */
    public Ks queryKsById(int id){
        return ksDao.queryKsById(id);
    }

    /**
     * 删除科室
     * @param id
     * @return
     */
    public int delKs(int id) {
        return ksDao.delKs(id);
    }

    /**
     * 更新科室
     * @param ks
     * @return
     */
    public int updateKs(Ks ks) {
        return ksDao.updateKs(ks);
    }
}
