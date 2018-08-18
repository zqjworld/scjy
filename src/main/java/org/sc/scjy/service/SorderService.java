package org.sc.scjy.service;

import java.util.List;

import org.sc.scjy.entity.Sorder;

public interface SorderService {

	boolean save(Sorder sorder);

	List<Sorder> findAllSorderByBid(int bid);

	boolean delete(int sid);

	List<Sorder> findSorderByProName(String pname, int bid);

	Sorder findSorderBysid(int sid);

}
