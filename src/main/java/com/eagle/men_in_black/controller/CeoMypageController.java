package com.eagle.men_in_black.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.eagle.men_in_black.model.FileModel;

@Controller
public class CeoMypageController {
	Logger loger = LoggerFactory.getLogger(this.getClass());

	// 사장 마이페이지 메인, 판매관리 
	@RequestMapping("ceoMypage_Main.mib")
	public ModelAndView ceoMypage_Main() {

		ModelAndView mav = new ModelAndView("mypage/ceomypage/CeoMypage_Main");
		
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



