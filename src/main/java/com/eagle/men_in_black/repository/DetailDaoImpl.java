package com.eagle.men_in_black.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eagle.men_in_black.model.DetailDto;

@Repository
public class DetailDaoImpl implements DetailDao {
	private final String namespace="com.eagle.repository.mapper.Detail";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<DetailDto> do_selectProductDetail(int PRO_SEQ) {
		String statement = namespace+".do_selectProductDetail";
		return sqlSession.selectList(statement, PRO_SEQ);
	}

	@Override
	public List<DetailDto> do_selectProductColor(int PRO_SEQ) {
		String statement = namespace+".do_selectProductColor";
		return sqlSession.selectList(statement, PRO_SEQ);
	}

	@Override
	public List<DetailDto> do_selectProductSize(int PRO_SEQ) {
		String statement = namespace+".do_selectProductSize";
		return sqlSession.selectList(statement, PRO_SEQ);
	}
}
