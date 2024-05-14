package com.kh.bootcamping.reservation.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.bootcamping.reservation.model.vo.Reservation;

@Repository
public class ReservationRepository {
	
	public int insertReservation (SqlSession sqlSession, Reservation reservation) {
		return sqlSession.insert("reservationMapper.insertReservation", reservation);
	}

}
