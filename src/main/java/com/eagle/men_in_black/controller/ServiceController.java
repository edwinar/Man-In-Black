package com.eagle.men_in_black.controller;

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

import com.eagle.men_in_black.model.ServiceDto;
import com.eagle.men_in_black.service.ServiceSvc;

@Controller
public class ServiceController {
	Logger loger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private ServiceSvc serviceSvc;
	
	// 고객센터 메인(공지사항)
	@RequestMapping("servicenotice.mib")
	public ModelAndView coupon_Administer(HttpServletRequest res, HttpServletResponse rep) {

		ModelAndView mav = new ModelAndView("service/notice");
		
		String PAGE_NUM = (res.getParameter("PAGE_NUM")==null || res.getParameter("PAGE_NUM")=="")?"1":res.getParameter("PAGE_NUM");
		String PAGE_SIZE = (res.getParameter("PAGE_SIZE")==null || res.getParameter("PAGE_SIZE")=="")?"10":res.getParameter("PAGE_SIZE");
		
		HashMap<String, String> map = new HashMap<>();
		map.put("PAGE_SIZE", PAGE_SIZE);
		map.put("PAGE_NUM", PAGE_NUM);
		
		List<ServiceDto> noticelist = serviceSvc.do_service_main(map);
	
		
		mav.addObject("noticelist", noticelist);
		
		
		return mav;

	}
}
