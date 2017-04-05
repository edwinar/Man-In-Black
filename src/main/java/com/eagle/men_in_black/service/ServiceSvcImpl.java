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

	@Override
	public ServiceDto do_service_detail(int seq) {
		// TODO Auto-generated method stub
		return serviceDao.do_service_detail(seq);
	}

	@Override
	public void do_service_reg(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		serviceDao.do_service_reg(map);
	}

	@Override
	public void do_service_update(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		serviceDao.do_service_update(map);
	}

	@Override
	public int do_service_delete(int seq) {
		// TODO Auto-generated method stub
		return serviceDao.do_service_delete(seq);
	}

	@Override
	public List<ServiceDto> do_event_main(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return serviceDao.do_event_main(map);
	}

	@Override
	public ServiceDto do_event_detail(int seq) {
		// TODO Auto-generated method stub
		return serviceDao.do_event_detail(seq);
	}

	@Override
	public void do_event_reg(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		serviceDao.do_event_reg(map);
	}

	@Override
	public void do_event_update(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		serviceDao.do_event_update(map);
	}

	@Override
	public int do_event_delete(int seq) {
		// TODO Auto-generated method stub
		return serviceDao.do_event_delete(seq);
	}

}
