package org.sc.scjy.service.impl;

import java.util.HashMap;
import java.util.List;

import org.sc.scjy.dao.ForderMapper;
import org.sc.scjy.entity.Forder;
import org.sc.scjy.service.ForderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("forderService")
@Transactional
public class ForderServiceImpl implements ForderService{

	@Autowired
	private ForderMapper forderMapper;
	
	@Override
	public boolean save(Forder forder) {
		// TODO Auto-generated method stub
		return forderMapper.insertSelective(forder);
	}

	@Override
	public List<Forder> findAllForderBybid(Integer bid) {
		// TODO Auto-generated method stub
		return forderMapper.findAllForderBybid(bid);
	}

	@Override
	public List<Forder> findAllForderBypName(String pname,Integer bid) {
		// TODO Auto-generated method stub
		return forderMapper.findForderBypName(pname,bid);
	}

	@Override
	public Forder selectForderByfid(int fid) {
		// TODO Auto-generated method stub
		return forderMapper.selectByPrimaryKey(fid);
	}

	@Override
	public boolean delete(int fid) {
		// TODO Auto-generated method stub
		return forderMapper.deleteByPrimaryKey(fid);
	}

	@Override
	public List<Forder> findAllForder() {
		// TODO Auto-generated method stub
		return forderMapper.findAllForder();
	}

	@Override
	public List<HashMap<String, String>> getForderCount() {
		// TODO Auto-generated method stub
		return forderMapper.getForderCount();
	}

	@Override
	public List<HashMap<String, String>> getForderCountZ() {
		// TODO Auto-generated method stub
		return forderMapper.getForderCountZ();
	}


}
