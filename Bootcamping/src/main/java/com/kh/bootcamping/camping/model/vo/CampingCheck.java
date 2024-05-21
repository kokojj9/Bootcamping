package com.kh.bootcamping.camping.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString @NoArgsConstructor @AllArgsConstructor
public class CampingCheck {
	
	private String[] types;
	private String[] addresses;

}
