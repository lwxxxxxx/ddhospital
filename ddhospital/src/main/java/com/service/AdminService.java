package com.service;

import com.dao.AdminDao;
import com.pojo.Admin;
import com.util.PwdUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminService {

@Autowired
        private AdminDao adminDao;

    /**
     * 管理员登录
     * @return
     */
   public Admin login(Admin admin){
        return adminDao.login(admin);
    }

    /**
     * 管理员修改密码
     * @param pwdUtil
     * @return
     */
    public int updatePwd(PwdUtil pwdUtil){
        return  adminDao.updatePwd(pwdUtil);
    }
}
