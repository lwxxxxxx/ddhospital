package com.dao;

import com.pojo.Ks;

import java.util.List;

public interface KsDao {

    /**
     * 查询全部科室
     * @return
     */
    List<Ks> queryAllKs();

    /**
     * 添加科室
     * @param ks
     * @return
     */

    int insertKs(Ks ks);

    /**
     * 通过id查科室
     * @param id
     * @return
     */
    Ks queryKsById(int id);

    /**
     * 通过id删除科室
     * @param id
     * @return
     */
    int delKs(int id);

    /**
     * 更新科室
     * @param ks
     * @return
     */
    int updateKs(Ks ks);

    /**
     * 查询全部科室和医生
     * @return
     */
    List<Ks> findKsDoctor();
}
