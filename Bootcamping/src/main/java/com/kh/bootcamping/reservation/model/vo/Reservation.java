package com.kh.bootcamping.reservation.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString @NoArgsConstructor @AllArgsConstructor
public class Reservation {

	private int reservationNo;
	private String memberNo;
	private int siteNo;
	private String checkInDate;
	private String checkOutDate;
	private String reservationDate;
	private int people;
	private String reserName;
	private String reserPhone;
	private int price;
	private String reserStatus;

	private String campNo;
	private String campName;
	private int typeNo;
	private String priceNo;

}
