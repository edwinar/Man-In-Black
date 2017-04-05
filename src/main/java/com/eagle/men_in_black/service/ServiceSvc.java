package com.eagle.men_in_black.service;

import java.util.HashMap;
import java.util.List;

import com.eagle.men_in_black.model.ServiceDto;

public interface ServiceSvc {

	public List<ServiceDto> do_service_main(HashMap<String, String> map);
	public ServiceDto do_service_detail(int seq);
	public void do_service_reg(HashMap<String, String> map);
	public void do_service_update(HashMap<String, String> map);
	public int do_service_delete(int seq);
	public List<ServiceDto> do_event_main(HashMap<String, String> map); 
	public ServiceDto do_event_detail(int seq);
	public void do_event_reg(HashMap<String, String> map);
	public void do_event_update(HashMap<String, String> map);
	public int do_event_delete(int seq); 
	
}
