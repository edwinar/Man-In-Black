package com.eagle.man_in_black.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CodeMController {
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@RequestMapping("code/code_msg.mib")
	public String code_msg(){
		
		logger.debug("=Controller ===========================");
		logger.debug("codeMSvc === " + "앙 기무띠~");
		logger.debug("============================");
		
		
		
		return "code/code_m";
		
	}
	@RequestMapping("code/code_msg11.mib")
	public ModelAndView code_msg11(){
		
		logger.debug("=Controller ===========================");
		logger.debug("codeMSvc === " + "김옥지");
		logger.debug("============================");
		
		ModelAndView mav = new ModelAndView("code/code_m");
		mav.addObject("msg", "김옥지");
		
		return mav;
		
	}
	
	
	

}
