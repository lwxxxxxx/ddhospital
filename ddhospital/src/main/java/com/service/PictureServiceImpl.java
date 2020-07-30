package com.service;

import com.dao.PictureDao;
import com.pojo.Picture;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PictureServiceImpl  {
    @Autowired
    private PictureDao pictureDao;

    public void setPictureDao(PictureDao pictureDao) {
        this.pictureDao = pictureDao;
    }

    public List<Picture> findAllPicture() {
        return pictureDao.findAllPicture();
    }

    public void addPicture(Picture picture) {
        pictureDao.addPicture(picture);
    }

    public Integer findCount() {
        return pictureDao.findCount();
    }
}
