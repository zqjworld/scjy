package org.sc.scjy.service.impl;

import java.util.HashMap;
import java.util.List;

import org.sc.scjy.dao.ProductMapper;
import org.sc.scjy.entity.Product;
import org.sc.scjy.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("productService")
@Transactional
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductMapper productMapper;
	
	
	@Override
	public List<Product> findAll() {
		// TODO Auto-generated method stub
		List<Product> productList=productMapper.findAll();
		return productList;
	}


	@Override
	public void save(Product product) {
		// TODO Auto-generated method stub
		productMapper.insertSelective(product);
	}


	@Override
	public boolean update(Product product) {
		// TODO Auto-generated method stub
		return productMapper.updateByPrimaryKeySelective(product);
	}


	@Override
	public Product selectProById(int id) {
		// TODO Auto-generated method stub
		return productMapper.selectByPrimaryKey(id);
	}


	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		return productMapper.deleteByPrimaryKey(id);
	}


	@Override
	public List<Product> findProductByproName(String pname) {
		// TODO Auto-generated method stub
		return productMapper.findProductByproName(pname);
	}


/*	@Override
	public List<Product> findProductByUid(String uid) {
		// TODO Auto-generated method stub
		return productMapper.findProductByUid(uid);
	}
*/

	@Override
	public List<Product> findProductByPtype(String ptype) {
		// TODO Auto-generated method stub
		return productMapper.findProductByPtype(ptype);
	}


	@Override
	public List<Product> findProNew() {
		// TODO Auto-generated method stub
		return productMapper.findProNew();
	}


	@Override
	public List<Product> findProductByUid(Integer userId) {
		// TODO Auto-generated method stub
		return productMapper.findProductByUid(userId);
	}


	@Override
	public Product checkProName(String pname) {
		// TODO Auto-generated method stub
		return productMapper.checkProName(pname);
	}


	@Override
	public List<HashMap<String, String>> getProName() {
		// TODO Auto-generated method stub
		return productMapper.getProName();
	}


	@Override
	public List<HashMap<String, String>> getProCount() {
		// TODO Auto-generated method stub
		return productMapper.getProCount();
	}

}
