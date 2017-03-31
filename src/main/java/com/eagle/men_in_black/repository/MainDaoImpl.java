package com.eagle.men_in_black.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.eagle.men_in_black.model.MainDto;

@Repository
public class MainDaoImpl implements MainDao {

	private final String namespace="com.eagle.repository.mapper.Main";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public MainDto do_search_pw(String id) {
		String statement = namespace+".do_search_pw";
		return sqlSession.selectOne(statement,id);
	}

	@Override
	public MainDto do_search_email(String email) {
		String statement = namespace+".do_search_email";
		return sqlSession.selectOne(statement,email);
	}

	

}
