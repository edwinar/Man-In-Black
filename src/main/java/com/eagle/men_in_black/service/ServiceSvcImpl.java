package com.eagle.men_in_black.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eagle.men_in_black.model.ServiceDto;
import com.eagle.men_in_black.repository.ServiceDao;

@Service
public class ServiceSvcImpl implements ServiceSvc {

	@Autowired
	private ServiceDao serviceDao;
	
	@Override
	public List<ServiceDto> do_service_main(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return serviceDao.do_service_main(map);
	}

}
