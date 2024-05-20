package com.kh.bootcamping.camping.model.service;

import java.util.List;

import com.kh.bootcamping.camping.model.vo.Camping;
import com.kh.bootcamping.camping.model.vo.Site;
import com.kh.bootcamping.common.model.vo.PageInfo;
import com.kh.bootcamping.reservation.model.vo.ReservationInfo;

public interface CampingService {

	Camping detailCamping(String campNo);
	
	List<Site> siteList(String campNo);
	
	Site campingReservation (int siteNo);
	
	List<Site> selectDate(ReservationInfo ReservationInfo);

	int selectSearchCount (String keyword);
	
	List<Camping> searchList (String keyword);
}
