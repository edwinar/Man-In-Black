package com.eagle.men_in_black.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.eagle.men_in_black.model.CeoMypageDto;
import com.eagle.men_in_black.model.FileModel;
import com.eagle.men_in_black.service.CeoMypageSvc;

@Controller
public class CeoMypageController {
	Logger loger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private CeoMypageSvc ceoMypageSvc;
	
	// 사장 마이페이지 메인, 판매관리 
	@RequestMapping("ceoMypage_Main.mib")
	public ModelAndView ceoMypage_Main(HttpServletRequest res, HttpServletResponse rep) {

		ModelAndView mav = new ModelAndView("mypage/ceomypage/CeoMypage_Main");
		
		// 날짜설정 부분 
		Calendar cal = Calendar.getInstance();
		int tyear = cal.get(Calendar.YEAR);
		int tmonth = cal.get(Calendar.MONTH)+1;
		int tday = cal.get(Calendar.DATE);
		String todaydate = "";

		if(tmonth<10){
		   if(tday<10){
		      todaydate = tyear+"0"+tmonth+"0"+tday;
		   }else{
		      todaydate = tyear+"0"+tmonth+tday;
		   }
		}else{
		   if(tday<10){
		      todaydate = tyear+tmonth+"0"+tday;
		   }else{
		      todaydate = tyear+tmonth+tday+"";
		   }
		}
		
		System.out.println("ㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁ======================"+todaydate.substring(2, 8));
		
		String PAGE_NUM = (res.getParameter("PAGE_NUM")==null || res.getParameter("PAGE_NUM")=="")?"1":res.getParameter("PAGE_NUM");
		String PAGE_SIZE = (res.getParameter("PAGE_SIZE")==null || res.getParameter("PAGE_SIZE")=="")?"10":res.getParameter("PAGE_SIZE");
		String STRAT_DATE = (res.getParameter("STRAT_DATE")==null || res.getParameter("STRAT_DATE")=="")?"SYSDATE":res.getParameter("STRAT_DATE");
		String END_DATE = (res.getParameter("END_DATE")==null || res.getParameter("END_DATE")=="")?"SYSDATE":res.getParameter("END_DATE");
				
		System.out.println("페이지넘" +PAGE_NUM);
		HashMap<String, String> map = new HashMap<>();
		map.put("PAGE_SIZE", PAGE_SIZE);
		map.put("PAGE_NUM", PAGE_NUM);
		map.put("STRAT_DATE",STRAT_DATE);
		map.put("END_DATE",END_DATE);
		
		
		List<CeoMypageDto> list = ceoMypageSvc.do_ceomypage_main(map);
		mav.addObject("list", list);
		
		return mav;

	}
	
	@RequestMapping("coupon_Administer.mib")
	public ModelAndView coupon_Administer() {

		ModelAndView mav = new ModelAndView("mypage/ceomypage/Coupon_Administer");
		
		return mav;

	}

	@RequestMapping("qnA_Administer.mib")
	public ModelAndView qnA_Administer() {

		ModelAndView mav = new ModelAndView("mypage/ceomypage/QnA_Administer");
		
		return mav;

	}
	

	
	
	
	
	
	
	
	@RequestMapping("register_Good.mib")
	public ModelAndView register_Good() {

		loger.debug("=Controller ===========================");
		loger.debug("codeMSvc === " + "김옥지");
		loger.debug("============================");

		ModelAndView mav = new ModelAndView("mypage/ceomypage/Register_Good");
		mav.addObject("msg", "김옥지");

		return mav;

	}

	/* 이미지업로드 */
	@RequestMapping(value="ckeditorImageUpload.mib",  method = RequestMethod.POST)
	public ModelAndView procFileUpload(FileModel fileBean,HttpServletRequest request, Model model) { 
		HttpSession session = request.getSession(); 
		
		String root_path = session.getServletContext().getRealPath("/"); // 웹서비스 root 경로
		System.err.println("===>root_path" + root_path);
		
		String attach_path = "images\\"; 
		
		System.err.println("===>attach_path" + attach_path);
		MultipartFile upload = fileBean.getUpload();
		String filename = ""; 
		String CKEditorFuncNum = "";
		
		if (upload != null) { filename = upload.getOriginalFilename(); 
							fileBean.setFilename(filename); 
							CKEditorFuncNum = fileBean.getCKEditorFuncNum(); 
		try { File file = new File(root_path + attach_path + filename);
		loger.info(root_path + attach_path + filename); upload.transferTo(file); 
		} catch (IOException e) { 
			e.printStackTrace(); } 
		} 
		String file_path = "../" + "images/" + filename; 
				
		ModelAndView mov = new ModelAndView("/mypage/ceomypage/NewFile");
		mov.addObject("file_path", file_path);
		mov.addObject("CKEditorFuncNum", CKEditorFuncNum);
		
		return mov;
		}
	}



