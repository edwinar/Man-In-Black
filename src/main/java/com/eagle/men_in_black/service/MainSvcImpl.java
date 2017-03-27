package com.eagle.men_in_black.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eagle.men_in_black.model.MainDto;
import com.eagle.men_in_black.repository.MainDao;

@Service
public class MainSvcImpl implements MainSvc {
	@Autowired
	private MainDao mainDao;
	
	@Override
	public MainDto do_search_pw(String id) {
		// TODO Auto-generated method stub
		return mainDao.do_search_pw(id);
	}

}
