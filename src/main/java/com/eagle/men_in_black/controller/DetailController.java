package com.eagle.men_in_black.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DetailController {
	Logger loger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping("detail.mib")
	public ModelAndView detail() {

		loger.debug("=Controller ===========================");
		loger.debug("codeMSvc === " + "앙 기무띠~");
		loger.debug("============================");

		ModelAndView mav = new ModelAndView("category/tiles/detail/Detail");
		mav.addObject("msg", "김옥지");

		return mav;
	}
	
	@RequestMapping("review.mib")
	public ModelAndView review() {

		loger.debug("=Controller ===========================");
		loger.debug("codeMSvc === " + "앙 기무띠~");
		loger.debug("============================");

		ModelAndView mav = new ModelAndView("category/tiles/detail/pop/Review");
		mav.addObject("msg", "김옥지");

		return mav;
	}
	
	@RequestMapping("reviewReply.mib")
	public ModelAndView reviewReply() {

		loger.debug("=Controller ===========================");
		loger.debug("codeMSvc === " + "앙 기무띠~");
		loger.debug("============================");

		ModelAndView mav = new ModelAndView("category/tiles/detail/pop/ReviewReply");
		mav.addObject("msg", "김옥지");

		return mav;
	}
	
	@RequestMapping("QnADetail.mib")
	public ModelAndView QnADetail() {

		loger.debug("=Controller ===========================");
		loger.debug("codeMSvc === " + "앙 기무띠~");
		loger.debug("============================");

		ModelAndView mav = new ModelAndView("category/tiles/detail/pop/Q&ADetail");
		mav.addObject("msg", "김옥지");

		return mav;
	}
}
