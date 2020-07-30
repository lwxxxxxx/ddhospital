package com.controller;

import com.pojo.Admin;
import com.service.AdminService;
import com.util.PwdUtil;
import com.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class AdminController {
    @Autowired
    private AdminService adminService;

    @RequestMapping("admin_login")
    @ResponseBody
    public Result login(Admin admin, HttpSession session){
        Admin login = adminService.login(admin);
        if (login!=null){
            session.setAttribute("admin",login.getId());
            return new Result(200,"登录成功");
        }
        else {
            return new Result(400,"用户名/密码错误");
        }
    }


    @RequestMapping("admin_updatePwd")
    @ResponseBody
    public Result updatePwd(PwdUtil pwdUtil, HttpSession session){
      String username=  (String)session.getAttribute("admin");
      pwdUtil.setUsername(username);
        int i= adminService.updatePwd(pwdUtil);
        if (i>0){
            return new Result(200,"修改密码成功");
        }
        else {
            return new Result(400,"修改密码失败，请认真核对信息");
        }
    }
}
