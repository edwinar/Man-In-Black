package com.eagle.men_in_black.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ServiceController {
	Logger loger = LoggerFactory.getLogger(this.getClass());
	
	
	@RequestMapping("servicenotice.mib")
	public ModelAndView coupon_Administer() {

		ModelAndView mav = new ModelAndView("service/notice");
		
		return mav;

	}
}
