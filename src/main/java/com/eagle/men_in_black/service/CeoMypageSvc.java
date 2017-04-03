package com.eagle.men_in_black.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.eagle.men_in_black.model.CeoMypageDto;

public interface CeoMypageSvc {
	public List<CeoMypageDto> do_ceomypage_main(HashMap<String, String> map);
	public int do_insert_photo(List<Map<String, Object>> map);
	public List<CeoMypageDto> do_search_review(Map<String, Object> map);
	public List<CeoMypageDto> do_search_QnA(Map<String, Object> map);
	public String do_search_delstep(int SEQ);
	public int do_update_delstep(HashMap<String, String> map);
}
