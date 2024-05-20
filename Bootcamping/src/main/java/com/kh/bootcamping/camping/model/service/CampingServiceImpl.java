package com.kh.bootcamping.camping.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bootcamping.camping.model.dao.CampingRepository;
import com.kh.bootcamping.camping.model.vo.Camping;
import com.kh.bootcamping.camping.model.vo.Site;
import com.kh.bootcamping.common.model.vo.PageInfo;
import com.kh.bootcamping.reservation.model.vo.ReservationInfo;

@Service
public class CampingServiceImpl implements CampingService {

	@Autowired
	private CampingRepository campingRepository;
	
	@Autowired
	private SqlSession sqlSession;
	

	@Override
	public Camping detailCamping(String campNo) {
		return campingRepository.detailCamping(sqlSession, campNo);
	}

	@Override
	public List<Site> siteList(String campNo) {
		return campingRepository.siteList(sqlSession, campNo);
	}

	@Override
	public Site campingReservation(int siteNo) {
		return campingRepository.campingReservation(sqlSession, siteNo);
	}

	@Override
	public List<Site> selectDate(ReservationInfo ReservationInfo) {
		return campingRepository.selectDate(sqlSession, ReservationInfo);
	}

	@Override
	public int selectSearchCount(String keyword) {
		return campingRepository.selectSearchCount(sqlSession, keyword);
	}
	
	/*
	@Override

	public List<Camping> searchList(PageInfo pi, String keyword) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return campingRepository.searchList(sqlSession, keyword, rowBounds);
	}
	*/
	
	@Override
	public List<Camping> searchList(String keyword) {

		return campingRepository.searchList(sqlSession, keyword);
	}


}
