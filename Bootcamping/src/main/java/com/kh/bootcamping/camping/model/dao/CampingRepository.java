package com.kh.bootcamping.camping.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.bootcamping.camping.model.vo.Camping;
import com.kh.bootcamping.camping.model.vo.Site;
import com.kh.bootcamping.reservation.model.vo.Reservation;

@Repository
public class CampingRepository {
	
	public Camping detailCamping(SqlSession sqlSession, String campNo) {
		return sqlSession.selectOne("campingMapper.detailCamping", campNo);
	}

	public List<Site> siteList (SqlSession sqlSession, String campNo){
		return sqlSession.selectList("campingMapper.siteList", campNo);
	}
	

	public Site campingReservation(SqlSession sqlSession, int siteNo) {
		return sqlSession.selectOne("campingMapper.campingReservation", siteNo);
	}

}
