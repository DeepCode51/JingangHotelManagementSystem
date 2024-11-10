package wyz.jingangHotel02.ssm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import wyz.jingangHotel02.ssm.autoMapper.MemberMapper;
import wyz.jingangHotel02.ssm.autoPo.Member;

public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper memberMapper;

	@Override
	public void insertMember(Member member) {
		memberMapper.insertSelective(member);
	}

	@Override
	public void updateMemberRank(Member member) {
		memberMapper.updateByPrimaryKeySelective(member);
	}

	@Override
	public Member selectByMemberid(String memberid) {
		return memberMapper.selectByPrimaryKey(memberid);
	}
	
	
}
