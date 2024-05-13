package com.kh.bootcamping.reservation.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString @NoArgsConstructor @AllArgsConstructor
public class ReservationInfo {
	
    private String startDate;
    private String endDate;
    private int countPeople;
}
