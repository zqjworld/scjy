package org.sc.scjy.dao;

import java.util.HashMap;
import java.util.List;

import org.sc.scjy.entity.User;

public interface UserMapper {
    boolean deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    boolean updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

	List<User> findAll();

	List<User> findUserByUserName(String userName);

	User login(User user);

	User checkUserName(String username);

	List<HashMap<String, String>> getUserCount();
}