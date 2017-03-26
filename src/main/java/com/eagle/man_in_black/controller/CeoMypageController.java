package com.eagle.man_in_black.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CeoMypageController {
	Logger loger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping("dudwo.mib")
	public ModelAndView code_msg1111(){
		
		loger.debug("=Controller ===========================");
		loger.debug("codeMSvc === " + "김옥지");
		loger.debug("============================");
		
		ModelAndView mav = new ModelAndView("mypage/ceomypage/NewFile");
		mav.addObject("msg", "김옥지");
		
		return mav;
		
	}
	
	@RequestMapping("register_Good.mib")
	public ModelAndView register_Good(){
		
		loger.debug("=Controller ===========================");
		loger.debug("codeMSvc === " + "김옥지");
		loger.debug("============================");
		
		ModelAndView mav = new ModelAndView("mypage/ceomypage/Register_Good");
		mav.addObject("msg", "김옥지");
		
		return mav;
		
	}
	
	/*이미지업로드*/
	@RequestMapping("ckeditorImageUpload.mib")
	public void ckeditorImageUpload(HttpServletRequest request, HttpServletResponse response,@RequestParam MultipartFile upload) throws Exception {
			OutputStream out = null;
	        PrintWriter printWriter = null;
	        response.setCharacterEncoding("utf-8");
	        response.setContentType("text/html;charset=utf-8");
	 
	        try{
	 
	            String fileName = upload.getOriginalFilename();
	            byte[] bytes = upload.getBytes();
	            String uploadPath = "C:/filework/" + fileName;//저장경로
	 
	            out = new FileOutputStream(new File(uploadPath));
	            out.write(bytes);
	            String callback = request.getParameter("CKEditorFuncNum");
	 
	            printWriter = response.getWriter();
	            String fileUrl = uploadPath;//url경로
	 
	            printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
	                    + callback
	                    + ",'"
	                    + fileUrl
	                    + "','이미지를 업로드 하였습니다.'"
	                    + ")</script>");
	            printWriter.flush();
	 
	        }catch(IOException e){
	            e.printStackTrace();
	        } finally {
	            try {
	                if (out != null) {
	                    out.close();
	                }
	                if (printWriter != null) {
	                    printWriter.close();
	                }
	            } catch (IOException e) {
	                e.printStackTrace();
	            }
	        }
	 
	        return;




	}

}
