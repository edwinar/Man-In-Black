package com.eagle.man_in_black.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class MainController {
	Logger loger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping("meninblack.mib")
	public ModelAndView meninblack(){
		
		loger.debug("=Controller ===========================");
		loger.debug("codeMSvc === " + "김옥지");
		loger.debug("============================");
		
		ModelAndView mav = new ModelAndView("main/Main");
		mav.addObject("msg", "김옥지");
		
		return mav;
		
	}
}
