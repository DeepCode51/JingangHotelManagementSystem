package wyz.jingangHotel02.ssm.service.impl;

import wyz.jingangHotel02.ssm.autoPo.Score;

public interface ScoreService {
	public int insert(Score score);

	public int selectLastId();
}
