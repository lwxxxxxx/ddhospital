package com.controller;

import com.pojo.Doctor;
import com.pojo.Picture;
import com.service.DoctorService;
import com.service.PictureServiceImpl;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * @author: Fy
 * picture用户头像相关的Controller
 * @create: 2020-04-23 10:25
 */
@Controller
@RequestMapping("/picture")
public class PictureController {

    @Autowired
    private PictureServiceImpl pictureService;
    @Autowired
    private DoctorService doctorService;
    /**
     * 修改用户头像的方法
     * @param
     * @param session
     */
    @ResponseBody
    @RequestMapping("/updateUserPicture")
    public Integer updateUserPicture( Doctor doctor, HttpSession session){
        session.setAttribute("doctor",doctor);
        doctorService.updateDoctor(doctor);
        return 1;
    }

    @RequestMapping("/findAllPicture")
    public String findAllPicture(Model model) {
        List<Picture> pictureList = pictureService.findAllPicture();
        model.addAttribute("pictureList", pictureList);
        return "doctor/changePicture";
    }

    //文件上传并复制
    @ResponseBody
    @RequestMapping("/fileupload2")
    public Integer fileuoload2(MultipartFile file) throws Exception {
        // 使用fileupload组件完成文件上传
        // 上传的位置
//        String path = request.getSession().getServletContext().getRealPath("/static/img/picture");
        //自己的项目的静态资源所在的位置
        String path1 = "F:\\d1\\ddhospital\\src\\main\\webapp\\static\\images\\picture";
        //部署的里面的
        String path2 = "F:\\d1\\ddhospital\\target\\ddhospital-1.0-SNAPSHOT\\static\\images\\picture";

        System.out.println(path1);
        // 判断，该路径是否存在
        File file1 = new File(path1);
        File file2 = new File(path2);
        if (!file1.exists()) {
            // 创建该文件夹
            file1.mkdirs();
        }
        if (!file2.exists()) {
            // 创建该文件夹
            file2.mkdirs();
        }
        //数据库中的picture的值
        Integer count = pictureService.findCount();
        String title = "头像" + (count + 1);

        // 说明上传文件项
        // 获取上传文件的名称
        String filename = file.getOriginalFilename();
        if (filename == null) {
            filename = new Date().getTime() + ".jpg";
        }
        filename=new Date().getTime()+"_"+filename;
        String absolute = "localhost:8088/static/images/picture/" + filename;
        pictureService.addPicture(new Picture(filename, title, absolute));
        File filehaha = new File(path1, filename);
        file.transferTo(filehaha);
        //copy一下文件
        FileUtils.copyFileToDirectory(filehaha, file2);
        return 1;
    }

    //专门为了远程服务器写的文件上传并复制
/*    @ResponseBody
    @RequestMapping("/fileupload2")
    public Integer fileuoload2(MultipartFile file,HttpServletRequest request) throws Exception {
        // 使用fileupload组件完成文件上传
        // 上传的位置
        String path = request.getSession().getServletContext().getRealPath("/static/img/picture");
        // 判断，该路径是否存在
        System.out.println(path);
        File file1 = new File(path);
        if (!file1.exists()) {
            // 创建该文件夹
            file1.mkdirs();
        }
        //数据库中的picture的值
        Integer count = pictureService.findCount();
        String title = "头像" + (count + 1);

        // 说明上传文件项
        // 获取上传文件的名称
        String filename = file.getOriginalFilename();
        if (filename == null) {
            filename = new Date().getTime() + ".jpg";
        }
        filename=new Date().getTime()+"_"+filename;
        String absolute = "localhost:8080/gas/static/img/picture/" + filename;
        pictureService.addPicture(new Picture(filename, title, absolute));
        File filehaha = new File(path, filename);
        file.transferTo(filehaha);
        //copy一下文件
        return 1;
    }*/


}
