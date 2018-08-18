package org.sc.scjy.service;

import java.util.HashMap;
import java.util.List;

import org.sc.scjy.entity.User;

public interface UserService {

	List<User> findAll();

	void save(User user);

	boolean update(User user);

	User selectUserById(int id);

	boolean delete(int id);

	List<User> findUserByuserName(String userName);

	User login(User user);

	User checkUserName(String username);

	List<HashMap<String, String>> getUserCount();

}
