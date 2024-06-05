package com.kh.bootcamping.common.template;

import java.nio.charset.Charset;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;

import com.kh.bootcamping.member.model.vo.Member;
import com.kh.bootcamping.member.model.vo.ResponseData;

@Component
public class ResponseTemplateImpl implements ResponseTemplate {

	@Override
	public ResponseEntity<ResponseData> success(String message, String code, Member data) {
	    ResponseData rd = new ResponseData();
	    HttpHeaders headers = new HttpHeaders();
	    headers.setContentType(new MediaType("application", "json", Charset.forName("UTF-8")));
	    
	    rd = ResponseData.builder().responseCode(code)
	                     .resultMessage(message)
	                     .data(data)
	                     .build();

	    return new ResponseEntity<ResponseData>(rd, headers, HttpStatus.OK);
	}

	@Override
	public ResponseEntity<ResponseData> fail(String message, HttpStatus status) {
	    HttpHeaders headers = new HttpHeaders();
	    headers.setContentType(new MediaType("application", "json", Charset.forName("UTF-8")));
	    
	    return new ResponseEntity<ResponseData>(headers, status);
	}

}
