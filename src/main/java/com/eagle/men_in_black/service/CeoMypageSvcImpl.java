package com.eagle.men_in_black.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Override
	public int do_insert_photo(List<Map<String, Object>> map) {
		// TODO Auto-generated method stub
		
		 List<Map<String,Object>> list = map;

		 int sumNum = 0;
		 
	        for(int i=0, size=list.size(); i<size; i++){

	        sumNum += ceoMypageDao.do_insert_photo(list.get(i));

	        }


		
		return sumNum;
	}

}
