package com.aug.hr.controller;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.aug.exception.CustomException;



@ControllerAdvice
@EnableWebMvc
public class ControllerAdviceException {
	
	
			private static final long serialVersionUID = 1L;
		
			@ExceptionHandler(Exception.class)
			@ResponseStatus(value=HttpStatus.INTERNAL_SERVER_ERROR)
		    public ModelAndView handleSQLException500 (Exception exception) throws Exception{
				  System.out.println("exception: SQL500");
//		          throw new CustomException("=====================================500", "Test");
				  ModelAndView andView = new ModelAndView();
				  andView.setViewName("/error/500");
				  return andView;
			}
			
			@ExceptionHandler(Throwable.class)
			@ResponseStatus(value=HttpStatus.NOT_FOUND)
		    public ModelAndView handleSQLException404(Throwable t) throws Throwable{
//				  System.out.println("====================================exception: SQL404");
//				  ModelAndView andView = new ModelAndView();
//				  andView.addObject("exception", t);
//				  andView.setViewName("/error/404");
		          throw new CustomException("404", "Test");
//				  return andView;
			}
			
			@ExceptionHandler(CustomException.class)
			public ModelAndView handleCustomException(CustomException ex) {
				ModelAndView model = new ModelAndView();
				model.addObject("exception", ex);
				return model;
	
			}
			
}

