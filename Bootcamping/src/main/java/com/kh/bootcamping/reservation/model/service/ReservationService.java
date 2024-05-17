package com.kh.bootcamping.reservation.model.service;

import java.util.List;

import com.kh.bootcamping.common.model.vo.PageInfo;
import com.kh.bootcamping.reservation.model.vo.Reservation;

public interface ReservationService {
	
	int insertReservation(Reservation reservation);
	
	int selectReservationListCount(String memberId);

	List<Reservation> selectReservationList(PageInfo pi, String memberId);

}
