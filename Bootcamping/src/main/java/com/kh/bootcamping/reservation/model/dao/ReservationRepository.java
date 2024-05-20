package com.kh.bootcamping.reservation.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.bootcamping.reservation.model.vo.Reservation;

@Repository
public class ReservationRepository {
	
	public int insertReservation (SqlSession sqlSession, Reservation reservation) {
		return sqlSession.insert("reservationMapper.insertReservation", reservation);
	}

	public int selectReservationListCount(SqlSession sqlSession, String memberId) {
		return sqlSession.selectOne("reservationMapper.selectReservationListCount", memberId);
	}

	public List<Reservation> selectReservationList(SqlSession sqlSession, String memberId,RowBounds rowBounds) {
		return sqlSession.selectList("reservationMapper.selectReservationList", memberId, rowBounds);
	}

}
