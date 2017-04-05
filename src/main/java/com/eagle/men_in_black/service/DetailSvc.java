package com.eagle.men_in_black.service;

import java.util.HashMap;
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
	//구매팝업칼라로인한사이즈셀렉트리스트
	public List<DetailDto> do_buyProductSizePop(HashMap<String, Object> map);
	//구매팝업칼라로인한 사이즈로 인한 재고
	public String do_buyProductStockPop(HashMap<String, Object> map);
	//장바구니 추가
	public int do_addBasket(HashMap<String, Object> map);
	//관리자 리뷰 답글 달기
	public int do_insertReviewAdmReply(HashMap<String, Object> map);
}
