package com.eagle.men_in_black.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eagle.men_in_black.model.UserMypageDto;

@Repository
public class UserMypageDaoImpl implements UserMypageDao {

	private final String namespace="com.eagle.repository.mapper.UserMypage";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
		
	@Override
	public UserMypageDto do_search_point(String id) {
		String statement = namespace+".do_search_point";
		return sqlSession.selectOne(statement,id);
	}

	@Override
	public List<UserMypageDto> do_search_coupon(String id) {
		String statement = namespace+".do_search_coupon";
		return sqlSession.selectList(statement,id);
	}

	@Override
	public List<UserMypageDto> do_search_buylist(String id) {
		String statement = namespace+".do_search_buylist";
		return sqlSession.selectList(statement,id);
	}

	@Override
	public List<UserMypageDto> do_search_qna(String id) {
		String statement = namespace+".do_search_qna";
		return sqlSession.selectList(statement,id);
	}

	

}
