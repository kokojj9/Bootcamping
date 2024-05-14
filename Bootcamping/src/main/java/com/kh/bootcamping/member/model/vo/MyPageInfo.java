package com.kh.bootcamping.member.model.vo;

import java.util.List;

import com.kh.bootcamping.board.model.vo.Board;
import com.kh.bootcamping.camping.model.vo.Camping;
import com.kh.bootcamping.reservation.model.vo.Reservation;
import com.kh.bootcamping.trade.model.vo.TradeBoard;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor

public class MyPageInfo {
	
	private Member member;
	private List<Reservation> reservationList; 
	private List<TradeBoard> tradeBoardList;
	private List<Camping> wishList;
	private List<Board> boardList;
	
}
