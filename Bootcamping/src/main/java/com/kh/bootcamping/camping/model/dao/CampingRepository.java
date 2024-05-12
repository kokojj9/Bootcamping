package com.kh.bootcamping.camping.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.bootcamping.camping.model.vo.Camping;
import com.kh.bootcamping.camping.model.vo.Site;

@Repository
public class CampingRepository {
	
	public Camping detailCamping(SqlSession sqlSession, String campNo) {
		return sqlSession.selectOne("campingMapper.detailCamping", campNo);
	}

	public List<Site> siteList (SqlSession sqlSession, String campNo){
		return sqlSession.selectList("campingMapper.siteList", campNo);
	}

}
