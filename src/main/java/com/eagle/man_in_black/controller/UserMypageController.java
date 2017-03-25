package com.eagle.man_in_black.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserMypageController {
	Logger loger = LoggerFactory.getLogger(this.getClass());
	// 회원정보수정 
		@RequestMapping("mymain.mib")
		public ModelAndView mymain(){
			
			loger.debug("=Controller ===========================");
			loger.debug("codeMSvc === " + "앙 기무띠~");
			loger.debug("============================");
			
			ModelAndView mav = new ModelAndView("mypage/usermypage/MypageMain");
			mav.addObject("msg", "김옥지");
			
			return mav;
			
		}
	// 회원정보수정 
	@RequestMapping("userup.mib")
	public ModelAndView userupdate(){
		
		loger.debug("=Controller ===========================");
		loger.debug("codeMSvc === " + "앙 기무띠~");
		loger.debug("============================");
		
		ModelAndView mav = new ModelAndView("mypage/usermypage/Userupdate");
		mav.addObject("msg", "김옥지");
		
		return mav;
		
	}
	// 구매목록 
	@RequestMapping("buylist.mib")
	public ModelAndView buylist(){
		
		loger.debug("=Controller ===========================");
		loger.debug("codeMSvc === " + "앙 기무띠~");
		loger.debug("============================");
		
		ModelAndView mav = new ModelAndView("mypage/usermypage/Buylist");
		mav.addObject("msg", "김옥지");
		
		return mav;
		
	}
	// 장바구니 
	@RequestMapping("basketlist.mib")
	public ModelAndView basketlist(){
		
		loger.debug("=Controller ===========================");
		loger.debug("codeMSvc === " + "앙 기무띠~");
		loger.debug("============================");
		
		ModelAndView mav = new ModelAndView("mypage/usermypage/Basketlist");
		mav.addObject("msg", "김옥지");
		
		return mav;
		
	}
	// 오늘본 상품 
	@RequestMapping("todayGoods.mib")
	public ModelAndView todayGoods(){
		
		loger.debug("=Controller ===========================");
		loger.debug("codeMSvc === " + "앙 기무띠~");
		loger.debug("============================");
		
		ModelAndView mav = new ModelAndView("mypage/usermypage/TodayGoods");
		mav.addObject("msg", "김옥지");
		
		return mav;
		
	}
	// 내가쓴 게시물 보기 
	@RequestMapping("myboard.mib")
	public ModelAndView myboard(){
		
		loger.debug("=Controller ===========================");
		loger.debug("codeMSvc === " + "앙 기무띠~");
		loger.debug("============================");
		
		ModelAndView mav = new ModelAndView("mypage/usermypage/Myboard");
		mav.addObject("msg", "김옥지");
		
		return mav;
		
	}
	// 쿠폰 그리고 적립금 
	@RequestMapping("coupon_Mileage.mib")
	public ModelAndView coupon_Mileage(){
		
		loger.debug("=Controller ===========================");
		loger.debug("codeMSvc === " + "앙 기무띠~");
		loger.debug("============================");
		
		ModelAndView mav = new ModelAndView("mypage/usermypage/Coupon_Mileage");
		mav.addObject("msg", "김옥지");
		
		return mav;
		
	}
	
	
}
