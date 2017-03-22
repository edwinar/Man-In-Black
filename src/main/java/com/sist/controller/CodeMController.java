package com.sist.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CodeMController {
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@RequestMapping("code/code_msg.do")
	public ModelAndView code_msg11() {

		logger.debug("=Controller ===========================");
		logger.debug("============================");

		ModelAndView mav = new ModelAndView("code/code_m");
		mav.addObject("msg", "hello maninblack");

		return mav;

	}

}
