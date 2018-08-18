package org.sc.scjy.service;

import java.util.HashMap;
import java.util.List;

import org.sc.scjy.entity.Forder;

public interface ForderService {

	boolean save(Forder forder);

	List<Forder> findAllForderBybid(Integer bid);

	List<Forder> findAllForderBypName(String pname, Integer bid);

	Forder selectForderByfid(int fid);

	boolean delete(int fid);

	List<Forder> findAllForder();

	List<HashMap<String, String>> getForderCount();

	List<HashMap<String, String>> getForderCountZ();

}
