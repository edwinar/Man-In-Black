package com.eagle.men_in_black.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tiles.request.Request;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.events.EventException;

import com.eagle.men_in_black.model.FileModel;
import com.eagle.men_in_black.model.ServiceDto;
import com.eagle.men_in_black.service.ServiceSvc;

@Controller
public class ServiceController {
	Logger loger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private ServiceSvc serviceSvc;

	// 고객센터 메인(공지사항)
	@RequestMapping("servicenotice.mib")
	public ModelAndView servicenotice(HttpServletRequest res, HttpServletResponse rep) {

		ModelAndView mav = new ModelAndView("service/notice");

		String PAGE_NUM = (res.getParameter("PAGE_NUM") == null || res.getParameter("PAGE_NUM") == "") ? "1"
				: res.getParameter("PAGE_NUM");
		String PAGE_SIZE = (res.getParameter("PAGE_SIZE") == null || res.getParameter("PAGE_SIZE") == "") ? "10"
				: res.getParameter("PAGE_SIZE");

		HashMap<String, String> map = new HashMap<>();
		map.put("PAGE_SIZE", PAGE_SIZE);
		map.put("PAGE_NUM", PAGE_NUM);

		List<ServiceDto> noticelist = serviceSvc.do_service_main(map);

		mav.addObject("noticelist", noticelist);

		return mav;

	}

	// 고객센터 공지사항(디테일)
	@RequestMapping("servicedetail.mib")
	public ModelAndView servicedetail(HttpServletRequest res, HttpServletResponse rep) {
		// view 에서 보낸 seq 받기
		int seq = Integer.parseInt(res.getParameter("seq"));

		ModelAndView mav = new ModelAndView("service/noticedetail");
		ServiceDto dto = serviceSvc.do_service_detail(seq);
		mav.addObject("detail", dto);
		return mav;

	}

	// 공지사항쓰기(관리자)
	@RequestMapping(value="servicereg.mib", method=RequestMethod.POST)
	public ModelAndView noticeincert(MultipartHttpServletRequest res) {

		ModelAndView mav = new ModelAndView("service/notice");

		// DB에 글등록
		String editor = res.getParameter("editor");
		String noticetitle = res.getParameter("noticetitle");
						
		HashMap<String, String> writemap = new HashMap<>();
		writemap.put("content", editor);
		writemap.put("noticetitle", noticetitle);
		
		serviceSvc.do_service_reg(writemap);

		// 공지게시판 목록으로 다시가기
		HashMap<String, String> map = new HashMap<>();
		map.put("PAGE_SIZE", "10");
		map.put("PAGE_NUM", "1");

		List<ServiceDto> noticelist = serviceSvc.do_service_main(map);
		
		mav.addObject("noticelist", noticelist);
		return mav;
	}

	// 공지사항수정(관리자)
	@RequestMapping("serviceupdate.mib")
	public ModelAndView serviceupdate(HttpServletRequest res, HttpServletResponse rep){
		
		String seq = res.getParameter("seq");
		String editor = res.getParameter("editor");
		String noticetitle = res.getParameter("noticetitle");
						
		HashMap<String, String> writemap = new HashMap<>();
		writemap.put("content", editor);
		writemap.put("noticetitle", noticetitle);
		writemap.put("seq", seq);
		
		serviceSvc.do_service_update(writemap);
		
		ModelAndView mav = new ModelAndView("service/noticedetail");
		ServiceDto dto = serviceSvc.do_service_detail(Integer.parseInt(seq));
		mav.addObject("detail", dto);
		
		
		return mav;
		
	}
	

	// 공지사항삭제(관리자)
	@RequestMapping("servicedelete.mib")
	public ModelAndView servicedelete(HttpServletRequest res, HttpServletResponse rep){
		
		int seq = Integer.parseInt(res.getParameter("seq"));
		
		ModelAndView mav = new ModelAndView("service/notice");
		int serviceDto = serviceSvc.do_service_delete(seq);
		
		HashMap<String, String> map = new HashMap<>();
		map.put("PAGE_SIZE", "10");
		map.put("PAGE_NUM", "1");

		List<ServiceDto> noticelist = serviceSvc.do_service_main(map);
		
		mav.addObject("noticelist", noticelist);
		
		return mav;
		
	}
	
	
	
	//이벤트 
	@RequestMapping("event.mib")
	public ModelAndView event(HttpServletRequest res, HttpServletResponse rep){
		
		ModelAndView mav = new ModelAndView("service/event");
		
		String PAGE_NUM = (res.getParameter("PAGE_NUM") == null || res.getParameter("PAGE_NUM") == "") ? "1"
				: res.getParameter("PAGE_NUM");
		String PAGE_SIZE = (res.getParameter("PAGE_SIZE") == null || res.getParameter("PAGE_SIZE") == "") ? "10"
				: res.getParameter("PAGE_SIZE");

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("PAGE_SIZE", PAGE_SIZE);
		map.put("PAGE_NUM", PAGE_NUM);

		List<ServiceDto> eventlist = serviceSvc.do_event_main(map);

		mav.addObject("eventlist", eventlist);
		
		return mav;
		
	}
	
	//이벤트 작성
	@RequestMapping("eventwrite.mib")
	public ModelAndView event_reg(HttpServletRequest res) {
		
		ModelAndView mav = new ModelAndView("/service/eventwrite");
		
		return mav;
	}
	
	
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

	               // listMap.put("EVENT_SEQ", serviceSvc.do_event_reg(map));
	            }

	        }

	        return listMap;

	    }

	
	//이벤트 상세보기
		@RequestMapping("eventdetail.mib")
		public ModelAndView eventdetail(HttpServletRequest res, HttpServletResponse rep) {
			
			
			int seq = Integer.parseInt(res.getParameter("SEQ"));
			
			ModelAndView mav = new ModelAndView("/service/eventdetail");
			ServiceDto dto = serviceSvc.do_event_detail(seq);
			mav.addObject("eventdetail", dto);
			return mav;
		}
	
	
	
	
	
	
	/* FCK Editor */
	@RequestMapping("CkeditorNoticeUpload.mib")
	public ModelAndView register_Good(HttpServletRequest res) {
 
		ModelAndView mav = new ModelAndView("/service/noticewrite");
		String seq = res.getParameter("seq")==null?"0":res.getParameter("seq");
		int intseq = Integer.parseInt(seq);
		ServiceDto dto = serviceSvc.do_service_detail(intseq);
		mav.addObject("update", dto);

		return mav;

	}

	/* FCK 이미지업로드 */
	@RequestMapping(value = "CkeditorImgUpload.mib", method = RequestMethod.POST)
	public ModelAndView procFileUpload(FileModel fileBean, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();

		String root_path = session.getServletContext().getRealPath("/"); // 웹서비스
																			// root
																			// 경로
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
				e.printStackTrace();
			}
		}
		String file_path = "../" + "images/" + filename;

		ModelAndView mov = new ModelAndView("/service/NewFile");
		mov.addObject("file_path", file_path);
		mov.addObject("CKEditorFuncNum", CKEditorFuncNum);

		return mov;
	}
}
