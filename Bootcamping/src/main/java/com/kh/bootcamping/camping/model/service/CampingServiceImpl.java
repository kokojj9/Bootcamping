package com.kh.bootcamping.camping.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.kh.bootcamping.camping.model.dao.CampingMapper;
import com.kh.bootcamping.camping.model.dao.CampingRepository;
import com.kh.bootcamping.camping.model.vo.Camping;
import com.kh.bootcamping.camping.model.vo.CampingCheck;
import com.kh.bootcamping.camping.model.vo.Site;
import com.kh.bootcamping.camping.model.vo.WishList;
import com.kh.bootcamping.common.model.vo.PageInfo;
import com.kh.bootcamping.reservation.model.vo.ReservationInfo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CampingServiceImpl implements CampingService {

	private final CampingRepository campingRepository;
	private final CampingMapper campingMapper;

	@Override
	public Camping detailCamping(String campNo) {
		return campingMapper.detailCamping(campNo);
	}

	@Override
	public List<Site> siteList(String campNo) {
		return campingMapper.siteList(campNo);
	}

	@Override
	public Site campingReservation(int siteNo) {
		return campingMapper.campingReservation(siteNo);
	}

	@Override
	public List<Site> selectDate(ReservationInfo ReservationInfo) {
		return campingMapper.selectDate(ReservationInfo);
	}

	@Override
	public int selectSearchCount(String keyword) {
		return campingMapper.selectSearchCount(keyword);
	}
	
	
	@Override
	public List<Camping> searchList(PageInfo pi, String keyword) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return campingMapper.searchList(keyword, rowBounds);
	}

	@Override
	public int checkCampingCount(CampingCheck campingCheck) {
		return campingMapper.checkCampingCount(campingCheck);

	}

	@Override
	public List<Camping> checkCamping(PageInfo pi, CampingCheck campingCheck) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
				
		return campingMapper.checkCamping(campingCheck, rowBounds);
	}

	@Override
	public int insertHeart(WishList wishList) {
		return campingMapper.insertHeart(wishList);
	}

	@Override
	public int deleteHeart(WishList wishList) {
		return campingMapper.deleteHeart(wishList);
	}

	@Override
	public List<Camping> selectMainCamping() {
		return campingMapper.selectMainCamping();
	}




}
