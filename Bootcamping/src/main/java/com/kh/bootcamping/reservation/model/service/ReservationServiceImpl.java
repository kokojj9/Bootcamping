package com.kh.bootcamping.reservation.model.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bootcamping.reservation.model.dao.ReservationRepository;
import com.kh.bootcamping.reservation.model.vo.Reservation;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private ReservationRepository reservationRepository;
	
	@Autowired
	private SqlSession sqlSession;
	


}
