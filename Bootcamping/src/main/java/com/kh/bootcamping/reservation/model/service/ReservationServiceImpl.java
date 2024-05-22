package com.kh.bootcamping.reservation.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.kh.bootcamping.common.model.vo.PageInfo;
import com.kh.bootcamping.reservation.model.dao.ReservationMapper;
import com.kh.bootcamping.reservation.model.vo.Reservation;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class ReservationServiceImpl implements ReservationService {

	//private ReservationRepository reservationRepository;
	//private SqlSession sqlSession;
	private final ReservationMapper reservationMapper;

	@Override
	public int insertReservation(Reservation reservation) {
		return reservationMapper.insertReservation(reservation);
	}

	@Override
	public int selectReservationListCount(String memberId) {
		return reservationMapper.selectReservationListCount(memberId);
	}

	@Override
	public List<Reservation> selectReservationList(PageInfo pi, String memberId) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return reservationMapper.selectReservationList(memberId, rowBounds);
	}

	

	
	


}
