package com.kh.bootcamping.common.template;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import com.kh.bootcamping.member.model.vo.Member;
import com.kh.bootcamping.member.model.vo.ResponseData;

public interface ResponseTemplate {

	public ResponseEntity<ResponseData> success(String type, String code, Member data);
	
	public ResponseEntity<ResponseData> fail(String message, HttpStatus status);
}
