package org.sc.scjy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.sc.scjy.entity.Admin;

public interface AdminMapper {
    boolean deleteByPrimaryKey(Integer id);

    int insert(Admin record);

    int insertSelective(Admin record);

    Admin selectByPrimaryKey(Integer id);

    boolean updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);

	Admin findByAdmin(@Param("adminName") String adminName,@Param("adminPass")  String adminPass);

	List<Admin> findAll();

	List<Admin> findAdminByAdminName(String adminName);
}