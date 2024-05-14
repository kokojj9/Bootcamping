package com.kh.bootcamping.reservation.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.bootcamping.reservation.model.service.ReservationService;
import com.kh.bootcamping.reservation.model.vo.Reservation;

@Controller
public class ReservationController {
	
	@Autowired
	private ReservationService reservationService;
	
	
	@ResponseBody
	@GetMapping(value="successReservation")
	public void insertResrvation(Reservation reservation, HttpServletResponse response) throws IOException {
		
		int result  = reservationService.insertReservation(reservation);
		
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().print(result > 0 ?  "success" : "fail");
	}
	
	
	
	

	

}
