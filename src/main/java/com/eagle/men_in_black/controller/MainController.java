package com.eagle.men_in_black.controller;

import java.io.FileNotFoundException;
import java.net.URISyntaxException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.eagle.men_in_black.model.MainDto;
import com.eagle.men_in_black.service.MainSvc;

@Controller
public class MainController {
	Logger loger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private MainSvc mainSvc;
	
	// 메인 화면 
	@RequestMapping("meninblack.mib")
	public ModelAndView meninblack(){
				
		ModelAndView mav = new ModelAndView("main/Main");
		return mav;
		
	}
	
	// 로그인 모달 팝업 
	@RequestMapping("login.mib")
	public ModelAndView login(){
			
		ModelAndView mav = new ModelAndView("main/empty/modal/modladla/SignIn");
		mav.addObject("msg", "김옥지");
		
		return mav;
		
	}
	// 로그인입력후 전송 
	@RequestMapping("loginCheck.mib")
	public ModelAndView loginCheck(HttpServletRequest res, HttpServletResponse rep){
		
		String id = res.getParameter("id");
		System.out.println("아이디 ================ " + id);
		String pwd = res.getParameter("pwd");
		System.out.println("비밀번호 ================ " + pwd);
		
		MainDto dto =  mainSvc.do_search_pw(id);
		ModelAndView mav = new ModelAndView("main/Main");
		
		if(dto!=null){
			if(pwd.equals(dto.getUSER_PW())){
				// 로그인 됬을 때 
				res.getSession().setAttribute("LoginInfo", dto);
				mav.addObject("LoginInfo", "success");
			}else{
				// 비밀번호 틀렸을 때 
				mav.addObject("LoginInfo", "NotPwd");
			}
		}else{
			// 로그인 안됬을 때 
			mav.addObject("LoginInfo", "NoMember");
		}
		
		return mav;		
	}
	
	// 로그아웃 
		@RequestMapping("logout.mib")
		public ModelAndView logout(HttpServletRequest res, HttpServletResponse rep){
									
			ModelAndView mav = new ModelAndView("main/Main");
			
					res.getSession().removeAttribute("LoginInfo");
					mav.addObject("LoginInfo", "logout");
			
			return mav;		
		}
	//회원가입 팝업창 
	@RequestMapping("signup.mib")
	public ModelAndView signup(){
		
		ModelAndView mav = new ModelAndView("main/empty/modal/modladla/SignUp");
		mav.addObject("msg", "김옥지");
		
		return mav;
		
	}
	// 회원가입 페이지
	@RequestMapping("mib_SignUp.mib")
	public ModelAndView mib_SignUp(HttpServletRequest res, HttpServletResponse rep){
		
		ModelAndView mav = new ModelAndView("main/MIB_SignUp");
				
		String success = (res.getParameter("success")==null || res.getParameter("success")=="")?"fail":res.getParameter("success");
		String sign_email = (res.getParameter("sign_email")==null || res.getParameter("sign_email")=="")?"":res.getParameter("sign_email");
		String password = (res.getParameter("password")==null || res.getParameter("password")=="")?"":res.getParameter("password");
		String name = (res.getParameter("name")==null || res.getParameter("name")=="")?"":res.getParameter("name");
		String tel = (res.getParameter("tel")==null || res.getParameter("tel")=="")?"":res.getParameter("tel");
		String postcode = (res.getParameter("postcode")==null || res.getParameter("postcode")=="")?"":res.getParameter("postcode");
		String roadAddress = (res.getParameter("roadAddress")==null || res.getParameter("roadAddress")=="")?"":res.getParameter("roadAddress");
		String jibunAddress = (res.getParameter("jibunAddress")==null || res.getParameter("jibunAddress")=="")?"":res.getParameter("jibunAddress");
		String sex = (res.getParameter("sex")==null || res.getParameter("sex")=="")?"":res.getParameter("sex");
		String birth = (res.getParameter("birth")==null || res.getParameter("birth")=="")?"":res.getParameter("birth");
		
		HashMap<String, String> map = new HashMap<>();
		map.put("success", success);
		map.put("sign_email", sign_email);
		map.put("password", password);
		map.put("name", name);
		map.put("tel", tel);
		map.put("postcode", postcode);
		map.put("roadAddress", roadAddress);
		map.put("jibunAddress", jibunAddress);
		map.put("sex", sex);
		map.put("birth", birth);
		
		mav.addObject("success", success);
		mav.addObject("sign_email", sign_email);
		 
		
		return mav;
		
	}
	//이메일 인증
	
	 @RequestMapping("mail.mib")
	 public ModelAndView send(HttpServletRequest res, HttpServletResponse rep){
	     
		 String email = res.getParameter("sign_email");
		 System.out.println(email);
		 
		 String authNum = RandomNum();
		 
		 //mainSvc.sendEmail("vovo118@naver.com", authNum);
		 System.out.println("모달컨트롤러"+email);
		 ModelAndView mav = new ModelAndView("main/empty/modal/modladla/EmailCheck");
		 mav.addObject("randomNum", authNum);
		 mav.addObject("sign_email",email);
		 
	     return mav;
	        
	        
	    }
	 
	//랜덤번호 인증 번호 
	 public String RandomNum(){
		 StringBuffer buffer = new StringBuffer();
		 for(int i=0;i<=6; i++){
			 int n = (int)(Math.random()*10);
			 buffer.append(n);
		 }
		 return buffer.toString();
	 }


}
	
