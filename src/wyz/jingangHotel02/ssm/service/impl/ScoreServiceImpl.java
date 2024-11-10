package wyz.jingangHotel02.ssm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import wyz.jingangHotel02.ssm.autoMapper.ScoreMapper;
import wyz.jingangHotel02.ssm.autoPo.Score;
import wyz.jingangHotel02.ssm.autoPo.ScoreExample;

public class ScoreServiceImpl implements ScoreService {

	@Autowired
	private ScoreMapper scoreMapper;
	
	@Override
	public int insert(Score score) {
		return scoreMapper.insertSelective(score);
	}

	@Override
	public int selectLastId() {
		ScoreExample example = new ScoreExample();
		return scoreMapper.countByExample(example);
	}

}
