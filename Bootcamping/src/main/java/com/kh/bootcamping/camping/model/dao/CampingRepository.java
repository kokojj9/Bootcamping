package com.kh.bootcamping.camping.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.bootcamping.camping.model.vo.Camping;
import com.kh.bootcamping.camping.model.vo.Site;
import com.kh.bootcamping.reservation.model.vo.ReservationInfo;

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
	
	public List<Site> selectDate(SqlSession sqlSession, ReservationInfo reservationInfo) {
		return sqlSession.selectList("campingMapper.selectDate", reservationInfo);
	}
	
	public int selectSearchCount(SqlSession sqlSession, String keyword) {
		return sqlSession.selectOne("campingMapper.selectSearchCount", keyword);
	}
	
	/*
	public List<Camping> searchList (SqlSession sqlSession, String keyword, RowBounds rowBounds){
		return sqlSession.selectList("campingMapper.searchList", keyword, rowBounds);
	}
	*/

	public List<Camping> searchList (SqlSession sqlSession, String keyword){
		return sqlSession.selectList("campingMapper.searchList", keyword);
		
	}
}
