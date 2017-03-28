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
	
	// 메인 화면 
	@RequestMapping("meninblack.mib")
	public ModelAndView meninblack(){
				
		ModelAndView mav = new ModelAndView("main/Main");
		mav.addObject("msg", "김옥지");
		
		return mav;
		
	}
	
	// 로그인 모달 팝업 
	@RequestMapping("login.mib")
	public ModelAndView login(){
			
		ModelAndView mav = new ModelAndView("main/empty/modal/modladla/SignIn");
		mav.addObject("msg", "김옥지");
		
		return mav;
		
	}
	// 로그인입력후 전송 
	@RequestMapping("loginCheck.mib")
	public ModelAndView loginCheck(HttpServletRequest res){
		
		String id = res.getParameter("id");
		String pwd = res.getParameter("pwd");
		
		MainDto dto =  mainSvc.do_search_pw(id);
		ModelAndView mav = new ModelAndView("main/Main");
		
		if(dto!=null){
			if(pwd.equals(dto.getUSER_PW())){
				// 로그인 됬을 때 
				res.getSession().setAttribute("LoginInfo", dto);
			}else{
				// 비밀번호 틀렸을 때 
				mav.addObject("LoginInfo", "NotPwd");
			}
		}else{
			// 로그인 안됬을 때 
			mav.addObject("LoginInfo", "NoMember");
		}
		
		return mav;		
	}
	
	@RequestMapping("signup.mib")
	public ModelAndView signup(){
		
		ModelAndView mav = new ModelAndView("main/empty/modal/modladla/SignUp");
		mav.addObject("msg", "김옥지");
		
		return mav;
		
	}

	
}
