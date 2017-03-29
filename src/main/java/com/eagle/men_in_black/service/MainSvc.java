package com.eagle.men_in_black.service;

import java.io.FileNotFoundException;
import java.net.URISyntaxException;

import com.eagle.men_in_black.model.MainDto;

public interface MainSvc {
	// 로그인
	public MainDto do_search_pw(String id);
	// 메일인증 
	public void sendEmail(String email, String authNum);

}
