package org.sc.scjy.dao;

import java.util.HashMap;
import java.util.List;

import org.sc.scjy.entity.Forder;

public interface ForderMapper {
    boolean deleteByPrimaryKey(Integer fid);

    int insert(Forder record);

    boolean insertSelective(Forder record);

    Forder selectByPrimaryKey(Integer fid);

    int updateByPrimaryKeySelective(Forder record);

    int updateByPrimaryKey(Forder record);

	List<Forder> findAllForderBybid(Integer bid);

	List<Forder> findForderBypName(String pname, Integer bid);

	List<Forder> findAllForder();

	List<HashMap<String, String>> getForderCount();

	List<HashMap<String, String>> getForderCountZ();
}