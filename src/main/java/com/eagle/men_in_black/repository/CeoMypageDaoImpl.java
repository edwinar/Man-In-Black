package com.eagle.men_in_black.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eagle.men_in_black.model.CeoMypageDto;
@Repository
public class CeoMypageDaoImpl implements CeoMypageDao {

	private final String namespace="com.eagle.repository.mapper.CeoMypage";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public List<CeoMypageDto> do_ceomypage_main(HashMap<String, String> map) {
		String statement = namespace+".do_ceomypage_main";
		return sqlSession.selectList(statement, map);
	}


	@Override
	public int do_insert_photo(Map<String, Object> map) {
		String statement = namespace+".do_insert_photo";
		return sqlSession.insert(statement, map);
	}

}
