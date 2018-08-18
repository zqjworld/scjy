package org.sc.scjy.service.impl;

import java.util.List;
import org.sc.scjy.dao.SorderMapper;
import org.sc.scjy.entity.Sorder;
import org.sc.scjy.service.SorderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("sorderService")
@Transactional
public class SorderServiceImpl implements SorderService{

	@Autowired
	private SorderMapper sorderMapper;

	@Override
	public boolean save(Sorder sorder) {
		// TODO Auto-generated method stub
		return sorderMapper.insertSelective(sorder);
	}

	@Override
	public List<Sorder> findAllSorderByBid(int bid) {
		// TODO Auto-generated method stub
		return sorderMapper.findAllSorderByBid(bid);
	}

	@Override
	public boolean delete(int sid) {
		// TODO Auto-generated method stub
		return sorderMapper.deleteByPrimaryKey(sid);
	}

	@Override
	public List<Sorder> findSorderByProName( String pname, int bid) {
		// TODO Auto-generated method stub
		return sorderMapper.findAllSorderByPnameAndBid(pname,bid);
	}

	@Override
	public Sorder findSorderBysid(int sid) {
		// TODO Auto-generated method stub
		return sorderMapper.selectByPrimaryKey(sid);
	}
	
}
