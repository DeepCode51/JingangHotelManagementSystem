package wyz.jingangHotel02.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import wyz.jingangHotel02.ssm.autoMapper.UserMemberRankScoreMapper;
import wyz.jingangHotel02.ssm.autoMapper.UserMemberRankVo;
import wyz.jingangHotel02.ssm.autoPo.Example;
import wyz.jingangHotel02.ssm.autoPo.UserMemberRankScore;
import wyz.jingangHotel02.ssm.autoPo.YearStatistics;

public class UserMemberRankScoreServiceImpl implements UserMemberRankScoreService {

	@Autowired
	private UserMemberRankScoreMapper userMemberRankScoreMapper;
	
	@Override
	public List<UserMemberRankScore> findMember(String memberID) {
		List<UserMemberRankScore> list = userMemberRankScoreMapper.findMemberInfo(memberID);
		return list;
	}

	@Override
	public String findLastUserId() {
		String lastUserId = userMemberRankScoreMapper.findLastUserId();
		return lastUserId;
	}

	@Override
	public int findCountMemberInfo(String memberid) {
		return userMemberRankScoreMapper.findCountMemberInfo(memberid);
	}

	@Override
	public List<UserMemberRankScore> findMemberInfoByPage(int begin,
			int pageSize,String memberid) {
		Example example = new Example();
		example.setBegin(begin);
		example.setPagesize(pageSize);
		example.setMemberid(memberid);
		return userMemberRankScoreMapper.findMemberInfoByPage(example);
	}

	@Override
	public double findDiscountByMemberid(String memberid) {
		return userMemberRankScoreMapper.findDiscountBymemberid(memberid);
	}

	@Override
	public List<UserMemberRankScore> selectMembers(UserMemberRankVo vo) {
		if (vo.getUsername()!=null && vo.getUsername()!="") {
			vo.setUsername("%"+vo.getUsername()+"%");
		}
		return userMemberRankScoreMapper.selectMembers(vo);
	}

	@Override
	public Integer countMembers(UserMemberRankVo vo) {
		if (vo.getUsername()!=null && vo.getUsername()!="") {
			vo.setUsername("%"+vo.getUsername()+"%");
		}
		return userMemberRankScoreMapper.countMembers(vo);
	}

	@Override
	public Integer selectStatistics(YearStatistics statistics) {
		return userMemberRankScoreMapper.selectStatistics(statistics);
	}

}
