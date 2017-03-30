package com.eagle.men_in_black.service;

import java.util.HashMap;
import java.util.List;

import com.eagle.men_in_black.model.ServiceDto;

public interface ServiceSvc {

	public List<ServiceDto> do_service_main(HashMap<String, String> map);
}
