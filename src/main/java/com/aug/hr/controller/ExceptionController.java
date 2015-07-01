package com.aug.hr.controller;

import org.springframework.web.bind.annotation.RequestMapping;

public class ExceptionController {
	

	 @RequestMapping(value="/400")
	 public String error400(){
	  System.out.println("custom error handler");
	  return "/error/404.jsp";
	 }
	
	
	 @RequestMapping(value="/404")
	 public String error404(){
	  System.out.println("custom error handler");
	  return "/error/404.jsp";
	 }
	 
	
	 
	 @RequestMapping(value="/500")
	 public String error500(){
	  System.out.println("custom error handler");
	  return "/error/404.jsp";
	 }
	 
	

}
