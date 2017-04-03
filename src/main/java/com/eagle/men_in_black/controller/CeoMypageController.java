package com.eagle.men_in_black.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.eagle.men_in_black.model.CeoMypageDto;
import com.eagle.men_in_black.model.FileModel;
import com.eagle.men_in_black.model.MainDto;
import com.eagle.men_in_black.service.CeoMypageSvc;
import com.google.gson.Gson;

@Controller
public class CeoMypageController {
	Logger loger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private CeoMypageSvc ceoMypageSvc;
	
	// 제품등록
	@RequestMapping("register_Good.mib")
	public ModelAndView register_Good() {

			ModelAndView mav = new ModelAndView("mypage/ceomypage/Register_Good");
			

			return mav;

	}
	
	// 파일 이름 중복 방지 메소드
	 public static String getRandomString(){

		        return UUID.randomUUID().toString().replaceAll("-", "");

	}
	
	// DB에 등록될 파일 메소드
	public List<Map<String,Object>> parseInsertFileInfo(HttpServletRequest request) throws Exception{
		 
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

	         

	        List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();

	        HashMap<String,Object> listMap = null; 

	         
	        File file = new File(filePath);
	        // 폴더가없을경우 폴더생성 
	        if(file.exists() == false){

	            file.mkdirs();

	        }

	         
	        int SEQ = 265;
	        int fileCount = 0;
	        while(iterator.hasNext()){
	        		SEQ++;
	        		multipartFile = multipartHttpServletRequest.getFile(iterator.next());

	            if(multipartFile.isEmpty() == false){
	            	
	            	if(fileCount==0){
	                originalFileName = multipartFile.getOriginalFilename();

	                originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
	                
	                storedFileName = "MAIN" + getRandomString() + originalFileExtension;
	                
	                 
	                // 첨부한 파일 생성 
	                file = new File(filePath + storedFileName);

	                multipartFile.transferTo(file);
	                
	                System.out.println("SEQ사진1=="+SEQ);
	                listMap = new HashMap<String,Object>(); 
	                
	                listMap.put("SEQ", SEQ);
	                
	                listMap.put("ORIGINAL_FILE_NAME", originalFileName); //원래 파일이름

	                listMap.put("STORED_FILE_NAME", storedFileName);  // 저장될 파일이름 

	                //listMap.put("FILE_SIZE", multipartFile.getSize());  // 파일크기 

	                list.add(listMap);
	                fileCount++;
	            	}else{
	            	   originalFileName = multipartFile.getOriginalFilename();

	 	               originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
	 	                
	 	               storedFileName = getRandomString() + originalFileExtension;
	 	                
	 	                 
	 	                // 첨부한 파일 생성 
	 	               file = new File(filePath + storedFileName);

	 	               multipartFile.transferTo(file);
	 	               System.out.println("SEQ사진2부터=="+SEQ);
	 	               listMap = new HashMap<String,Object>();  
	 	               
	 	               listMap.put("SEQ", SEQ);
	 	                
	 	               listMap.put("ORIGINAL_FILE_NAME", originalFileName); //원래 파일이름

	 	               listMap.put("STORED_FILE_NAME", storedFileName);  // 저장될 파일이름 

	 	               //listMap.put("FILE_SIZE", multipartFile.getSize());  // 파일크기 

	 	               list.add(listMap);	
	            	}
	            }

	        }

	        return list;

	    }


	 
	 
	 
	 
	 /*글쓰기버튼 눌렀을 때*/
	@RequestMapping(value="writeGood.mib" , method=RequestMethod.POST)
	public ModelAndView writeGood(HttpServletRequest res) throws Exception{
		ModelAndView mav = new ModelAndView("mypage/ceomypage/CeoMypage_Main");
		
		// product 부분 
		String pro_detail=res.getParameter("editor")==null?"":res.getParameter("editor");
		String pro_name  =res.getParameter("pro_name")==null?"":res.getParameter("pro_name");
		String item      =res.getParameter("item")==null?"":res.getParameter("item");
		String sub_item  =res.getParameter("sub_item")==null?"":res.getParameter("sub_item");
		String pro_price =res.getParameter("pro_price")==null?"":res.getParameter("pro_price");
		String material  =res.getParameter("material")==null?"":res.getParameter("material");
		String wash      =res.getParameter("wash")==null?"":res.getParameter("wash");
		String bodytype  =res.getParameter("bodytype")==null?"":res.getParameter("bodytype");
		String pro_content=res.getParameter("pro_content")==null?"":res.getParameter("pro_content");
		String new_item  = res.getParameter("new_item")==null?"N":res.getParameter("new_item");
		                 
		
		// pro_detail 부분 
		String color = res.getParameter("color")==null?"":res.getParameter("color");
		String size = res.getParameter("size")==null?"":res.getParameter("size");
		String stock = res.getParameter("stock")==null?"":res.getParameter("stock");
		
		HashMap<String, Object> detailMap = new HashMap<>();
		detailMap.put("color", color);
		detailMap.put("size", size);
		detailMap.put("stock", stock);
		int count = 0;
		
		for(int i=1; i<99; i++){
			color = res.getParameter("color"+i)==null?"none":res.getParameter("color"+i);
			size = res.getParameter("size"+i)==null?"none":res.getParameter("size"+i);
			stock = res.getParameter("stock"+i)==null?"none":res.getParameter("stock"+i);
			if(!color.equals("none")&&!size.equals("none")&&!stock.equals("none")){
			count++;
			detailMap.put("color"+i, color);
			detailMap.put("size"+i, size);
			detailMap.put("stock"+i, stock);
			}
		}
		
		/*System.out.println("count====="+count);
		for(int i=1; i<=count; i++){
			System.out.println("저장된 맵 칼라===" + detailMap.get("color"+i));
			System.out.println("저장된 맵 사이즈===" + detailMap.get("size"+i));
			System.out.println("저장된 맵 재고===" + detailMap.get("stock"+i));
		}*/
		
		
		
		// 사진 파일 부분 
		List<Map<String, Object>> list =  parseInsertFileInfo(res);
		ceoMypageSvc.do_insert_photo(list);
		
		/*for(int i=0; i<list.size();i++){
			System.out.println("파일이름"+list.get(i).get("ORIGINAL_FILE_NAME"));
			System.out.println("파일이름"+list.get(i).get("STORED_FILE_NAME"));
		}*/
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
			
			if (upload != null) { 
				filename = upload.getOriginalFilename(); 
				fileBean.setFilename(filename); 
				CKEditorFuncNum = fileBean.getCKEditorFuncNum(); 
			
			try { 
				File file = new File(root_path + attach_path + filename);
				loger.info(root_path + attach_path + filename); 
				upload.transferTo(file); 
			} catch (IOException e) { 
				e.printStackTrace(); } 
			} 
			
			String file_path = "../" + "images/" + filename; 
					
			ModelAndView mov = new ModelAndView("/mypage/ceomypage/NewFile");
			mov.addObject("file_path", file_path);
			mov.addObject("CKEditorFuncNum", CKEditorFuncNum);
			
			return mov;
			}
		
	
	
	// 사장 마이페이지 메인, 판매관리 
	@RequestMapping("ceoMypage_Main.mib")
	public ModelAndView ceoMypage_Main(HttpServletRequest res, HttpServletResponse rep) {

		ModelAndView mav = new ModelAndView("mypage/ceomypage/CeoMypage_Main");
		
		String PAGE_NUM = (res.getParameter("PAGE_NUM")==null ||res.getParameter("PAGE_NUM")=="")?"1":res.getParameter("PAGE_NUM");
		String PAGE_SIZE = (res.getParameter("PAGE_SIZE")==null ||res.getParameter("PAGE_SIZE")=="")?"10":res.getParameter("PAGE_SIZE");
		String START_DATE = (res.getParameter("START_DATE")==null ||res.getParameter("START_DATE")=="")?"SYSDATE":res.getParameter("START_DATE");
		String END_DATE = (res.getParameter("END_DATE")==null ||res.getParameter("END_DATE")=="")?"SYSDATE":res.getParameter("END_DATE");
		String search = (res.getParameter("search")==null ||res.getParameter("PRO_NAME")=="")?"%%":"%"+res.getParameter("search")+"%";

		HashMap<String, String> map = new HashMap<>();
		map.put("PAGE_SIZE", PAGE_SIZE);
		map.put("PAGE_NUM", PAGE_NUM);
		map.put("START_DATE",START_DATE);
		map.put("END_DATE",END_DATE);
		map.put("search", search);
	
		System.out.println("컨트롤러 ======== PAGE_NUM"+PAGE_NUM);
		System.out.println("컨트롤러 ======== PAGE_SIZE"+PAGE_SIZE);
		System.out.println("컨트롤러 ======== START_DATE"+START_DATE);
		System.out.println("컨트롤러 ======== END_DATE"+END_DATE);
		System.out.println("컨트롤러 ======== search"+search);
		
		
		List<CeoMypageDto> list = ceoMypageSvc.do_ceomypage_main(map);
		
		mav.addObject("list", list);
		mav.addObject("PAGE_SIZE", PAGE_SIZE);
		mav.addObject("PAGE_NUM", PAGE_NUM);
		mav.addObject("START_DATE",START_DATE);
		mav.addObject("END_DATE",END_DATE);
		mav.addObject("search", search);
		

		return mav;

	}
	//배송 단계 아작스 부분 
		@RequestMapping(value="del_step.mib", method=RequestMethod.POST,produces = "application/json; charset=utf8")
		
		public @ResponseBody String emailCheck(HttpServletRequest res){
			Map<String, Object> resultMap = new HashMap<>();
			
			String SEQ = (res.getParameter("SEQ")==null || res.getParameter("SEQ")=="")?"":res.getParameter("SEQ");
			
			String del_step = ceoMypageSvc.do_search_delstep(Integer.parseInt(SEQ));
			
			HashMap<String, String> map = new HashMap<>();
			int updateCom = 0;
			if(del_step.equals("상품준비")){
				map.put("delstep", "배송중");
				map.put("del_seq", SEQ);
				updateCom = ceoMypageSvc.do_update_delstep(map);
			}else if(del_step.equals("배송중")){
				map.put("delstep", "배송완료");
				map.put("del_seq", SEQ);
				updateCom = ceoMypageSvc.do_update_delstep(map);
			}
			
			if(updateCom>0){
			String update_del_step = ceoMypageSvc.do_search_delstep(Integer.parseInt(SEQ));
			
			resultMap.put("check", update_del_step);
				
			Gson gson = new Gson();
			return gson.toJson(resultMap);
			}
			return null;
			
		}
	
	//메인 배너 등록
	@RequestMapping("register_MainBanner.mib")
	public ModelAndView register_MainBanner(){
		ModelAndView mav = new ModelAndView("mypage/ceomypage/Register_MainBanner");
		
		return mav;
	}
	// 문의글 관리 
		@RequestMapping("qnA_Administer.mib")
		public ModelAndView qnA_Administer() {

			ModelAndView mav = new ModelAndView("mypage/ceomypage/QnA_Administer");
				
			// 처음 다섯개씩 뿌릴때 
			HashMap<String, Object> map  = new HashMap<>();
			map.put("PAGE_SIZE", "5");
			map.put("PAGE_NUM", "1");
			map.put("ITEM", "OUTER");
			
			List<CeoMypageDto> outerlist = ceoMypageSvc.do_search_QnA(map);
			
			map.put("ITEM", "TOP");
			
			List<CeoMypageDto> toplist = ceoMypageSvc.do_search_QnA(map);
			
			map.put("ITEM", "PANTS");
			
			List<CeoMypageDto> pantslist = ceoMypageSvc.do_search_QnA(map);
			
			map.put("ITEM", "SHOES");
			
			List<CeoMypageDto> shoeslist = ceoMypageSvc.do_search_QnA(map);
			
			map.put("ITEM", "BAGnACC");
			
			List<CeoMypageDto> baglist = ceoMypageSvc.do_search_QnA(map);
			
			mav.addObject("outerlist", outerlist);
			mav.addObject("toplist", toplist);
			mav.addObject("pantslist", pantslist);
			mav.addObject("shoeslist", shoeslist);
			mav.addObject("baglist", baglist);
			
			
			return mav;
			

		}
	// 문의 관리 더보기 
		@RequestMapping("qnA_Administer_dt.mib")
		public ModelAndView qnA_Administer_dt(HttpServletRequest res) {

		ModelAndView mav = new ModelAndView("mypage/ceomypage/QnA_Administer_dt");
		
		String PAGE_NUM = (res.getParameter("PAGE_NUM")==null ||res.getParameter("PAGE_NUM")=="")?"1":res.getParameter("PAGE_NUM");
		String PAGE_SIZE = (res.getParameter("PAGE_SIZE")==null ||res.getParameter("PAGE_SIZE")=="")?"10":res.getParameter("PAGE_SIZE");
		String ITEM = (res.getParameter("ITEM")==null ||res.getParameter("ITEM")=="")?"":res.getParameter("ITEM");
		
			HashMap<String, Object> map  = new HashMap<>();
			map.put("PAGE_SIZE", PAGE_SIZE);
			map.put("PAGE_NUM", PAGE_NUM);
			map.put("ITEM", ITEM);
			
			List<CeoMypageDto> list = ceoMypageSvc.do_search_QnA(map);
			
			mav.addObject("list", list);
			
			
			return mav;

		}
	// 쿠폰관리 
	@RequestMapping("coupon_Administer.mib")
	public ModelAndView coupon_Administer() {

		ModelAndView mav = new ModelAndView("mypage/ceomypage/Coupon_Administer");
		
		return mav;

	}
	
	// 리뷰관리 
	@RequestMapping("reiview_Administer.mib")
	public ModelAndView reiview_Administer() {

		ModelAndView mav = new ModelAndView("mypage/ceomypage/Reiview_Administer");
		
		// 처음 다섯개씩 뿌릴때 
		HashMap<String, Object> map  = new HashMap<>();
		map.put("PAGE_SIZE", "5");
		map.put("PAGE_NUM", "1");
		map.put("ITEM", "OUTER");
		
		List<CeoMypageDto> outerlist = ceoMypageSvc.do_search_review(map);
		
		map.put("ITEM", "TOP");
		
		List<CeoMypageDto> toplist = ceoMypageSvc.do_search_review(map);
		
		map.put("ITEM", "PANTS");
		
		List<CeoMypageDto> pantslist = ceoMypageSvc.do_search_review(map);
		
		map.put("ITEM", "SHOES");
		
		List<CeoMypageDto> shoeslist = ceoMypageSvc.do_search_review(map);
		
		map.put("ITEM", "BAGnACC");
		
		List<CeoMypageDto> baglist = ceoMypageSvc.do_search_review(map);
		
		mav.addObject("outerlist", outerlist);
		mav.addObject("toplist", toplist);
		mav.addObject("pantslist", pantslist);
		mav.addObject("shoeslist", shoeslist);
		mav.addObject("baglist", baglist);
		
		
		return mav;

	}
	
	// 리뷰관리 더보기 
	@RequestMapping("reiview_Administer_dt.mib")
		public ModelAndView reiview_Administer_dt(HttpServletRequest res) {

		ModelAndView mav = new ModelAndView("mypage/ceomypage/Reiview_Administer_dt");
		
		String PAGE_NUM = (res.getParameter("PAGE_NUM")==null ||res.getParameter("PAGE_NUM")=="")?"1":res.getParameter("PAGE_NUM");
		String PAGE_SIZE = (res.getParameter("PAGE_SIZE")==null ||res.getParameter("PAGE_SIZE")=="")?"10":res.getParameter("PAGE_SIZE");
		String ITEM = (res.getParameter("ITEM")==null ||res.getParameter("ITEM")=="")?"":res.getParameter("ITEM");
		
			HashMap<String, Object> map  = new HashMap<>();
			map.put("PAGE_SIZE", PAGE_SIZE);
			map.put("PAGE_NUM", PAGE_NUM);
			map.put("ITEM", ITEM);
			
			List<CeoMypageDto> list = ceoMypageSvc.do_search_review(map);
			
			mav.addObject("list", list);
			
			
			return mav;

		}
	

	
}
	
	
	
	
	
	



