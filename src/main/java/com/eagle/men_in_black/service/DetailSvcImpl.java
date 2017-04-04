package com.eagle.men_in_black.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eagle.men_in_black.model.DetailDto;
import com.eagle.men_in_black.repository.DetailDao;

@Service
public class DetailSvcImpl implements DetailSvc {
	
	@Autowired
	private DetailDao detailDao;

	@Override
	public List<DetailDto> do_selectProductDetail(int PRO_SEQ) {
		return detailDao.do_selectProductDetail(PRO_SEQ);
	}

	@Override
	public List<DetailDto> do_selectProductColor(int PRO_SEQ) {
		return detailDao.do_selectProductColor(PRO_SEQ);
	}

	@Override
	public List<DetailDto> do_selectProductSize(int PRO_SEQ) {
		return detailDao.do_selectProductSize(PRO_SEQ);
	}

	@Override
	public List<DetailDto> do_selectProductReviewList(int PRO_SEQ) {
		return detailDao.do_selectProductReviewList(PRO_SEQ);
	}

	@Override
	public DetailDto do_selectReviewDetail(int REV_SEQ) {
		return detailDao.do_selectReviewDetail(REV_SEQ);
	}

	@Override
	public List<DetailDto> do_buyProductPop(int PRO_SEQ) {
		return detailDao.do_buyProductPop(PRO_SEQ);
	}

	@Override
	public List<DetailDto> do_buyProductColorPop(int PRO_SEQ) {
		return detailDao.do_buyProductColorPop(PRO_SEQ);
	}

	@Override
	public List<DetailDto> do_buyProductSizePop(HashMap<String, Object> map) {
		return detailDao.do_buyProductSizePop(map);
	}

	@Override
	public String do_buyProductStockPop(HashMap<String, Object> map) {
		return detailDao.do_buyProductStockPop(map);
	}
}
