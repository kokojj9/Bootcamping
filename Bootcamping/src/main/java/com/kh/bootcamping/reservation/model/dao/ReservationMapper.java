package com.kh.bootcamping.reservation.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.bootcamping.reservation.model.vo.Reservation;

@Mapper
public interface ReservationMapper {

	int insertReservation(Reservation reservation);

	int selectReservationListCount(String memberId);

	List<Reservation> selectReservationList(String memberId, RowBounds rowBounds);

	
	
}
