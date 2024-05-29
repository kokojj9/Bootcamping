package com.kh.bootcamping.camping.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.bootcamping.camping.model.vo.Camping;
import com.kh.bootcamping.camping.model.vo.CampingCheck;
import com.kh.bootcamping.camping.model.vo.Site;
import com.kh.bootcamping.camping.model.vo.WishList;
import com.kh.bootcamping.reservation.model.vo.ReservationInfo;

@Mapper
public interface CampingMapper {

	Camping detailCamping(String campNo);
	
	List<Site> siteList(String campNo);
	
	Site campingReservation(int siteNo);
	
	List<Site> selectDate(ReservationInfo ReservationInfo);
	
	int selectSearchCount(String keyword);
	
	List<Camping> searchList(String keyword, RowBounds rowBounds);
	
	int checkCampingCount(CampingCheck campingCheck);
	
	List<Camping> checkCamping(CampingCheck campingCheck, RowBounds rowBounds);
	
	int insertHeart(WishList wishList);
	
	int deleteHeart(WishList wishList);
	
	List<Camping> selectMainCamping();
}
