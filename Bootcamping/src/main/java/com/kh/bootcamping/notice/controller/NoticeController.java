package com.kh.bootcamping.notice.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


import com.kh.bootcamping.notice.model.service.NoticeService;



@Controller
public class NoticeController {
	
	// 공지사항은 페이징처리 안함
	@Autowired
	private NoticeService noticeService;
	
	
	@GetMapping("list.notice")
	public String selectAll(Model model) {
		
		//model.addAttribute("list",noticeService.selectList());
		
		return "notice/notice";
	}
	
	
	
	
		
	
}
