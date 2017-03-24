package com.eagle.man_in_black.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CategoryController {
	Logger loger = LoggerFactory.getLogger(this.getClass());

	// 신상품
	@RequestMapping("NewCategory.mib")
	public ModelAndView newCategory() {

		loger.debug("=Controller ===========================");
		loger.debug("codeMSvc === " + "앙 기무띠~");
		loger.debug("============================");

		ModelAndView mav = new ModelAndView("category/CategoryNew");
		mav.addObject("msg", "김옥지");

		return mav;

	}

	// 아우터
	@RequestMapping("outerCategory.mib")
	public ModelAndView outerCategory() {

		loger.debug("=Controller ===========================");
		loger.debug("codeMSvc === " + "앙 기무띠~");
		loger.debug("============================");

		ModelAndView mav = new ModelAndView("category/CategoryOuter");
		mav.addObject("msg", "김옥지");

		return mav;

	}

	// 상의
	@RequestMapping("topCategory.mib")
	public ModelAndView topCategory() {

		loger.debug("=Controller ===========================");
		loger.debug("codeMSvc === " + "앙 기무띠~");
		loger.debug("============================");

		ModelAndView mav = new ModelAndView("category/CategoryTop");
		mav.addObject("msg", "김옥지");

		return mav;

	}
	// 바지
	@RequestMapping("pantsCategory.mib")
	public ModelAndView pantsCategory() {

		loger.debug("=Controller ===========================");
		loger.debug("codeMSvc === " + "앙 기무띠~");
		loger.debug("============================");

		ModelAndView mav = new ModelAndView("category/CategoryPants");
		mav.addObject("msg", "김옥지");

		return mav;

	}
	// 신발
	@RequestMapping("shoesCategory.mib")
	public ModelAndView shoesCategory() {

		loger.debug("=Controller ===========================");
		loger.debug("codeMSvc === " + "앙 기무띠~");
		loger.debug("============================");

		ModelAndView mav = new ModelAndView("category/CategoryShoes");
		mav.addObject("msg", "김옥지");

		return mav;

	}
	// 가방 악세사리
	@RequestMapping("bnaCategory.mib")
	public ModelAndView bnaCategory() {

		loger.debug("=Controller ===========================");
		loger.debug("codeMSvc === " + "앙 기무띠~");
		loger.debug("============================");

		ModelAndView mav = new ModelAndView("category/CategoryBnA");
		mav.addObject("msg", "김옥지");

		return mav;

	}
}
