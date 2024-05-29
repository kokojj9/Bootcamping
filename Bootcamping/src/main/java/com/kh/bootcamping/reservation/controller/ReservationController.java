package com.kh.bootcamping.reservation.controller;

import java.nio.charset.Charset;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.bootcamping.reservation.model.vo.ResponseData;
import com.kh.bootcamping.reservation.model.service.ReservationService;
import com.kh.bootcamping.reservation.model.vo.Reservation;

@Controller
public class ReservationController {
   
   @Autowired
   private ReservationService reservationService;
   
   @ResponseBody
   @PostMapping("successReservation")
   public ResponseEntity<ResponseData> insertResrvation(Reservation reservation) {

      int result  = reservationService.insertReservation(reservation);
      
      HttpHeaders header = new HttpHeaders();
      header.setContentType(new MediaType("application", "json", Charset.forName("UTF-8")));
      
      ResponseData rd = ResponseData.builder()
                             .data(result)
                             .message("success")
                             .responseCode("C-00")
                             .build();
      
      return new ResponseEntity<ResponseData>(rd, header, HttpStatus.OK);
   }
   
   
   
   

   

}