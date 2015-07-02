package com.aug.hr.controller;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;



@ControllerAdvice
@EnableWebMvc
public class ControllerAdviceException {
	
	
			private static final long serialVersionUID = 1L;

			
		
			@ExceptionHandler(Exception.class)
			@ResponseStatus(value=HttpStatus.INTERNAL_SERVER_ERROR)
		    public ModelAndView handleSQLException(Exception exception){
				  System.out.println("exception: SQL");
		          ModelAndView andView = new ModelAndView();
			      andView.setViewName("/error/404");
		          return andView;
				  //return "/error/404";
			}
}

