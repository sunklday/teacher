package com.springapp.mvc.persistence;

import com.springapp.mvc.domain.Admin;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Sun on 2016/5/6.
 */
public interface AdminMapper {
    Admin findAdminByAdminAndPassWord(@Param("adminName")String adminName,@Param("passWord")String passWord);

    List<Admin> findAllAdmin(@Param("currentNum")int currentNum,@Param("rows")int rows);

    Integer findCount();
    Admin findAllAdminByAdminName(@Param("adminName")String adminName);

    void addAdmin(Admin admin);
    void updateAdmin(Admin admin);
}
