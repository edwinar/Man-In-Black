package com.eagle.men_in_black.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.eagle.men_in_black.model.CeoMypageDto;

public interface CeoMypageDao {
	public List<CeoMypageDto> do_ceomypage_main(HashMap<String, String> map);
	
	public int do_insert_photo(Map<String, Object> map);
	
	public List<CeoMypageDto> do_search_review(Map<String, Object> map);
	
	public List<CeoMypageDto> do_search_QnA(Map<String, Object> map);
}
