package com.eagle.men_in_black.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.eagle.men_in_black.model.MainDto;
import com.eagle.men_in_black.model.UserMypageDto;
import com.eagle.men_in_black.service.UserMypageSvc;

@Controller
public class UserMypageController {
	Logger loger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private UserMypageSvc userMypageSvc;
	
	// 마이페이지 메인
		@RequestMapping("mymain.mib")
		public ModelAndView mymain(HttpServletRequest res, HttpServletResponse rep){
			
			MainDto userdto = (MainDto)res.getSession().getAttribute("LoginInfo");
			UserMypageDto mypageDto = userMypageSvc.do_search_point(userdto.getUSER_ID());
			List<UserMypageDto> coupon = userMypageSvc.do_search_coupon(userdto.getUSER_ID());
			List<UserMypageDto> buy = userMypageSvc.do_search_buy(userdto.getUSER_ID());
			List<UserMypageDto> qna = userMypageSvc.do_search_qna(userdto.getUSER_ID());
			List<UserMypageDto> basket = userMypageSvc.do_search_basket(userdto.getUSER_ID());
			List<UserMypageDto> point5 = userMypageSvc.do_search_point5(userdto.getUSER_ID());
			ModelAndView mav = new ModelAndView("mypage/usermypage/MypageMain");
			mav.addObject("point",mypageDto);
			mav.addObject("coupon",coupon);
			mav.addObject("buy",buy);
			mav.addObject("qna",qna);
			mav.addObject("basket",basket);
			mav.addObject("point5",point5);
			return mav;
			
		}
	// 회원정보수정 
	@RequestMapping("userup.mib")
	public ModelAndView userupdate(){
		ModelAndView mav = new ModelAndView("mypage/usermypage/Userupdate");
		mav.addObject("msg", "김옥지");
		
		return mav;
		
	}
	// 구매목록 
	@RequestMapping("buylist.mib")
	public ModelAndView buylist(HttpServletRequest res, HttpServletResponse rep){
		MainDto userdto = (MainDto)res.getSession().getAttribute("LoginInfo");
		
		String PAGE_NUM = (res.getParameter("PAGE_NUM")==null || res.getParameter("PAGE_NUM")=="")?"1":res.getParameter("PAGE_NUM");
		String PAGE_SIZE = (res.getParameter("PAGE_SIZE")==null || res.getParameter("PAGE_SIZE")=="")?"10":res.getParameter("PAGE_SIZE");
		String START_DATE = (res.getParameter("START_DATE")==null || res.getParameter("START_DATE")=="")?"SYSDATE":res.getParameter("START_DATE");
		String END_DATE = (res.getParameter("END_DATE")==null || res.getParameter("END_DATE")=="")?"SYSDATE":res.getParameter("END_DATE");
		
		HashMap<String, String> map = new HashMap<>();
		map.put("PAGE_SIZE", PAGE_SIZE);
		map.put("PAGE_NUM", PAGE_NUM);
		map.put("START_DATE",START_DATE);
		map.put("END_DATE",END_DATE);
		map.put("id", userdto.getUSER_ID());
		
		List<UserMypageDto> buyList = userMypageSvc.do_search_buylist(map);
		
		
		ModelAndView mav = new ModelAndView("mypage/usermypage/Buylist");
		mav.addObject("buyList",buyList);
		return mav;
		
	}
	// 장바구니 
	@RequestMapping("basketlist.mib")
	public ModelAndView basketlist(HttpServletRequest res, HttpServletResponse rep){

		MainDto userdto = (MainDto)res.getSession().getAttribute("LoginInfo");
		List<UserMypageDto> basketlist = userMypageSvc.do_search_basketlist(userdto.getUSER_ID());
		ModelAndView mav = new ModelAndView("mypage/usermypage/Basketlist");
		mav.addObject("basketlist",basketlist);
		return mav;
		
	}
	// 장바구니 삭제
	@RequestMapping("basketdelete.mib")
	public ModelAndView basketdelete(HttpServletRequest res,HttpServletResponse rep){

		
		String BAS_SEQ = res.getParameter("BAS_SEQ");
		
		String str[] = BAS_SEQ.split(",");
		List<Integer> list= new ArrayList<>();
		for(int i=0; i<str.length; i++){
			list.add(Integer.parseInt(str[i]));
		}
		
		userMypageSvc.do_delete_basketlist(list);
		
		MainDto userdto = (MainDto)res.getSession().getAttribute("LoginInfo");
		List<UserMypageDto> basketlist = userMypageSvc.do_search_basketlist(userdto.getUSER_ID());
		ModelAndView mav = new ModelAndView("mypage/usermypage/Basketlist");
		mav.addObject("basketlist",basketlist);
		return mav;

	}

	// 오늘본 상품 
	@RequestMapping("todayGoods.mib")
	public ModelAndView todayGoods(HttpServletRequest res,HttpServletResponse rep){

		String pro_seq = res.getParameter("pro_seq");
		if(pro_seq.equals("nocookie")) {
			List<UserMypageDto> goods = null;
			ModelAndView mav = new ModelAndView("mypage/usermypage/TodayGoods");
			mav.addObject("goodslist", goods);

			return mav;
		}else {
			loger.debug("=Controller ===========================");
			loger.debug("codeMSvc === " + pro_seq + "받기완");
			loger.debug("============================");
			HashMap<String, Object> param = new HashMap<String, Object>();
			List<String> list = Arrays.asList(pro_seq.split(","));
			param.put("list1", list);
			param.put("list2", list);

			loger.debug("=Controller ===========================");
			loger.debug("codeMSvc === " + "주기");
			loger.debug("============================");

			List<UserMypageDto> goods = userMypageSvc.do_search_goods(param);
			loger.debug("=Controller ===========================");
			loger.debug("codeMSvc === " + "서치완료");
			loger.debug("============================");


			ModelAndView mav = new ModelAndView("mypage/usermypage/TodayGoods");
			mav.addObject("goodslist", goods);

			return mav;
		}
	}
	// 내가쓴 게시물 보기 
	@RequestMapping("myboard.mib")
	public ModelAndView myboard(HttpServletRequest res, HttpServletResponse rep){
		
		MainDto userdto = (MainDto)res.getSession().getAttribute("LoginInfo");
		
		List<UserMypageDto> qna = userMypageSvc.do_search_myboradqna(userdto.getUSER_ID());
		List<UserMypageDto> review = userMypageSvc.do_search_myboradreview(userdto.getUSER_ID());
		
		ModelAndView mav = new ModelAndView("mypage/usermypage/Myboard");
		
		mav.addObject("qna",qna);
		mav.addObject("review",review);
		return mav;
		
	}
		
	
	
	// 내가쓴 게시물 보기  Q&A
	@RequestMapping("myboardqna.mib")
	public ModelAndView myboardqna(HttpServletRequest res, HttpServletResponse rep){
		MainDto userdto = (MainDto)res.getSession().getAttribute("LoginInfo");
		String PAGE_NUM = (res.getParameter("PAGE_NUM")==null || res.getParameter("PAGE_NUM")=="")?"1":res.getParameter("PAGE_NUM");
		String PAGE_SIZE = (res.getParameter("PAGE_SIZE")==null || res.getParameter("PAGE_SIZE")=="")?"10":res.getParameter("PAGE_SIZE");
		
		
		HashMap<String, String> map = new HashMap<>();
		map.put("PAGE_SIZE", PAGE_SIZE);
		map.put("PAGE_NUM", PAGE_NUM);
		map.put("id", userdto.getUSER_ID());
		

		List<UserMypageDto> qnaList = userMypageSvc.do_search_qnalist(map);
		
		ModelAndView mav = new ModelAndView("mypage/usermypage/Myboard_Q&A");
		mav.addObject("qnaList",qnaList);
		return mav;
		
	}
	
	//내가쓴 게시물 보기  리뷰
	@RequestMapping("myboardreview.mib")
	public ModelAndView myboardreview(HttpServletRequest res, HttpServletResponse rep){
		MainDto userdto = (MainDto)res.getSession().getAttribute("LoginInfo");
		String PAGE_NUM = (res.getParameter("PAGE_NUM")==null || res.getParameter("PAGE_NUM")=="")?"1":res.getParameter("PAGE_NUM");
		String PAGE_SIZE = (res.getParameter("PAGE_SIZE")==null || res.getParameter("PAGE_SIZE")=="")?"10":res.getParameter("PAGE_SIZE");
		
		
		HashMap<String, String> map = new HashMap<>();
		map.put("PAGE_SIZE", PAGE_SIZE);
		map.put("PAGE_NUM", PAGE_NUM);
		map.put("id", userdto.getUSER_ID());
		
		List<UserMypageDto> reviewlist = userMypageSvc.do_search_reviewlist(map);
		
		ModelAndView mav = new ModelAndView("mypage/usermypage/Myboard_Review");
		mav.addObject("reviewlist",reviewlist);
		return mav;
		
	}
	
	
	// 쿠폰 그리고 적립금 
	@RequestMapping("coupon_Mileage.mib")
	public ModelAndView coupon_Mileage(HttpServletRequest res, HttpServletResponse rep){
		MainDto userdto = (MainDto)res.getSession().getAttribute("LoginInfo");
		UserMypageDto mypageDto = userMypageSvc.do_search_point(userdto.getUSER_ID());
		String PAGE_NUM = (res.getParameter("PAGE_NUM")==null || res.getParameter("PAGE_NUM")=="")?"1":res.getParameter("PAGE_NUM");
		String PAGE_SIZE = (res.getParameter("PAGE_SIZE")==null || res.getParameter("PAGE_SIZE")=="")?"10":res.getParameter("PAGE_SIZE");
		
		String PAGE_NUMC = (res.getParameter("PAGE_NUMC")==null || res.getParameter("PAGE_NUMC")=="")?"1":res.getParameter("PAGE_NUMC");
		String PAGE_SIZEC = (res.getParameter("PAGE_SIZEC")==null || res.getParameter("PAGE_SIZEC")=="")?"10":res.getParameter("PAGE_SIZEC");
		
		HashMap<String, String> map = new HashMap<>();
		map.put("PAGE_SIZE", PAGE_SIZE);
		map.put("PAGE_NUM", PAGE_NUM);
		map.put("id", userdto.getUSER_ID());
		
		HashMap<String, String> mapc = new HashMap<>();
		mapc.put("PAGE_SIZEC", PAGE_SIZEC);
		mapc.put("PAGE_NUMC", PAGE_NUMC);
		mapc.put("id", userdto.getUSER_ID());
		
		
		List<UserMypageDto> couponList = userMypageSvc.do_search_couponlist(mapc);
		List<UserMypageDto> pointList = userMypageSvc.do_search_pointlist(map);
		ModelAndView mav = new ModelAndView("mypage/usermypage/Coupon_Mileage");
		mav.addObject("point",mypageDto);
		mav.addObject("couponList",couponList);
		mav.addObject("pointList",pointList);
		return mav;
		
	}
	
	
	// 리뷰 쓰기
	@RequestMapping("reveiwwrite.mib")
	public ModelAndView coupon_Administer(HttpServletRequest res, HttpServletResponse rep){
		MainDto userdto = (MainDto)res.getSession().getAttribute("LoginInfo");
		ModelAndView mav = new ModelAndView("mypage/usermypage/ReviewWrite");
		mav.addObject("userdto",userdto);
		return mav;

	}
	
}