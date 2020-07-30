package com.pojo;

import java.io.Serializable;

/**
 * @author: Fy
 *用作用户头像的实体类
 * @create: 2020-04-23 10:18
 */
public class Picture implements Serializable {

    private int id;

    private String src;

    private String title;

    private String absolute;


    public Picture(String src, String title, String absolute) {
        this.src = src;
        this.title = title;
        this.absolute = absolute;
    }

    public Picture() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAbsolute() {
        return absolute;
    }

    public void setAbsolute(String absolute) {
        this.absolute = absolute;
    }
}
