package wyz.jingangHotel02.ssm.service.impl;

import java.util.List;

import wyz.jingangHotel02.ssm.autoPo.Rank;

public interface RankService {

	public List<Rank> selectRanks();

	public void updateRanks(Rank rank);

}
