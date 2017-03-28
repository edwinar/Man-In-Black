package com.eagle.men_in_black.service;

import java.util.List;

import com.eagle.men_in_black.model.UserMypageDto;

public interface UserMypageSvc {
	public UserMypageDto do_search_point(String id);
	public List<UserMypageDto> do_search_coupon(String id);
	public List<UserMypageDto> do_search_buylist(String id);
	public List<UserMypageDto> do_search_qna(String id);
	public List<UserMypageDto> do_search_basket(String id);
	
	
}
