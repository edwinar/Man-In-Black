package com.eagle.men_in_black.service;

import java.util.List;

import com.eagle.men_in_black.model.DetailDto;

public interface DetailSvc {
	//상품 상세정보
	public List<DetailDto> do_selectProductDetail(int PRO_SEQ);
	//상품 칼라 종류
	public List<DetailDto> do_selectProductColor(int PRO_SEQ);
	//상품 사이즈 종류
	public List<DetailDto> do_selectProductSize(int PRO_SEQ);
	//상품 리뷰 리스트
	public List<DetailDto> do_selectProductReviewList(int PRO_SEQ);
	//클릭한 리뷰 디테일
	public DetailDto do_selectReviewDetail(int REV_SEQ);
	//구매팝업 정보
	public List<DetailDto> do_buyProductPop(int PRO_SEQ);
	//구매팝업칼라셀렉트
	public List<DetailDto> do_buyProductColorPop(int PRO_SEQ);
}
