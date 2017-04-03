package com.eagle.men_in_black.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eagle.men_in_black.model.ServiceDto;
import com.sun.mail.imap.protocol.Namespaces.Namespace;

@Repository
public class ServiceDaoImpl implements ServiceDao {

	private final String namespace="com.eagle.repository.mapper.Service";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<ServiceDto> do_service_main(HashMap<String, String> map) {
		String statement = namespace+".do_service_main";
		return sqlSession.selectList(statement, map);
	}

	@Override
	public ServiceDto do_service_detail(int seq) {
		String statement = namespace+".do_service_detail";
		return sqlSession.selectOne(statement, seq);
	}

	@Override
	public void do_service_reg(HashMap<String, String> map) {
		String statement = namespace+".do_service_reg";
		sqlSession.insert(statement,map);
	}

	@Override
	public void do_service_update(HashMap<String, String> map) {
		String statement = namespace+".do_service_update";
		sqlSession.update(statement, map);
		
	}

	@Override
	public int do_service_delete(int seq) {
		String statement = namespace+".do_service_delete";
		return sqlSession.delete(statement, seq);
	}

	
	
	

}
