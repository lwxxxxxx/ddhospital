package com.dao;

import com.pojo.Admin;
import com.util.PwdUtil;


public interface AdminDao {


    /**
     * 管理员登录
     * @return
     */
    Admin login(Admin admin);

    /**
     * 管理员修改密码
     * @param pwdUtil
     * @return
     */
    int updatePwd(PwdUtil pwdUtil);
}
