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
	public List<CeoMypageDto> do_search_review(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return ceoMypageDao.do_search_review(map);
	}

	@Override
	public List<CeoMypageDto> do_search_QnA(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return ceoMypageDao.do_search_QnA(map);
	}

	@Override
	public String do_search_delstep(int SEQ) {
		// TODO Auto-generated method stub
		return ceoMypageDao.do_search_delstep(SEQ);
	}

	@Override
	public int do_update_delstep(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return ceoMypageDao.do_update_delstep(map);
	}

	@Override
	public int do_insert_product(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return ceoMypageDao.do_insert_product(map);
	}

	@Override
	public int do_insert_product_detail(List<CeoMypageDto> map) {
		List<CeoMypageDto> list = map;

		 int sumNum = 0;
		 
	        for(int i=0; i<list.size(); i++){

	        sumNum += ceoMypageDao.do_insert_product_detail(list.get(i));

	        }

	        return sumNum;
	}

	@Override
	public int do_insert_product_photo(List<HashMap<String, String>> map) {
		
		List<HashMap<String, String>> list = map;

		 int sumNum = 0;
		 
	        for(int i=0, size=list.size(); i<size; i++){

	        sumNum += ceoMypageDao.do_insert_product_photo(list.get(i));

	        }


		
		return sumNum;
		
	}

	@Override
	public int do_select_proseq() {
		// TODO Auto-generated method stub
		return ceoMypageDao.do_select_proseq();
	}

	@Override
	public List<String> do_search_subitem(String item) {
		// TODO Auto-generated method stub
		return ceoMypageDao.do_search_subitem(item);
	}

	
	

}
