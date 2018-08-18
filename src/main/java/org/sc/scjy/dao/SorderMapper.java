package org.sc.scjy.dao;

import java.util.List;

import org.sc.scjy.entity.Sorder;

public interface SorderMapper {
    boolean deleteByPrimaryKey(Integer sid);

    int insert(Sorder record);

    boolean insertSelective(Sorder record);

    Sorder selectByPrimaryKey(Integer sid);

    int updateByPrimaryKeySelective(Sorder record);

    int updateByPrimaryKey(Sorder record);

	List<Sorder> findAllSorderByBid(int bid);

	List<Sorder> findAllSorderByPnameAndBid(String pname, int bid);

	
}