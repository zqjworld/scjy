package org.sc.scjy.service;

import java.util.HashMap;
import java.util.List;

import org.sc.scjy.entity.Product;

public interface ProductService {

	List<Product> findAll();

	void save(Product product);

	boolean update(Product product);

	Product selectProById(int id);

	boolean delete(int id);

	List<Product> findProductByproName(String pname);
	
/*	List<Product> findProductByUid(String uid);*/

	List<Product> findProductByPtype(String ptype);

	List<Product> findProNew();

	List<Product> findProductByUid(Integer userId);

	Product checkProName(String proName);

	List<HashMap<String, String>> getProName();

	List<HashMap<String, String>> getProCount();

}
