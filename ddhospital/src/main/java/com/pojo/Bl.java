package com.pojo;

import com.alibaba.fastjson.annotation.JSONField;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
//病例的类
public class Bl {
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getDid() {
        return did;
    }

    public void setDid(Integer did) {
        this.did = did;
    }

    public Date getZdsj() {
        return zdsj;
    }

    public void setZdsj(Date zdsj) {
        this.zdsj = zdsj;
    }

    public String getZdnr() {
        return zdnr;
    }

    public void setZdnr(String zdnr) {
        this.zdnr = zdnr;
    }

    public String getZdjg() {
        return zdjg;
    }

    public void setZdjg(String zdjg) {
        this.zdjg = zdjg;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Double getJiage() {
        return jiage;
    }

    public void setJiage(Double jiage) {
        this.jiage = jiage;
    }

    public Integer getFlag() {
        return flag;
    }

    public void setFlag(Integer flag) {
        this.flag = flag;
    }

    public String getBz() {
        return bz;
    }

    public void setBz(String bz) {
        this.bz = bz;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    private Integer id;//病例的id
    private Integer pid;//患者的id
    private Integer did;//医生的id
    @JSONField(format = "yyyy/MM/dd")
    private Date zdsj;//治疗时间
    private String zdnr;//诊断nrir
    private String zdjg;//诊断结果
    private Integer state;
    private Double jiage;
    private  Integer flag;

    private String bz;//备注
    private Patient patient;


}
