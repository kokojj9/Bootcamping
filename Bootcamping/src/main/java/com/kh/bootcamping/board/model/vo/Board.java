package com.kh.bootcamping.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class Board {
	
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private Date createDate;
	private Date updateDate;
	private String status;
	private String memberNo;
	private String categoryCode;
	private String categoryName;
	private int count;

}
