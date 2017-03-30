package com.eagle.men_in_black.repository;

import java.util.HashMap;
import java.util.List;

import com.eagle.men_in_black.model.CategoryDto;

public interface CategoryDao {
	public List<CategoryDto> do_selectCategoryProductList(HashMap<String, String> map);
	}
