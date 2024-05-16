package com.kh.bootcamping.reservation.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.bootcamping.reservation.model.service.ReservationService;
import com.kh.bootcamping.reservation.model.vo.Reservation;

@Controller
public class ReservationController {
	
	@Autowired
	private ReservationService reservationService;
	
	
	@ResponseBody
	@PostMapping("successReservation")
	public String insertResrvation(Reservation reservation) {
		System.out.println(reservation);
		
		int result  = reservationService.insertReservation(reservation);
		
		return result > 0 ? "success" : "fail";
	}
	
	
	
	

	

}
