package com.kh.bootcamping.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.bootcamping.board.model.service.BoardService;
import com.kh.bootcamping.common.model.vo.PageInfo;
import com.kh.bootcamping.common.template.Pagination;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class BoardController {
	
	// 게시판은 페이징처리를 할 예정 
	@Autowired
	private BoardService boardService;
	
	
	//header.jsp에서 클릭시 => 1 =>list.board(처음 게시판 들어갈 때)
	// 페이징바에서 눌렀다 => list.board?page=요청페이지
	@RequestMapping("list.board")
	public String selectAll(@RequestParam(value="page",defaultValue="1")
							int page,
								Model model) {
		// 총개수 == DB가서 조회
		// 요청페이지 == ?
		// 한페이지에 몇개 ==5
		// 페이징 바 몇개 ==5
		
		PageInfo pi=Pagination.getPageInfo(boardService.selectListCount(),
											page, 
											5, 
											5);
		
		//System.out.println("페이징 인포:"+pi);
		
		log.info("페이지인포={}",pi);
		
		return "board/boardList";
	}
	
	
	
	@RequestMapping("insert.board")
	public String insert(Model model) {
		
		return "board/boardEnrollForm";
	}
	
	
	
}

