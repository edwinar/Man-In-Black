package com.eagle.men_in_black.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eagle.men_in_black.model.CategoryDto;
import com.eagle.men_in_black.repository.CategoryDao;

@Service
public class CategorySvcImpl implements CategorySvc {
	
	@Autowired
	private CategoryDao categoryDao;
	
	@Override
	public List<CategoryDto> do_selectCategoryProductList(HashMap<String, String> map) {
		return categoryDao.do_selectCategoryProductList(map);
	}
}
