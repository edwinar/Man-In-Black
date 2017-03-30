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

import com.eagle.men_in_black.model.CategoryDto;
import com.eagle.men_in_black.repository.CategoryDao;
import com.eagle.men_in_black.service.CategorySvc;
import com.eagle.men_in_black.service.MainSvc;

@Controller
public class CategoryController {
	Logger loger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private CategorySvc categorySvc;
	
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
	public ModelAndView outerCategory(HttpServletRequest res, HttpServletResponse rep) {
		ModelAndView mav = new ModelAndView("category/CategoryOuter");
		
		String ITEM = (res.getParameter("ITEM")==null||res.getParameter("ITEM").equals("") )?"OUTER":res.getParameter("ITEM");
		String ORDER = (res.getParameter("ORDER")==null||res.getParameter("ORDER").equals("") )?"C.PRO_SEQ DESC":res.getParameter("ORDER");
		String PAGE_NUM = (res.getParameter("PAGE_NUM")==null||res.getParameter("PAGE_NUM").equals("") )?"1":res.getParameter("PAGE_NUM");
		String PAGE_SIZE = (res.getParameter("PAGE_SIZE")==null||res.getParameter("PAGE_SIZE").equals("") )?"10":res.getParameter("PAGE_SIZE");
		String SUB_ITEM = (res.getParameter("SUB_ITEM")==null||res.getParameter("SUB_ITEM").equals("") )?"ALL":res.getParameter("SUB_ITEM");
		
		System.out.println("서브아이템"+SUB_ITEM);
		
		// 메소드 실행시 필요한 키값들의 해시맵
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("ITEM", ITEM);
		map.put("ORDER", ORDER);
		map.put("PAGE_NUM", PAGE_NUM);
		map.put("PAGE_SIZE", PAGE_SIZE);
		map.put("SUB_ITEM", SUB_ITEM);
		
		List<CategoryDto> list = categorySvc.do_selectCategoryProductList(map);
		mav.addObject("list", list);
		/*for(int i=0; i<list.size(); i++){
			System.out.println(list.get(i).getPRO_NAME());
			System.out.println(list.get(i).getPRO_PRICE());
			System.out.println(list.get(i).getPRO_SEQ());
		}*/
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
