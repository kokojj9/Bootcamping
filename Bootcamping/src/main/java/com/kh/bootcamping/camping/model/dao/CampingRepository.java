package com.kh.bootcamping.camping.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.bootcamping.camping.model.vo.Camping;

@Repository
public class CampingRepository {

	public int insertCamping(SqlSession sqlSession, List<Camping> campingList) {
		return sqlSession.insert("campingMapper.insertCamping", campingList);
	}
}
