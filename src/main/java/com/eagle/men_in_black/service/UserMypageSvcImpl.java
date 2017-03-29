package com.eagle.men_in_black.service;

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
	public List<UserMypageDto> do_search_buylist(String id) {
		// TODO Auto-generated method stub
		return userMypageDao.do_search_buylist(id);
	}


	@Override
	public List<UserMypageDto> do_search_pointlist(String id) {
		// TODO Auto-generated method stub
		return userMypageDao.do_search_pointlist(id);
	}


	@Override
	public List<UserMypageDto> do_search_couponlist(String id) {
		// TODO Auto-generated method stub
		return userMypageDao.do_search_couponlist(id);
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
	public List<UserMypageDto> do_search_reviewlist(String id) {
		// TODO Auto-generated method stub
		return userMypageDao.do_search_reviewlist(id);
	}


	@Override
	public List<UserMypageDto> do_search_qnalist(String id) {
		// TODO Auto-generated method stub
		return userMypageDao.do_search_qnalist(id);
	}

}