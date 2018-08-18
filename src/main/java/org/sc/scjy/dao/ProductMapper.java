package org.sc.scjy.dao;

import java.util.HashMap;
import java.util.List;

import org.sc.scjy.entity.Product;

public interface ProductMapper {
    boolean deleteByPrimaryKey(Integer id);

    int insert(Product record);

    int insertSelective(Product record);

    Product selectByPrimaryKey(Integer id);

    boolean updateByPrimaryKeySelective(Product record);

    int updateByPrimaryKey(Product record);

	List<Product> findAll();

	List<Product> findProductByproName(String pname);

	List<Product> findProductByUid(Integer userId);

	List<Product> findProductByPtype(String ptype);

	List<Product> findProNew();

	Product selectProductById(int id);

	Product checkProName(String proName);

	List<HashMap<String, String>> getProName();

	List<HashMap<String, String>> getProCount();
}