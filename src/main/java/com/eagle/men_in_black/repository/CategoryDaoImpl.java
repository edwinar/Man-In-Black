package com.eagle.men_in_black.repository;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eagle.men_in_black.model.CategoryDto;

@Repository
public class CategoryDaoImpl implements CategoryDao {


	private final String namespace="com.eagle.repository.mapper.Category";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<CategoryDto> do_selectCategoryProductList(HashMap<String, String> map) {
		String statement = namespace+".do_selectCategoryProductList";
		return sqlSession.selectList(statement,map);
	}
	
}
