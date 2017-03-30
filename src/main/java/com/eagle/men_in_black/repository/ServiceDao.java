package com.eagle.men_in_black.repository;

import java.util.HashMap;
import java.util.List;

import com.eagle.men_in_black.model.ServiceDto;

public interface ServiceDao {
	
	public List<ServiceDto> do_service_main(HashMap<String, String> map);
	
}
