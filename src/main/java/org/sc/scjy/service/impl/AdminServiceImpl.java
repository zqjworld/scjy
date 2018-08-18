package org.sc.scjy.service.impl;

import java.util.List;

import org.sc.scjy.dao.AdminMapper;
import org.sc.scjy.entity.Admin;
import org.sc.scjy.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("adminService")
@Transactional
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminMapper adminMapper;
	
	@Override
	public Admin login(String adminName, String adminPass) {
		// TODO Auto-generated method stub
		Admin admin=adminMapper.findByAdmin(adminName,adminPass);
		if(admin==null){
			throw new RuntimeException("用户名或密码不正确");
		}
		return admin;
	}

	@Override
	public List<Admin> findAll() {
		// TODO Auto-generated method stub
		List<Admin> adminList=adminMapper.findAll();
		return adminList;
	}

	@Override
	public void save(Admin admin) {
		// TODO Auto-generated method stub
		adminMapper.insertSelective(admin);
	}

	@Override
	public boolean update(Admin admin) {
		// TODO Auto-generated method stub
		return adminMapper.updateByPrimaryKeySelective(admin);
	}

	@Override
	public Admin selectAdminById(int id) {
		// TODO Auto-generated method stub
		return adminMapper.selectByPrimaryKey(id);
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		return adminMapper.deleteByPrimaryKey(id);
	}

	@Override
	public List<Admin> findAdminByAdminName(String adminName) {
		// TODO Auto-generated method stub
		return adminMapper.findAdminByAdminName(adminName);
	}

}
