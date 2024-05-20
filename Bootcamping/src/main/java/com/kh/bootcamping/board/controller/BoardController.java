package com.kh.bootcamping.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.bootcamping.board.model.service.BoardService;

@Controller
public class BoardController {
	
	// 게시판은 페이징처리를 할 예정 
	@Autowired
	private BoardService boardService;
	
	
	//header.jsp에서 클릭시 => 1 =>list.board
	// 페이징바에서 눌렀다 => list.board?page=요청페이지
	@GetMapping("list.board")
	public String selectAll(Model model) {
		
		return "board/boardList";
	}
	
	
	
	@GetMapping("insert.board")
	public String insert(Model model) {
		
		return "board/boardEnrollForm";
	}
	
	
	
}

