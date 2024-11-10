package wyz.jingangHotel02.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import wyz.jingangHotel02.ssm.autoMapper.RankMapper;
import wyz.jingangHotel02.ssm.autoPo.Rank;
import wyz.jingangHotel02.ssm.autoPo.RankExample;

public class RankServiceImpl implements RankService {

	@Autowired
	private RankMapper rankMapper;

	@Override
	public List<Rank> selectRanks() {
		RankExample example = new RankExample();
		return rankMapper.selectByExample(example);
	}

	@Override
	public void updateRanks(Rank rank) {
		rankMapper.updateByPrimaryKeySelective(rank);
	}
	
}
