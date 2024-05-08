package com.kh.bootcamping.reservation.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class Reservation {

	private int reservationNo;
	private int memberNo;
	private int siteNo;
	private Date checkInDate;
	private Date checkoutDate;
	private String reservationDays;
	private Date reservationDate;
	private int people;
	private int price;
	private String reserName;
	private String reserPhone;
	private String reserStatus;
	private String campNo;
	private int typeNo;
	private int priceNo;
	
}
