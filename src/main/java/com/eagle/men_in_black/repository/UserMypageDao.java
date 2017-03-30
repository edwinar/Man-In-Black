package com.eagle.men_in_black.repository;

import java.util.HashMap;
import java.util.List;

import com.eagle.men_in_black.model.UserMypageDto;

public interface UserMypageDao {

	public UserMypageDto do_search_point(String id);

	public List<UserMypageDto> do_search_point5(String id);

	public List<UserMypageDto> do_search_coupon(String id);

	public List<UserMypageDto> do_search_buy(String id);

	public List<UserMypageDto> do_search_qna(String id);

	public List<UserMypageDto> do_search_basket(String id);

	public List<UserMypageDto> do_search_buylist(HashMap<String, String> map);

	public List<UserMypageDto> do_search_pointlist(HashMap<String, String> map);

	public List<UserMypageDto> do_search_couponlist(HashMap<String, String> map);

	public List<UserMypageDto> do_search_basketlist(String id);

	public List<UserMypageDto> do_search_myboradreview(String id);

	public List<UserMypageDto> do_search_myboradqna(String id);

	public List<UserMypageDto> do_search_reviewlist(HashMap<String, String> map);

	public List<UserMypageDto> do_search_qnalist(HashMap<String, String> map);


}