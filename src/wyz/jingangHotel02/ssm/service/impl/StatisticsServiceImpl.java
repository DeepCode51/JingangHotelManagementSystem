package wyz.jingangHotel02.ssm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import wyz.jingangHotel02.ssm.autoPo.YearStatistics;

public class StatisticsServiceImpl implements StatisticsService {

	@Autowired
	private UserMemberRankScoreService userMemberRankScoreService;
	
	@Override
	public Integer selectStatistics(YearStatistics statistics) {
		return userMemberRankScoreService.selectStatistics(statistics);
	}

}
