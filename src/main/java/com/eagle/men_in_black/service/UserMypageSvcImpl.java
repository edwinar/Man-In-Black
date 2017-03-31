package com.eagle.men_in_black.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eagle.men_in_black.model.UserMypageDto;
import com.eagle.men_in_black.repository.UserMypageDao;

@Service
public class UserMypageSvcImpl implements UserMypageSvc {
	@Autowired
	private UserMypageDao userMypageDao;
	
	@Override
	public UserMypageDto do_search_point(String id) {
		// TODO Auto-generated method stub
		return userMypageDao.do_search_point(id);
	}

	
	@Override
	public List<UserMypageDto> do_search_coupon(String id) {
		// TODO Auto-generated method stub
		return userMypageDao.do_search_coupon(id);
	}


	@Override
	public List<UserMypageDto> do_search_buy(String id) {
		// TODO Auto-generated method stub
		return userMypageDao.do_search_buy(id);
	}


	@Override
	public List<UserMypageDto> do_search_qna(String id) {
		// TODO Auto-generated method stub
		return userMypageDao.do_search_qna(id);
	}


	@Override
	public List<UserMypageDto> do_search_basket(String id) {
		// TODO Auto-generated method stub
		return userMypageDao.do_search_basket(id);
	}


	@Override
	public List<UserMypageDto> do_search_buylist(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return userMypageDao.do_search_buylist(map);
	}


	@Override
	public List<UserMypageDto> do_search_pointlist(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return userMypageDao.do_search_pointlist(map);
	}


	@Override
	public List<UserMypageDto> do_search_couponlist(HashMap<String, String> mapc) {
		// TODO Auto-generated method stub
		return userMypageDao.do_search_couponlist(mapc);
	}


	@Override
	public List<UserMypageDto> do_search_point5(String id) {
		// TODO Auto-generated method stub
		return userMypageDao.do_search_point5(id);
	}


	@Override
	public List<UserMypageDto> do_search_basketlist(String id) {
		// TODO Auto-generated method stub
		return userMypageDao.do_search_basketlist(id);
	}


	@Override
	public List<UserMypageDto> do_search_myboradreview(String id) {
		// TODO Auto-generated method stub
		return userMypageDao.do_search_myboradreview(id);
	}


	@Override
	public List<UserMypageDto> do_search_myboradqna(String id) {
		// TODO Auto-generated method stub
		return userMypageDao.do_search_myboradqna(id);
	}


	@Override
	public List<UserMypageDto> do_search_reviewlist(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return userMypageDao.do_search_reviewlist(map);
	}


	@Override
	public List<UserMypageDto> do_search_qnalist(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return userMypageDao.do_search_qnalist(map);
	}

	@Override
	public void do_delete_basketlist(List<Integer> list){
		// TODO Auto-generated method stub
		 userMypageDao.do_delete_basketlist(list);
	}

	@Override
	public List<UserMypageDto> do_search_goods(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return userMypageDao.do_search_goods(map);
	}
}