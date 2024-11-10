package wyz.jingangHotel02.ssm.service.impl;

import java.util.List;

import wyz.jingangHotel02.ssm.autoMapper.UserMemberRankVo;
import wyz.jingangHotel02.ssm.autoPo.UserMemberRankScore;
import wyz.jingangHotel02.ssm.autoPo.YearStatistics;

public interface UserMemberRankScoreService {
	public List<UserMemberRankScore> findMember(String memberID);
	
	public String findLastUserId();
	
	public int findCountMemberInfo(String memberid);
	
	public List<UserMemberRankScore> findMemberInfoByPage(int begin,int pageSize,String memberid);
	
	public double findDiscountByMemberid(String memberid);

	public List<UserMemberRankScore> selectMembers(UserMemberRankVo vo);

	public Integer countMembers(UserMemberRankVo vo);

	public Integer selectStatistics(YearStatistics statistics);

}
