package com.kh.bootcamping.reservation.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bootcamping.common.model.vo.PageInfo;
import com.kh.bootcamping.reservation.model.dao.ReservationRepository;
import com.kh.bootcamping.reservation.model.vo.Reservation;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private ReservationRepository reservationRepository;
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertReservation(Reservation reservation) {
		return reservationRepository.insertReservation(sqlSession, reservation);
	}

	@Override
	public int selectListCount(String memberId) {
		return reservationRepository.selectListCount(sqlSession, memberId);
	}

	@Override
	public List<Reservation> selectReservationList(PageInfo pi, String memberId) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return reservationRepository.selectReservationList(sqlSession, memberId, rowBounds);
	}
	


}
