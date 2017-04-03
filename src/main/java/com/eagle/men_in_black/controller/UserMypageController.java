package com.eagle.men_in_black.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.eagle.men_in_black.model.FileModel;
import com.eagle.men_in_black.model.MainDto;
import com.eagle.men_in_black.model.UserMypageDto;
import com.eagle.men_in_black.service.UserMypageSvc;
import com.google.gson.Gson;

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
	public ModelAndView userupdate(HttpServletRequest res){
		ModelAndView mav = new ModelAndView("mypage/usermypage/Userupdate");
		String sign_email = (res.getParameter("sign_email")==null || res.getParameter("sign_email")=="")?"":res.getParameter("sign_email");
		String tel           = (res.getParameter("tel")==null || res.getParameter("tel")=="")?"":res.getParameter("tel");
		String postcode      = (res.getParameter("postcode")==null || res.getParameter("postcode")=="")?"":res.getParameter("postcode");
		String password      = (res.getParameter("password")==null || res.getParameter("password")=="")?"":res.getParameter("password");
		String jibunAddress  = (res.getParameter("jibunAddress")==null || res.getParameter("jibunAddress")=="")?"":res.getParameter("jibunAddress");
		String roadAddress   = (res.getParameter("roadAddress")==null || res.getParameter("roadAddress")=="")?"":res.getParameter("roadAddress");
		String detailAddress = (res.getParameter("detailAddress")==null || res.getParameter("detailAddress")=="")?"":res.getParameter("detailAddress");
		String id = (res.getParameter("id")==null || res.getParameter("id")=="")?"":res.getParameter("id");
		
		String fullAddress = jibunAddress+roadAddress+"";
		
		HashMap<String, String> map  = new HashMap<>();
		map.put("EMAIL", sign_email);
		map.put("TEL", tel);
		map.put("POSTCODE", postcode);
		map.put("PW", password);
		map.put("ADDRESS", fullAddress);
		map.put("DETAILADDRESS", detailAddress);
		map.put("USER_ID", id);
	 
		String upda = (res.getParameter("upda")==null || res.getParameter("upda")=="")?"":res.getParameter("upda");
		System.out.println("업다============="+upda);
		mav.addObject("upda", upda);
		mav.addObject("sign_email", sign_email);
		
		if(userMypageSvc.do_member_update(map)==0){
			if(!id.equals(""))mav.addObject("updateResult", "NO");
		}else{
			mav.addObject("updateResult", "OK");
			mav.addObject("upda", "NO");
		}
		
		
		return mav;
		
	}
	
	// 회원정보수정 비밀번호 체크 
	@RequestMapping(value="pwdCheck.mib", method=RequestMethod.POST,produces = "application/json; charset=utf8")
	
	public @ResponseBody String emailCheck(HttpServletRequest res){
		
		String pwd = res.getParameter("pwd");
		MainDto dto = (MainDto)res.getSession().getAttribute("LoginInfo");
		
		HashMap<String, String> map = new HashMap<>();
		
		if(pwd.equals(dto.getUSER_PW())){
			
			map.put("success", "success");

		}else{
			map.put("check", "비밀번호가 틀렸습니다.");
			map.put("success", "fail");
		}
		
		Gson gson = new Gson();
		
		
		return gson.toJson(map);
		
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
	
	
	// 리뷰 쓰기 창열기
	@RequestMapping("reveiwwrite.mib")
	public ModelAndView coupon_Administer(HttpServletRequest res, HttpServletResponse rep){
		MainDto userdto = (MainDto)res.getSession().getAttribute("LoginInfo");
		ModelAndView mav = new ModelAndView("mypage/usermypage/review/write/ReviewWrite");
		mav.addObject("userdto",userdto);
		return mav;

	}
	 /*리뷰쓰기버튼 눌렀을 때
		@RequestMapping(value="reviewWrite.mib" , method=RequestMethod.POST)
		public ModelAndView writeGood(HttpServletRequest res) throws Exception{
			ModelAndView mav = new ModelAndView("mypage/usermypage/Buylist");
			MainDto userdto = (MainDto)res.getSession().getAttribute("LoginInfo");
			// form에서 넘어온 input
			String REV_TITLE= res.getParameter("title");
			String REV_CONTENT= res.getParameter("content");
			String SCORE= res.getParameter("score");
			String PRO_SEQ= res.getParameter("pro_seq");
			
			// 이걸로먼저 review table에 인설트
			HashMap<String, String> remap = new HashMap<>();
			remap.put("REV_TITLE", REV_TITLE);
			remap.put("REV_CONTENT", REV_CONTENT);
			remap.put("SCORE", SCORE);
			remap.put("PRO_SEQ", PRO_SEQ);
			remap.put("USER_ID", userdto.getUSER_ID());
			userMypageSvc.do_insert_review(remap);
		
			
			
			
			
			// 사진 파일 부분 
			HashMap<String, Object> map =  parseInsertFileInfo(res);
			
			userMypageSvc.do_insert_reviewphoto(map);
				
				 return mav;
			}*/

	
		// 파일 이름 중복 방지 메소드
		 public static String getRandomString(){

			        return UUID.randomUUID().toString().replaceAll("-", "");

		}
		
		// DB에 등록될 파일 메소드
		public HashMap<String,Object> parseInsertFileInfo(HttpServletRequest request) throws Exception{
			 
				HttpSession session = request.getSession(); 
		        
				MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;

		        Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		        
		        // 저장경로 
		        String root_path = session.getServletContext().getRealPath("/"); // 웹서비스 root 경로
				//String root_path = System.getProperty("catalina.home");
		        String attach_path = "images\\"; 
				String filePath = root_path+attach_path;
		         
				System.out.println("저장경로=========================================================================================="+filePath);

		        MultipartFile multipartFile = null;

		        String originalFileName = null;

		        String originalFileExtension = null;

		        String storedFileName = null;

		         
		        HashMap<String, Object> listMap = null; 

		         
		        File file = new File(filePath);
		        // 폴더가없을경우 폴더생성 
		        if(file.exists() == false){

		            file.mkdirs();

		        }

		   
		        while(iterator.hasNext()){
		            multipartFile = multipartHttpServletRequest.getFile(iterator.next());

		            if(multipartFile.isEmpty() == false){

		                originalFileName = multipartFile.getOriginalFilename();

		                originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));

		                storedFileName = getRandomString() + originalFileExtension;

		                // 첨부한 파일 생성 
		                file = new File(filePath + storedFileName);

		                multipartFile.transferTo(file);

		                listMap = new HashMap<String,Object>();
		                
		                listMap.put("ORIGINAL_FILE_NAME", originalFileName); //원래 파일이름

		                listMap.put("STORED_FILE_NAME", storedFileName);  // 저장될 파일이름 
		                
		                listMap.put("REV_SEQ", userMypageSvc.do_select_revseq());
		            }

		        }

		        return listMap;

		    }
		
		// 자식창 
		@RequestMapping(value="reviewWrite.mib", method=RequestMethod.POST,produces = "application/json; charset=utf8")
		
		public @ResponseBody String reviewWrite(MultipartHttpServletRequest res) throws Exception{
			
			MainDto userdto = (MainDto)res.getSession().getAttribute("LoginInfo");
			// form에서 넘어온 input
			String REV_TITLE= res.getParameter("title");
			String REV_CONTENT= res.getParameter("content");
			String SCORE= res.getParameter("score");
			String PRO_SEQ= res.getParameter("pro_seq");
			
			// 이걸로먼저 review table에 인설트
			HashMap<String, String> remap = new HashMap<>();
			remap.put("REV_TITLE", REV_TITLE);
			remap.put("REV_CONTENT", REV_CONTENT);
			remap.put("SCORE", SCORE);
			remap.put("PRO_SEQ", PRO_SEQ);
			remap.put("USER_ID", userdto.getUSER_ID());
			int rev =  userMypageSvc.do_insert_review(remap);
			HashMap<String, Object> map = null;
			HashMap<String, String> resultMap = new HashMap<>();
			if(rev>0){
				// 사진 파일 부분 
				
				 Iterator<String> iterator = res.getFileNames();
			        
			        // 저장경로 
				 	HttpSession session = res.getSession(); 
			        String root_path = session.getServletContext().getRealPath("/"); // 웹서비스 root 경로
					//String root_path = System.getProperty("catalina.home");
			        String attach_path = "images\\"; 
					String filePath = root_path+attach_path;
			         
					System.out.println("저장경로=========================================================================================="+filePath);

			        MultipartFile multipartFile = null;

			        String originalFileName = null;

			        String originalFileExtension = null;

			        String storedFileName = null;

			         
			        HashMap<String, Object> listMap = null; 

			         
			        File file = new File(filePath);
			        // 폴더가없을경우 폴더생성 
			        if(file.exists() == false){

			            file.mkdirs();

			        }

			   
			        while(iterator.hasNext()){
			            multipartFile = res.getFile(iterator.next());

			            if(multipartFile.isEmpty() == false){

			                originalFileName = multipartFile.getOriginalFilename();

			                originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));

			                storedFileName = getRandomString() + originalFileExtension;

			                // 첨부한 파일 생성 
			                file = new File(filePath + storedFileName);

			                multipartFile.transferTo(file);

			                listMap = new HashMap<String,Object>();
			                
			                listMap.put("ORIGINAL_FILE_NAME", originalFileName); //원래 파일이름

			                listMap.put("STORED_FILE_NAME", storedFileName);  // 저장될 파일이름 
			                
			                listMap.put("REV_SEQ", userMypageSvc.do_select_revseq());
			            }

			        }
				
				
				int revp = userMypageSvc.do_insert_reviewphoto(listMap);
				
				if(revp>0){
					resultMap.put("result", "OK");
				}
			}
			
			
			Gson gson = new Gson();
			
			
			return gson.toJson(resultMap);
			
		}
	
}