package com.eagle.men_in_black.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.eagle.men_in_black.model.MainDto;
import com.eagle.men_in_black.service.MainSvc;

@Controller
public class MainController {
	Logger loger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private MainSvc mainSvc;
	
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
	// 로그인입력후 전송 
	@RequestMapping("loginCheck.mib")
	public ModelAndView loginCheck(HttpServletRequest res){
		
		loger.debug("=Controller ===========================");
		loger.debug("codeMSvc === " + "김옥지");
		loger.debug("============================");
		
		String id = res.getParameter("ID");

		System.out.println("로그인한 아이디 넘어왔는지 ****************** == "+id);
		
		MainDto dto =  mainSvc.do_search_pw(id);
		
		ModelAndView mav = new ModelAndView("main/Main");
		mav.addObject("userDto", dto);
		System.out.println("dlfjstlqkfksandlsndlkansldknasldnsalk"+dto.getADDRESS());
		System.out.println("dlfjstlqkfksandlsndlkansldknasldnsalk"+dto.getBIRTH());
		System.out.println("dlfjstlqkfksandlsndlkansldknasldnsalk"+dto.getUSER_PW());
		System.out.println("dlfjstlqkfksandlsndlkansldknasldnsalk"+dto.getUSER_NAME());
		
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
