package com.aug.hr.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.validation.ConstraintViolationException;

import javassist.NotFoundException;
import javassist.tools.web.BadHttpRequest;

import org.apache.http.HttpException;
import org.springframework.http.HttpStatus;
import org.springframework.web.HttpMediaTypeException;
import org.springframework.web.HttpMediaTypeNotSupportedException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.aug.exception.CustomException;




@ControllerAdvice
@EnableWebMvc
public class ControllerAdviceException {
	
	
			private static final long serialVersionUID = 1L;
		
			
			//500
			@ExceptionHandler(ConstraintViolationException.class)
			@ResponseStatus(value=HttpStatus.INTERNAL_SERVER_ERROR)
		    public ModelAndView handleSQLException500 (ConstraintViolationException exception) throws Exception{
				  System.out.println("exception: SQL");
				  ModelAndView andView = new ModelAndView();
				  andView.setViewName("/error/500");
				  return andView;
			}
			
			
			//500
			@ExceptionHandler(SQLException.class)
			@ResponseStatus(value=HttpStatus.INTERNAL_SERVER_ERROR)
		    public ModelAndView handleSQLException500 (SQLException exception) throws Exception{
				  System.out.println("exception: SQL");
				  ModelAndView andView = new ModelAndView();
				  andView.setViewName("/error/500");
				  return andView;
			}
			
	
			
			//404
			@ExceptionHandler(NotFoundException.class)
			@ResponseStatus(value=HttpStatus.NOT_FOUND)
		    public ModelAndView handleNullPointerException (NotFoundException exception){
				  System.out.println("exception: Not found");
				  System.out.println("msg: "+exception.getMessage());
				  ModelAndView andView = new ModelAndView();				  
				  //andView.addObject("exceptionMsg",exception.getMessage());
				
				   andView.setViewName("/error/404");
				   return andView;
				
	
			}
			
			
			
			//400
			@ExceptionHandler(BadHttpRequest.class)
			@ResponseStatus(value=HttpStatus.BAD_REQUEST)
		    public ModelAndView handleBadRequestException (BadHttpRequest exception){
				  System.out.println("exception: Bad Request");
				  System.out.println("msg: "+exception.getMessage());
				  ModelAndView andView = new ModelAndView();				  
				  //andView.addObject("exceptionMsg",exception.getMessage());
				
				   andView.setViewName("/error/500");
				   return andView;
				
	
			}
			
			
			
			//415
			@ExceptionHandler(HttpMediaTypeNotSupportedException.class)
			@ResponseStatus(value=HttpStatus.UNSUPPORTED_MEDIA_TYPE)
		    public ModelAndView handleHttpMediaTypeException (HttpMediaTypeNotSupportedException exception){
				  System.out.println("exception: UnSupported Media Type");
				  System.out.println("msg: "+exception.getMessage());
				  ModelAndView andView = new ModelAndView();				  
				  //andView.addObject("exceptionMsg",exception.getMessage());
				
				   andView.setViewName("/error/415");
				   return andView;
				
	
			}
			
			
			//Another HttpException
			@ExceptionHandler(HttpException.class)
			 public ModelAndView handleAnotherException (HttpException exception){
				  System.out.println("exception: Http Exception");
				  System.out.println("msg: "+exception.getMessage());
				  ModelAndView andView = new ModelAndView();				  
				  //andView.addObject("exceptionMsg",exception.getMessage());
				
				   andView.setViewName("/error/exception_error");
				   return andView;
				
	
			}
			
			
			
			//IOException
			@ExceptionHandler(IOException.class)
			 public ModelAndView handleIOException (IOException exception){
				  System.out.println("exception: IOException");
				  System.out.println("msg: "+exception.getMessage());
				  ModelAndView andView = new ModelAndView();		
				  andView.addObject("msg", ","+exception.getMessage());
				  //andView.addObject("exceptionMsg",exception.getMessage());			
				  andView.setViewName("/error/exception_error");
				  return andView;
				
	
			}
			
			
			
			 //Exception
			 @ExceptionHandler(Exception.class)
			 public ModelAndView handleException (Exception exception){
				  System.out.println("exception: Exception");
				  System.out.println("msg: "+exception.getMessage());
				  ModelAndView andView = new ModelAndView();		
				  andView.addObject("msg", ","+exception.getMessage());
				  //andView.addObject("exceptionMsg",exception.getMessage());			
				  andView.setViewName("/error/exception_error");
				  return andView;		
	
			}
			 
			 
			 //Exception
			 @ExceptionHandler(CustomException.class)
			 @ResponseStatus(value=HttpStatus.INTERNAL_SERVER_ERROR)
			 @ResponseBody
			 public String handleBusinessException (CustomException exception){
				  String msg = "Error: "+exception.getErrMsg();
				  System.out.println("msg: "+msg);			 
				  return msg;		
	
			}
						
			
}

