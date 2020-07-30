package com.dao;

import com.pojo.Bl;

import java.util.HashMap;
import java.util.List;

public interface BlDao {
    int gh(Bl bl);

    List<Bl> queryAllBlByDoctor(int id);

    Bl queryBlById(int id);

    int updateBl(Bl bl);


    List<Bl> queryNoZdList(int pid);

    List<Bl> queryZdList(int pid);

    int js(int id);

    List<Bl> queryAllBl();
}
