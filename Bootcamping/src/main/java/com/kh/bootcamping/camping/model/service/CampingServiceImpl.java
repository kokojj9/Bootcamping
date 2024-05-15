package com.kh.bootcamping.camping.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bootcamping.camping.model.dao.CampingRepository;
import com.kh.bootcamping.camping.model.vo.Camping;
import com.kh.bootcamping.camping.model.vo.Site;
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
	public Site selectDate(ReservationInfo ReservationInfo) {
		return campingRepository.selectDate(sqlSession, ReservationInfo);
	}
	

}
