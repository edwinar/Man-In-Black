package com.eagle.men_in_black.repository;

import java.util.List;

import com.eagle.men_in_black.model.DetailDto;

public interface DetailDao {
	//상품 상세정보
	public List<DetailDto> do_selectProductDetail(int PRO_SEQ);
}
