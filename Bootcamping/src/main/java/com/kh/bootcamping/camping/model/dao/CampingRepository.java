package com.kh.bootcamping.camping.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.bootcamping.camping.model.vo.Camping;

@Repository
public class CampingRepository {
	
	public Camping detailCamping(SqlSession sqlSession, String campNo) {
		return sqlSession.selectOne("campingMapper.detailCamping", campNo);
	}

}
