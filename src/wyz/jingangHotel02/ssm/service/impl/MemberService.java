package wyz.jingangHotel02.ssm.service.impl;

import wyz.jingangHotel02.ssm.autoPo.Member;

public interface MemberService {

	public void insertMember(Member member);

	public void updateMemberRank(Member member);

	public Member selectByMemberid(String memberid);

}
