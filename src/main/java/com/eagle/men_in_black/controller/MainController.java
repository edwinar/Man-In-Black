package com.eagle.men_in_black.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@RequestMapping("login.mib")
	public ModelAndView login(){
		
		loger.debug("=Controller ===========================");
		loger.debug("codeMSvc === " + "김옥지");
		loger.debug("============================");
		
		ModelAndView mav = new ModelAndView("main/empty/modal/modladla/SignIn");
		mav.addObject("msg", "김옥지");
		
		return mav;
		
	}
	
	@RequestMapping("signup.mib")
	public ModelAndView signup(){
		
		loger.debug("=Controller ===========================");
		loger.debug("codeMSvc === " + "김옥지");
		loger.debug("============================");
		
		ModelAndView mav = new ModelAndView("main/empty/modal/modladla/SignUp");
		mav.addObject("msg", "김옥지");
		
		return mav;
		
	}

	
}
