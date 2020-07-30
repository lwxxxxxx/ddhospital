package com.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
//药材
public class Medicine {
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getSl() {
        return sl;
    }

    public void setSl(Double sl) {
        this.sl = sl;
    }

    public String getLb() {
        return lb;
    }

    public void setLb(String lb) {
        this.lb = lb;
    }

    public Double getJg() {
        return jg;
    }

    public void setJg(Double jg) {
        this.jg = jg;
    }

    public String getM_bz() {
        return m_bz;
    }

    public void setM_bz(String m_bz) {
        this.m_bz = m_bz;
    }

    private Integer id;//药物的id
    private String name;//药物的名字
    private Double sl;//药物的数量
    private String lb;//药物的类别
    private Double jg;//药物的价格
    private String m_bz;//备注


}
