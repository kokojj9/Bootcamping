package com.kh.bootcamping.trade.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class TradeBoard {
	private int tradeBoardNo;
	private int memberNo;
	private String categoryName;
	private String boardtitle;
	private String boardContent;
	private String tradeStatus;
	private Date enrollDate;
	private Date updateDate;
	private String status;
	private int count;
}
