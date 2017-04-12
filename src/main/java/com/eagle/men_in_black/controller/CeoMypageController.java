package com.eagle.men_in_black.controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
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

import com.eagle.men_in_black.excel.ExcelWriter;
import com.eagle.men_in_black.model.CeoMypageDto;
import com.eagle.men_in_black.model.FileModel;
import com.eagle.men_in_black.model.MainDto;
import com.eagle.men_in_black.service.CeoMypageSvc;
import com.google.gson.Gson;


@Controller
public class CeoMypageController {
	//Logger loger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private CeoMypageSvc ceoMypageSvc;
	
	// 제품등록
	@RequestMapping("register_Good.mib")
	public ModelAndView register_Good() {

			ModelAndView mav = new ModelAndView("mypage/ceomypage/Register_Good");
			
			return mav;

	}
	// 서브아이템 리스트 부분 
	@RequestMapping(value="sub_item.mib", method=RequestMethod.POST,produces = "application/json; charset=utf8")
	
	public @ResponseBody String sub_item(HttpServletRequest res){
		Map<String, Object> resultMap = new HashMap<>();
		
		String item = (res.getParameter("item")==null || res.getParameter("item")=="")?"":res.getParameter("item");
		
		List<String> list = ceoMypageSvc.do_search_subitem(item);
		
		
		Gson gson = new Gson();
		return gson.toJson(list);
		
		
	}

	
	// 파일 이름 중복 방지 메소드
	 public static String getRandomString(){

		        return UUID.randomUUID().toString().replaceAll("-", "");

	}
	
	// DB에 등록될 파일 메소드
	public List<HashMap<String,String>> parseInsertFileInfo(HttpServletRequest request) throws Exception{
		 
			HttpSession session = request.getSession(); 
	        
			MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;

	        Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
	        
	        // 저장경로 
	        String root_path = session.getServletContext().getRealPath("/"); // 웹서비스 root 경로
			//String root_path = System.getProperty("catalina.home");
	        String attach_path = "images\\"; 
			String filePath = root_path+attach_path;
			//String rootPath = request.getContextPath();
			System.out.println("저장경로=========================================================================================="+filePath);

	        MultipartFile multipartFile = null;

	        String originalFileName = null;

	        String originalFileExtension = null;

	        String storedFileName = null;

	         

	        List<HashMap<String,String>> list = new ArrayList<HashMap<String,String>>();

	        HashMap<String,String> listMap = null; 

	         
	        File file = new File(filePath);
	        // 폴더가없을경우 폴더생성 
	        if(file.exists() == false){

	            file.mkdirs();

	        }
 
	        int fileCount = 0;
	        while(iterator.hasNext()){
	        		multipartFile = multipartHttpServletRequest.getFile(iterator.next());

	            if(multipartFile.isEmpty() == false){
	            	
	            	if(fileCount==0){
	                originalFileName = multipartFile.getOriginalFilename();

	                originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
	                
	               // storedFileName = ".."+rootPath+"/images/MAIN" + getRandomString() + originalFileExtension;
	                storedFileName = "MAIN" + getRandomString() + originalFileExtension;
	               // System.out.println("저장경로와 파일이름 = " + filePath + storedFileName);
	                 
	                // 첨부한 파일 생성 
	                file = new File(filePath + storedFileName);

	                multipartFile.transferTo(file);
	                
	                listMap = new HashMap<String,String>(); 
	                
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
	 	               
	 	               listMap = new HashMap<String,String>();  
	 	               
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
		
		HashMap<String, String> map = new HashMap<>();
		map.put("pro_detail", pro_detail);
		map.put("pro_name", pro_name);
		map.put("item", item);
		map.put("sub_item", sub_item);
		map.put("pro_price", pro_price);
		map.put("material", material);
		map.put("wash", wash);
		map.put("bodytype", bodytype);
		map.put("pro_content", pro_content);
		map.put("new_item", new_item);
		
		
		int insertPro = ceoMypageSvc.do_insert_product(map);
		if(insertPro>0){
			
			// pro_detail 부분 
		String color = res.getParameter("color")==null?"":res.getParameter("color");
		String size = res.getParameter("size")==null?"":res.getParameter("size");
		String stock = res.getParameter("stock")==null?"":res.getParameter("stock");
		
		List<CeoMypageDto> pro_detail_list = new ArrayList<>();
	
		CeoMypageDto detailDto=new CeoMypageDto();
		detailDto.setCOLOR(color);
		detailDto.setSIZE(size);
		detailDto.setSTOCK(Integer.parseInt(stock));
		detailDto.setPRO_SEQ(ceoMypageSvc.do_select_proseq());
		
		pro_detail_list.add(detailDto);
		int count = 0;
		
		for(int i=1; i<99; i++){
			color = res.getParameter("color"+i)==null?"none":res.getParameter("color"+i);
			size = res.getParameter("size"+i)==null?"none":res.getParameter("size"+i);
			stock = res.getParameter("stock"+i)==null?"none":res.getParameter("stock"+i);
			if(!color.equals("none")&&!size.equals("none")&&!stock.equals("none")){
			count++;
			detailDto=new CeoMypageDto();
			detailDto.setCOLOR(color);
			detailDto.setSIZE(size);
			detailDto.setSTOCK(Integer.parseInt(stock));
			detailDto.setPRO_SEQ(ceoMypageSvc.do_select_proseq());
			pro_detail_list.add(detailDto);
			}
		}
		
			ceoMypageSvc.do_insert_product_detail(pro_detail_list);
			// 사진 파일 부분 
			List<HashMap<String, String>> list =  parseInsertFileInfo(res);
			ceoMypageSvc.do_insert_product_photo(list);
		
		}
		/*System.out.println("count====="+count);
		for(int i=1; i<=count; i++){
			System.out.println("저장된 맵 칼라===" + detailMap.get("color"+i));
			System.out.println("저장된 맵 사이즈===" + detailMap.get("size"+i));
			System.out.println("저장된 맵 재고===" + detailMap.get("stock"+i));
		}*/
		
		
		
		
		
		/*for(int i=0; i<list.size();i++){
			System.out.println("파일이름"+list.get(i).get("ORIGINAL_FILE_NAME"));
			System.out.println("파일이름"+list.get(i).get("STORED_FILE_NAME"));
		}*/
		
		String PAGE_NUM = (res.getParameter("PAGE_NUM")==null ||res.getParameter("PAGE_NUM")=="")?"1":res.getParameter("PAGE_NUM");
		String PAGE_SIZE = (res.getParameter("PAGE_SIZE")==null ||res.getParameter("PAGE_SIZE")=="")?"10":res.getParameter("PAGE_SIZE");
		String START_DATE = (res.getParameter("START_DATE")==null ||res.getParameter("START_DATE")=="")?"SYSDATE":res.getParameter("START_DATE");
		String END_DATE = (res.getParameter("END_DATE")==null ||res.getParameter("END_DATE")=="")?"SYSDATE":res.getParameter("END_DATE");
		String search = (res.getParameter("search")==null ||res.getParameter("PRO_NAME")=="")?"%%":"%"+res.getParameter("search")+"%";

		HashMap<String, String> mapli = new HashMap<>();
		mapli.put("PAGE_SIZE", PAGE_SIZE);
		mapli.put("PAGE_NUM", PAGE_NUM);
		mapli.put("START_DATE",START_DATE);
		mapli.put("END_DATE",END_DATE);
		mapli.put("search", search);
	
		/*System.out.println("컨트롤러 ======== PAGE_NUM"+PAGE_NUM);
		System.out.println("컨트롤러 ======== PAGE_SIZE"+PAGE_SIZE);
		System.out.println("컨트롤러 ======== START_DATE"+START_DATE);
		System.out.println("컨트롤러 ======== END_DATE"+END_DATE);
		System.out.println("컨트롤러 ======== search"+search);*/
		
		
		List<CeoMypageDto> list = ceoMypageSvc.do_ceomypage_main(mapli);
		
		mav.addObject("list", list);
		mav.addObject("PAGE_SIZE", PAGE_SIZE);
		mav.addObject("PAGE_NUM", PAGE_NUM);
		mav.addObject("START_DATE",START_DATE);
		mav.addObject("END_DATE",END_DATE);
		mav.addObject("search", search);
		
		
			 return mav;
		}

		/* 에디터 이미지업로드 */
		@RequestMapping(value="ckeditorImageUpload.mib",  method = RequestMethod.POST)
		public ModelAndView procFileUpload(FileModel fileBean,HttpServletRequest request, Model model) { 
			HttpSession session = request.getSession(); 
			
			String root_path = session.getServletContext().getRealPath("/"); // 웹서비스 root 경로
			//System.err.println("===>root_path" + root_path);
			
			String attach_path = "images\\"; 
			
			//System.err.println("===>attach_path" + attach_path);
			
			MultipartFile upload = fileBean.getUpload();
			String filename = ""; 
			String CKEditorFuncNum = "";
			String storedFileName = "";
			String rootPath = request.getContextPath();
			if (upload != null) { 
				filename = upload.getOriginalFilename(); 
				fileBean.setFilename(filename); 
				CKEditorFuncNum = fileBean.getCKEditorFuncNum(); 
			
			try { 
				
				String originalFileExtension = filename.substring(filename.lastIndexOf("."));

                storedFileName = getRandomString() + originalFileExtension;
				
				File file = new File(root_path + attach_path + storedFileName);
				//loger.info(root_path + attach_path + filename); 
				upload.transferTo(file); 
			} catch (IOException e) { 
				e.printStackTrace(); } 
			} 
			
			String file_path = ".."+rootPath+"/" + "images/" + storedFileName; 
					
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
	
		/*System.out.println("컨트롤러 ======== PAGE_NUM"+PAGE_NUM);
		System.out.println("컨트롤러 ======== PAGE_SIZE"+PAGE_SIZE);
		System.out.println("컨트롤러 ======== START_DATE"+START_DATE);
		System.out.println("컨트롤러 ======== END_DATE"+END_DATE);
		System.out.println("컨트롤러 ======== search"+search);*/
		
		
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
	public ModelAndView register_MainBanner(HttpServletRequest res){
		ModelAndView mav = new ModelAndView("mypage/ceomypage/Register_MainBanner");
		
		String PAGE_NUM = (res.getParameter("PAGE_NUM")==null ||res.getParameter("PAGE_NUM")=="")?"1":res.getParameter("PAGE_NUM");
		String PAGE_SIZE = (res.getParameter("PAGE_SIZE")==null ||res.getParameter("PAGE_SIZE")=="")?"10":res.getParameter("PAGE_SIZE");
		
		HashMap<String, String> map= new HashMap<>();
		map.put("PAGE_NUM", PAGE_NUM);
		map.put("PAGE_SIZE", PAGE_SIZE);
		
		List<CeoMypageDto> list = ceoMypageSvc.do_select_mainbanner(map);
		
		mav.addObject("list", list);
		
		
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
	
	@RequestMapping("mainBPT.mib")
	public ModelAndView mainBPT(HttpServletRequest res){
		ModelAndView mav = new ModelAndView("mypage/ceomypage/main/banner/MainBannerPT");
		String PRO_SEQ_A = res.getParameter("PRO_SEQ_A"); 
		String PRO_SEQ[] = PRO_SEQ_A.split(",");
		
		//System.out.println(PRO_SEQ[0]);
		
		List<Integer> seqlist = new ArrayList<>();
		for(int i=0;i<PRO_SEQ.length;i++){
			seqlist.add(Integer.parseInt(PRO_SEQ[i]));
		}
		
		List<CeoMypageDto> list =ceoMypageSvc.do_select_mainbanpt(seqlist);
		
		mav.addObject("list", list);
		
		return mav;
	}
	
	// 자식창 메인배너 
			@RequestMapping(value="mainbannerWrite.mib", method=RequestMethod.POST,produces = "application/json; charset=utf8")

			public @ResponseBody String mainbannerWrite(MultipartHttpServletRequest res) throws Exception{

				MainDto userdto = (MainDto)res.getSession().getAttribute("LoginInfo");
				// form에서 넘어온 input
				String pro_seq0=(res.getParameter("pro_seq0")==null||res.getParameter("pro_seq0").equals(""))?"none":res.getParameter("pro_seq0");
				String pro_seq1=(res.getParameter("pro_seq1")==null||res.getParameter("pro_seq1").equals(""))?"none":res.getParameter("pro_seq1");
				String pro_seq2=(res.getParameter("pro_seq2")==null||res.getParameter("pro_seq2").equals(""))?"none":res.getParameter("pro_seq2");
				
				// 메인배너 등록할 제품 시퀀스 받고 
				
				// 이걸로먼저 review table에 인설트
				
				//List<HashMap<String, String>> banlist = new ArrayList<>();
				List<CeoMypageDto> banlist = new ArrayList<>(); // 메인배너에 등록할 리스트 
				List<Integer> proseqlist = new ArrayList<>(); // 
				
				if(!pro_seq0.equals("none")){
					//HashMap<String, String> remap = new HashMap<>();
					//remap.put("pro_seq0", pro_seq0);
					CeoMypageDto dto = new CeoMypageDto();
					dto.setPRO_SEQ(Integer.parseInt(pro_seq0));
					banlist.add(dto);
					proseqlist.add(Integer.parseInt(pro_seq0));
				}
				if(!pro_seq1.equals("none")){
					//HashMap<String, String> remap = new HashMap<>();
					//remap.put("pro_seq1", pro_seq1);
					CeoMypageDto dto = new CeoMypageDto();
					dto.setPRO_SEQ(Integer.parseInt(pro_seq1));
					banlist.add(dto);
					proseqlist.add(Integer.parseInt(pro_seq1));
				}
				if(!pro_seq2.equals("none")){
					//HashMap<String, String> remap = new HashMap<>();
					//remap.put("pro_seq2", pro_seq2);
					CeoMypageDto dto = new CeoMypageDto();
					dto.setPRO_SEQ(Integer.parseInt(pro_seq2));
					banlist.add(dto);
					proseqlist.add(Integer.parseInt(pro_seq2));
				}
				
				//System.out.println("프로시퀀스"+pro_seq0);
				//System.out.println("프로시퀀스"+pro_seq1);
				//System.out.println("프로시퀀스"+pro_seq2);
				
				//System.out.println("리스트사이즈"+banlist.size());
				
				//for(int i=0; i<banlist.size(); i++){
				//	System.out.println("맵에저장된거" + banlist.get(i).getPRO_SEQ());
				//}
				
				
				
				int bannum = ceoMypageSvc.do_insert_mainbanner(banlist);
				
				
				
				// 방금위에서 등록한 banseq 
				List<Integer> banseqlist = ceoMypageSvc.do_select_banseq(proseqlist);
				
				HashMap<String, String> resultMap = new HashMap<>();
				if(bannum>0){
					// 사진 파일 부분

					 Iterator<String> iterator = res.getFileNames();

				        // 저장경로
					 	HttpSession session = res.getSession();
				        String root_path = session.getServletContext().getRealPath("/"); // 웹서비스 root 경로
						//String root_path = System.getProperty("catalina.home");
				        String attach_path = "images\\";
						String filePath = root_path+attach_path;

						//System.out.println("저장경로=========================================================================================="+filePath);

				        MultipartFile multipartFile = null;

				        String originalFileName = null;

				        String originalFileExtension = null;

				        String storedFileName = null;
				        
				        String rootPath = res.getContextPath();

				        HashMap<String, String> listMap = null;
				        List<HashMap<String, String>> banptlist = new ArrayList<>();

				        File file = new File(filePath);
				        // 폴더가없을경우 폴더생성
				        if(file.exists() == false){

				            file.mkdirs();

				        }
				        
				        int w=0;
				        while(iterator.hasNext()){
				            multipartFile = res.getFile(iterator.next());

				            if(multipartFile.isEmpty() == false){

				                originalFileName = multipartFile.getOriginalFilename();

				                originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));

				                storedFileName =  getRandomString() + originalFileExtension;

				                // 첨부한 파일 생성
				                file = new File(filePath + storedFileName);

				                multipartFile.transferTo(file);

				                listMap = new HashMap<String,String>();

				                listMap.put("ORIGINAL_FILE_NAME", originalFileName); //원래 파일이름

				                listMap.put("STORED_FILE_NAME", storedFileName);  // 저장될 파일이름
				                
				                listMap.put("BAN_SEQ", String.valueOf(banseqlist.get(w))); 
				                
				                banptlist.add(listMap);
				             
				                w++;
				                
				            }

				        }
				        int revp = ceoMypageSvc.do_insert_banpt(banptlist);

						if(revp>0){
							resultMap.put("result", "OK");
						}
					

					
				}


				Gson gson = new Gson();


				return gson.toJson(resultMap);

			}
			
			// 공지사항 글쓰기 
			@RequestMapping("notiwri.mib")
				public ModelAndView notiwri(HttpServletRequest res) {

				ModelAndView mav = new ModelAndView("/service/noticewrite");
					
					
					return mav;

				}
	
			// 이벤트 글쓰기 
			@RequestMapping("eventwri.mib")
				public ModelAndView eventwri(HttpServletRequest res) {

				ModelAndView mav = new ModelAndView("/service/eventwrite");
								
								
					return mav;

			}
			// 쿠폰 등록 글쓰기 
			@RequestMapping("couwri.mib")
			public ModelAndView couwri(HttpServletRequest res) {

							ModelAndView mav = new ModelAndView("/service/couponwrite");
											
											
								return mav;

			}

			// 사장 리뷰 답변달기 
			@RequestMapping(value="reviewadmup.mib", method=RequestMethod.POST,produces = "application/json; charset=utf8")
			public @ResponseBody String reviewadmup(HttpServletRequest res) throws Exception{
				MainDto userdto = (MainDto)res.getSession().getAttribute("LoginInfo");
				// form에서 넘어온 input
				int PRO_SEQ = Integer.parseInt((res.getParameter("PRO_SEQ")==null || res.getParameter("PRO_SEQ")=="")?"":res.getParameter("PRO_SEQ"));
				String REV_TITLE = (res.getParameter("REV_TITLE")==null || res.getParameter("REV_TITLE")=="")?"":res.getParameter("REV_TITLE");
				String REV_CONTENT = (res.getParameter("REV_CONTENT")==null || res.getParameter("REV_CONTENT")=="")?"":res.getParameter("REV_CONTENT");
				int REV_SEQ = Integer.parseInt((res.getParameter("REV_SEQ")==null || res.getParameter("REV_SEQ")=="")?"":res.getParameter("REV_SEQ"));
				
				System.out.println("넘어오니?"+REV_TITLE);
				
				// 이걸로먼저 review table에 인설트
				
				CeoMypageDto dto = new CeoMypageDto();
				dto.setPRO_SEQ(PRO_SEQ);
				dto.setREV_SEQ(REV_SEQ);
				dto.setREV_TITLE(REV_TITLE);
				dto.setREV_CONTENT(REV_CONTENT);
				
				int step = ceoMypageSvc.do_update_admre(dto);
				
				
				
				Gson gson = new Gson();
				
				return gson.toJson(step);
			}
			
			//엑셀 다운 
			@RequestMapping(value="exexldown.mib", method=RequestMethod.POST,produces = "application/json; charset=utf8")
			public @ResponseBody String exexldown(HttpServletRequest res) throws Exception{
			
			ModelAndView mav = new ModelAndView();

			String PAGE_NUM = (res.getParameter("PAGE_NUMexel")==null ||res.getParameter("PAGE_NUMexel")=="")?"1":res.getParameter("PAGE_NUMexel");
			String PAGE_SIZE = "10";
			String START_DATE = (res.getParameter("START_DATEexel")==null ||res.getParameter("START_DATEexel")=="")?"SYSDATE":res.getParameter("START_DATEexel");
			String END_DATE = (res.getParameter("END_DATEexel")==null ||res.getParameter("END_DATEexel")=="")?"SYSDATE":res.getParameter("END_DATEexel");
			String search = (res.getParameter("searchexel")==null ||res.getParameter("searchexel")=="")?"%%":"%"+res.getParameter("searchexel")+"%";
			
			HashMap<String, String> param = new HashMap<>();
			param.put("PAGE_SIZE", PAGE_SIZE);
			param.put("PAGE_NUM", PAGE_NUM);
			param.put("START_DATE",START_DATE);
			param.put("END_DATE",END_DATE);
			param.put("search", search);
			 

			List<CeoMypageDto> list = ceoMypageSvc.do_ceomypage_main(param); //쿼리

			
			int propricesum=0; 
			for(int i=0; i<list.size();i++){ 
				propricesum += list.get(i).getPRO_PRICE(); 
			}
			
			
			CeoMypageDto ceoDto = new CeoMypageDto();
			ceoDto.setSTART_DATE(START_DATE);
			ceoDto.setEND_DATE(END_DATE);
			ceoDto.setSEARCH(search);
			ceoDto.setPAGE_NUM(PAGE_NUM);
			ceoDto.setPropricesum(propricesum);
			
			ExcelWriter eWriter=new ExcelWriter();
			int flag = eWriter.xlsWriter(list, "판매내역", ceoDto);
			Gson gson = new Gson();
			
			if(flag!=-1){
				return gson.toJson("엑셀저장성공");
			}else{
				return gson.toJson("엑셀저장실패");
			}
			
			
			
			

			 

			}

}

			
			
	
	
	
	
	
	



