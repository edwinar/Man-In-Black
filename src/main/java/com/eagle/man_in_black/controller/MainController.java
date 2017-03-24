package com.eagle.man_in_black.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

public class MainController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping("main/dudwo123.do")
	public ModelAndView code_msg11(){
		
		logger.debug("=Controller ===========================");
		logger.debug("codeMSvc === " + "김옥지");
		logger.debug("============================");
		
		ModelAndView mav = new ModelAndView("main/Main");
		mav.addObject("msg", "김옥지");
		
		return mav;
		
	}
}
