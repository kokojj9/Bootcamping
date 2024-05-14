package com.kh.bootcamping.camping.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString @NoArgsConstructor @AllArgsConstructor
public class Site {

	private int siteNo;
	private String campNo;
	private String typeCode;
	private String siteName;
	private String sitePath;
	private String siteYn;
	private int sitePrice;
	private String typeName;
	private String campName;
	private String campImg;
	
}
