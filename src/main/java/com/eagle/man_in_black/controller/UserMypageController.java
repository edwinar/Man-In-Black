package com.eagle.man_in_black.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserMypageController {

	@RequestMapping("userup.mib")
	public ModelAndView userupdate(){
		
		ModelAndView mav = new ModelAndView("mypage/usermypage/Userupdate");
		mav.addObject("msg", "김옥지");
		
		return mav;
		
	}
	@RequestMapping("buylist.mib")
	public ModelAndView buylist(){
		
		ModelAndView mav = new ModelAndView("mypage/usermypage/Buylist");
		mav.addObject("msg", "김옥지");
		
		return mav;
		
	}
	@RequestMapping("basketlist.mib")
	public ModelAndView basketlist(){
		
		ModelAndView mav = new ModelAndView("mypage/usermypage/Basketlist");
		mav.addObject("msg", "김옥지");
		
		return mav;
		
	}
	@RequestMapping("todayGoods.mib")
	public ModelAndView todayGoods(){
		
		ModelAndView mav = new ModelAndView("mypage/usermypage/TodayGoods");
		mav.addObject("msg", "김옥지");
		
		return mav;
		
	}
	@RequestMapping("myboard.mib")
	public ModelAndView myboard(){
		
		ModelAndView mav = new ModelAndView("mypage/usermypage/Myboard");
		mav.addObject("msg", "김옥지");
		
		return mav;
		
	}
	@RequestMapping("coupon_Mileage.mib")
	public ModelAndView coupon_Mileage(){
		
		ModelAndView mav = new ModelAndView("mypage/usermypage/Coupon_Mileage");
		mav.addObject("msg", "김옥지");
		
		return mav;
		
	}
	
	
}
