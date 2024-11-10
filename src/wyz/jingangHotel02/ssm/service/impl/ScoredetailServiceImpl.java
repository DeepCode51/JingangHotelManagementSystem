package wyz.jingangHotel02.ssm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import wyz.jingangHotel02.ssm.autoMapper.ScoredetailMapper;
import wyz.jingangHotel02.ssm.autoPo.Scoredetail;

public class ScoredetailServiceImpl implements ScoredetailService {

	@Autowired
	private ScoredetailMapper scoredetailMapper;
	
	@Override
	public int insert(Scoredetail scoredetail) {
		return scoredetailMapper.insertSelective(scoredetail);
	}

}
