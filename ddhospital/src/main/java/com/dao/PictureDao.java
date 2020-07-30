package com.dao;

import com.pojo.Picture;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PictureDao {
    /**
     * 查询所有用户头像列表返回List集合
     * @return
     */
    @Select("select * from picture ")
    public List<Picture> findAllPicture();

    /**
     * 用于文件上传把路径加到数据库
     * @param picture
     */
    @Insert("insert into picture(src,title,absolute) values(#{src},#{title},#{absolute}) ")
    public void addPicture(Picture picture);

    @Select("select count(*) from picture")
    public Integer findCount();
}
