package org.sc.scjy.service;

import java.util.List;

import org.sc.scjy.entity.Admin;

public interface AdminService {

	Admin login(String adminName, String adminPass);

	List<Admin> findAll();

	void save(Admin admin);

	boolean update(Admin admin);

	Admin selectAdminById(int id);

	boolean delete(int id);

	List<Admin> findAdminByAdminName(String adminName);

}
