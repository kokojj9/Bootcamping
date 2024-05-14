package com.kh.bootcamping.notice.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bootcamping.notice.model.dao.NoticeRepository;
import com.kh.bootcamping.notice.model.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private NoticeRepository noticeRepository;
	
	
	
	@Override
	public List<Notice> selectList() {
		
		return null;
	}

	@Override
	public int insert(Notice notice) {
		
		return 0;
	}

	@Override
	public Notice selectNotice(int Notice) {
		
		return null;
	}

	@Override
	public int delete(int NoticeNo) {
		
		return 0;
	}

	@Override
	public int update(Notice notice) {
		
		return 0;
	}

}
