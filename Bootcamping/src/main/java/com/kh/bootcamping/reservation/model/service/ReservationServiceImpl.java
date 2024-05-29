package com.kh.bootcamping.reservation.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.kh.bootcamping.common.model.vo.PageInfo;
import com.kh.bootcamping.common.template.Pagination;
import com.kh.bootcamping.reservation.model.dao.ReservationMapper;
import com.kh.bootcamping.reservation.model.vo.Reservation;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class ReservationServiceImpl implements ReservationService {

	private final ReservationMapper reservationMapper;
	private final Pagination pagination;

	@Override
	public int insertReservation(Reservation reservation) {
		return reservationMapper.insertReservation(reservation);
	}

	@Override
	public PageInfo getReservationPageInfo(String memberId, int page, int boardLimit, int pageLimit) {
		int count = reservationMapper.selectReservationListCount(memberId);
		
		return pagination.getPageInfo(count, page, boardLimit, pageLimit);
	}

	@Override
	public List<Reservation> selectReservationList(PageInfo pi, String memberId) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return reservationMapper.selectReservationList(memberId, rowBounds);
	}


	

	
	


}
