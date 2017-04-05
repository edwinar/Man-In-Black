package com.eagle.men_in_black.controller;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.eagle.men_in_black.model.DetailDto;
import com.eagle.men_in_black.model.MainDto;
import com.eagle.men_in_black.model.UserMypageDto;
import com.eagle.men_in_black.service.DetailSvc;
import com.eagle.men_in_black.service.UserMypageSvc;
import com.google.gson.Gson;

@Controller
public class DetailController {
	Logger loger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private DetailSvc detailSvc;
	
	@RequestMapping("detail.mib")
	public ModelAndView detail(HttpServletRequest res,HttpServletResponse rep){
		ModelAndView mav = new ModelAndView("category/tiles/detail/Detail");

		int PRO_SEQ = Integer.parseInt(res.getParameter("PRO_SEQ"));

		List<DetailDto> list = detailSvc.do_selectProductDetail(PRO_SEQ);
		List<DetailDto> listColor = detailSvc.do_selectProductColor(PRO_SEQ);
		List<DetailDto> listSize = detailSvc.do_selectProductSize(PRO_SEQ);
		mav.addObject("list", list);
		mav.addObject("listColor", listColor);
		mav.addObject("listSize", listSize);
		
		return mav;
	}

	@RequestMapping("review.mib")
	public ModelAndView review(HttpServletRequest res, HttpServletResponse rep) {
		ModelAndView mav = new ModelAndView("category/tiles/detail/pop/Review");
		
		int REV_SEQ = Integer.parseInt(res.getParameter("REV_SEQ"));
		
		DetailDto detaildto = detailSvc.do_selectReviewDetail(REV_SEQ);
		mav.addObject("detaildto", detaildto);

		return mav;
	}
	
	@RequestMapping("reviewReply.mib")
	public ModelAndView reviewReply(HttpServletRequest res, HttpServletResponse rep) {
		ModelAndView mav = new ModelAndView("category/tiles/detail/pop/ReviewReply");
		
		int REV_SEQ = Integer.parseInt(res.getParameter("REV_SEQ"));
		
		DetailDto detaildto = detailSvc.do_selectReviewDetail(REV_SEQ);
		mav.addObject("detailDto", detaildto);

		return mav;
	}
	
	@RequestMapping("QnADetail.mib")
	public ModelAndView QnADetail(HttpServletRequest res, HttpServletResponse rep) {
		ModelAndView mav = new ModelAndView("category/tiles/detail/pop/Q&ADetail");
		
		int QNA_SEQ = Integer.parseInt(res.getParameter("QNA_SEQ"));
		
		//DetailDto detailDto = detailSvc.do_selectQnADetail(QNA_SEQ);
		//mav.addObject("detailDto", detailDto);

		return mav;
	}
	
	@RequestMapping("QnAWrite.mib")
	public ModelAndView QnAWrite() {

		loger.debug("=Controller ===========================");
		loger.debug("codeMSvc === " + "앙 기무띠~");
		loger.debug("============================");

		ModelAndView mav = new ModelAndView("category/tiles/detail/pop/Q&AWrite");
		mav.addObject("msg", "김옥지");

		return mav;
	}
	
	@RequestMapping("BuyPop.mib")
	public ModelAndView BuyPop(HttpServletRequest res, HttpServletResponse rep) {
		ModelAndView mav = new ModelAndView("category/tiles/detail/pop/BuyPop");
		
		int PRO_SEQ = Integer.parseInt((res.getParameter("PRO_SEQ")==null || res.getParameter("PRO_SEQ")=="")?"":res.getParameter("PRO_SEQ"));
		
		List<DetailDto> list = detailSvc.do_buyProductPop(PRO_SEQ);
		List<DetailDto> listColor = detailSvc.do_buyProductColorPop(PRO_SEQ);
		mav.addObject("PRO_SEQ", PRO_SEQ);
		mav.addObject("list", list);
		mav.addObject("listColor", listColor);
		
		return mav;
	}
	
	// 구매팝업 칼라로 인한 사이즈 셀렉트 리스트
	@RequestMapping(value="selectSize.mib", method=RequestMethod.POST,produces = "application/json; charset=utf8")
	public @ResponseBody String selectSize(HttpServletRequest res, HttpServletResponse rep){
		
		int PRO_SEQ = Integer.parseInt((res.getParameter("PRO_SEQ")==null||res.getParameter("PRO_SEQ")=="")?"":res.getParameter("PRO_SEQ"));
		String COLOR = (res.getParameter("COLOR")==null || res.getParameter("COLOR")=="")?"":res.getParameter("COLOR");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("PRO_SEQ",PRO_SEQ);
		map.put("COLOR",COLOR);
		
		List<DetailDto> list = detailSvc.do_buyProductSizePop(map);
		
		Gson gson = new Gson();
		return gson.toJson(list);
	}
	
	// 구매팝업 칼라로 인한 사이즈 셀렉트 리스트
	@RequestMapping(value="stockLimit.mib", method=RequestMethod.POST,produces = "application/json; charset=utf8")
	public @ResponseBody String stockLimit(HttpServletRequest res, HttpServletResponse rep){
		
		int PRO_SEQ = Integer.parseInt((res.getParameter("PRO_SEQ")==null||res.getParameter("PRO_SEQ")=="")?"":res.getParameter("PRO_SEQ"));
		String COLOR = (res.getParameter("COLOR")==null || res.getParameter("COLOR")=="")?"":res.getParameter("COLOR");
		String PRO_SIZE = (res.getParameter("PRO_SIZE")==null || res.getParameter("PRO_SIZE")=="")?"":res.getParameter("PRO_SIZE");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("PRO_SEQ",PRO_SEQ);
		map.put("COLOR",COLOR);
		map.put("PRO_SIZE",PRO_SIZE);
		
		String result = detailSvc.do_buyProductStockPop(map);
		
		Gson gson = new Gson();
		return gson.toJson(result);
	}
	
	//장바구니 등록 아작스
	@RequestMapping(value="BuyPopAjax.mib", method=RequestMethod.POST,produces = "application/json; charset=utf8")
	public @ResponseBody String AddBasket(HttpServletRequest res) throws Exception{
		MainDto userdto = (MainDto)res.getSession().getAttribute("LoginInfo");
		// form에서 넘어온 input
		int PRO_SEQ = Integer.parseInt((res.getParameter("PRO_SEQ")==null || res.getParameter("PRO_SEQ")=="")?"":res.getParameter("PRO_SEQ"));
		String PRO_SIZE = (res.getParameter("PRO_SIZE")==null || res.getParameter("PRO_SIZE")=="")?"":res.getParameter("PRO_SIZE");
		String COLOR = (res.getParameter("COLOR")==null || res.getParameter("COLOR")=="")?"":res.getParameter("COLOR");
		int BAS_PRO_NUM = Integer.parseInt((res.getParameter("BAS_PRO_NUM")==null || res.getParameter("BAS_PRO_NUM")=="")?"":res.getParameter("BAS_PRO_NUM"));

		// 이걸로먼저 review table에 인설트
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("PRO_SEQ", PRO_SEQ);
		map.put("USER_ID", userdto.getUSER_ID());
		map.put("PRO_SIZE", PRO_SIZE);
		map.put("COLOR", COLOR);
		map.put("BAS_PRO_NUM", BAS_PRO_NUM);
		
		int result = detailSvc.do_addBasket(map);
		
		Gson gson = new Gson();
		
		return gson.toJson(result);
	}
	
	//관리자 리뷰 답글 아작스
	@RequestMapping(value="ReviewReplyAjax.mib", method=RequestMethod.POST,produces = "application/json; charset=utf8")
	public @ResponseBody String ReviewReplyAjax(HttpServletRequest res) throws Exception{
		MainDto userdto = (MainDto)res.getSession().getAttribute("LoginInfo");
		// form에서 넘어온 input
		int PRO_SEQ = Integer.parseInt((res.getParameter("PRO_SEQ")==null || res.getParameter("PRO_SEQ")=="")?"":res.getParameter("PRO_SEQ"));
		String REV_TITLE = (res.getParameter("REV_TITLE")==null || res.getParameter("REV_TITLE")=="")?"":res.getParameter("REV_TITLE");
		String REV_CONTENT = (res.getParameter("REV_CONTENT")==null || res.getParameter("REV_CONTENT")=="")?"":res.getParameter("REV_CONTENT");
		int REV_REF = Integer.parseInt((res.getParameter("REV_REF")==null || res.getParameter("REV_REF")=="")?"":res.getParameter("REV_REF"));
		
		// 이걸로먼저 review table에 인설트
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("PRO_SEQ", PRO_SEQ);
		map.put("USER_ID", userdto.getUSER_ID());
		map.put("REV_TITLE", REV_TITLE);
		map.put("REV_CONTENT", REV_CONTENT);
		map.put("REV_REF", REV_REF);
		
		int result = detailSvc.do_insertReviewAdmReply(map);
		
		Gson gson = new Gson();
		
		return gson.toJson(result);
	}
	
	//리뷰리스트아작스
	@RequestMapping(value="ReviewListAjax.mib", method=RequestMethod.POST,produces = "application/json; charset=utf8")
	public @ResponseBody String ReviewListAjax(HttpServletRequest res) throws Exception{
		// form에서 넘어온 input
		int PRO_SEQ = Integer.parseInt((res.getParameter("PRO_SEQ")==null || res.getParameter("PRO_SEQ")=="")?"":res.getParameter("PRO_SEQ"));
		String PAGE_NUM = (res.getParameter("PAGE_NUM")==null||res.getParameter("PAGE_NUM").equals("") )?"1":res.getParameter("PAGE_NUM");
		String PAGE_SIZE = (res.getParameter("PAGE_SIZE")==null||res.getParameter("PAGE_SIZE").equals("") )?"9":res.getParameter("PAGE_SIZE");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("PRO_SEQ", PRO_SEQ);
		map.put("PAGE_NUM", PAGE_NUM);
		map.put("PAGE_SIZE", PAGE_SIZE);
		
		List<DetailDto> reviewList = detailSvc.do_selectProductReviewList(map);
		
		Gson gson = new Gson();
		
		return gson.toJson(reviewList);
	}
	
	//리뷰리스트아작스
	@RequestMapping(value="QnAListAjax.mib", method=RequestMethod.POST,produces = "application/json; charset=utf8")
	public @ResponseBody String QnAListAjax(HttpServletRequest res) throws Exception{
		// form에서 넘어온 input
		int PRO_SEQ = Integer.parseInt((res.getParameter("PRO_SEQ")==null || res.getParameter("PRO_SEQ")=="")?"":res.getParameter("PRO_SEQ"));
		String PAGE_NUM = (res.getParameter("PAGE_NUM")==null||res.getParameter("PAGE_NUM").equals("") )?"1":res.getParameter("PAGE_NUM");
		String PAGE_SIZE = (res.getParameter("PAGE_SIZE")==null||res.getParameter("PAGE_SIZE").equals("") )?"9":res.getParameter("PAGE_SIZE");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("PRO_SEQ", PRO_SEQ);
		map.put("PAGE_NUM", PAGE_NUM);
		map.put("PAGE_SIZE", PAGE_SIZE);
		
		List<DetailDto> QnAList = detailSvc.do_selectProductQnAList(map);
		
		Gson gson = new Gson();
		
		return gson.toJson(QnAList);
	}
	
	@RequestMapping("Detail_Buy_Info.mib")
	public ModelAndView Detail_Buy_Info(HttpServletRequest res, HttpServletResponse rep) {
		ModelAndView mav = new ModelAndView("category/tiles/detail/Detail_Buy_Info");
		
		MainDto userdto = (MainDto)res.getSession().getAttribute("LoginInfo");
		
		String BAS_SEQ = (String)res.getParameter("BAS_SEQ");
		String str[] = BAS_SEQ.split(",");
		List<Integer> list= new ArrayList<>();
		for(int i=0; i<str.length; i++){
			list.add(Integer.parseInt(str[i]));
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("USER_ID", userdto.getUSER_ID());
		map.put("list", list);
		
		List<DetailDto> basketList = detailSvc.do_selectFinalBuy(map);
		mav.addObject("basketList", basketList);

		return mav;
	}
}
