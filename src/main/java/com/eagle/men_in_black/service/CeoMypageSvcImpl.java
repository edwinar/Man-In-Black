package com.eagle.men_in_black.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eagle.men_in_black.model.CeoMypageDto;
import com.eagle.men_in_black.repository.CeoMypageDao;
@Service
public class CeoMypageSvcImpl implements CeoMypageSvc {

	@Autowired
	private CeoMypageDao ceoMypageDao;
	
	@Override
	public List<CeoMypageDto> do_ceomypage_main(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return ceoMypageDao.do_ceomypage_main(map);
		
	}

}
