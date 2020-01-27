package com.pd.controllor;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping(value = "/userController")
public class UserController {
	
	@RequestMapping(value = "/prikaziSliku", method = RequestMethod.POST)
	public String prikaziSliku(MultipartFile mpf, HttpServletRequest request) {
		System.err.println("*********************************");
		System.out.println(mpf.toString());
		return "index";
	}
	
}
