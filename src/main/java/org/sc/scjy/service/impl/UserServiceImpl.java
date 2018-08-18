package org.sc.scjy.service.impl;

import java.util.HashMap;
import java.util.List;

import org.sc.scjy.dao.UserMapper;
import org.sc.scjy.entity.User;
import org.sc.scjy.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	
	@Override
	public List<User> findAll() {
		// TODO Auto-generated method stub
		List<User> userList=userMapper.findAll();
		return userList;
	}

	@Override
	public void save(User user) {
		// TODO Auto-generated method stub
		userMapper.insertSelective(user);
	}

	@Override
	public boolean update(User user) {
		// TODO Auto-generated method stub
		return userMapper.updateByPrimaryKeySelective(user);
	}

	@Override
	public User selectUserById(int id) {
		// TODO Auto-generated method stub
		return userMapper.selectByPrimaryKey(id);
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		return userMapper.deleteByPrimaryKey(id);
	}

	@Override
	public List<User> findUserByuserName(String userName) {
		// TODO Auto-generated method stub
		return userMapper.findUserByUserName(userName);
	}

	@Override
	public User login(User user) {
		// TODO Auto-generated method stub
		return userMapper.login(user);
	}

	@Override
	public User checkUserName(String username) {
		// TODO Auto-generated method stub
		return userMapper.checkUserName(username);
	}

	@Override
	public List<HashMap<String, String>> getUserCount() {
		// TODO Auto-generated method stub
		return userMapper.getUserCount();
	}
	
	

}
