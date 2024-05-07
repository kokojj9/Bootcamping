package com.kh.bootcamping.camping.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bootcamping.camping.model.dao.CampingRepository;
import com.kh.bootcamping.camping.model.vo.Camping;

@Service
public class CampingServiceImpl implements CampingService {

	@Autowired
	private CampingRepository campingRepository;
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertCamping(List<Camping> campingList) {
		return campingRepository.insertCamping(sqlSession, campingList);
	}

}
