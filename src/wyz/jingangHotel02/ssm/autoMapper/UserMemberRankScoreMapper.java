package wyz.jingangHotel02.ssm.autoMapper;

import java.util.List;

import wyz.jingangHotel02.ssm.autoPo.UserMemberRankScore;
import wyz.jingangHotel02.ssm.autoPo.Example;
import wyz.jingangHotel02.ssm.autoPo.YearStatistics;

public interface UserMemberRankScoreMapper {
	public List<UserMemberRankScore> findMemberInfo(String memberID);
	
	public List<UserMemberRankScore> findMemberInfoByPage(Example example);
	
	public String findLastUserId();
	
	public UserMemberRankScore prepareforbuy(String memberID);
	
	public Integer findCountMemberInfo(String memberID);
	
	public double findDiscountBymemberid(String memberID);

	public List<UserMemberRankScore> selectMembers(UserMemberRankVo vo);

	public Integer countMembers(UserMemberRankVo vo);
	
	public Integer selectStatistics(YearStatistics statistics);
	
	public String selectDetailId();
}
