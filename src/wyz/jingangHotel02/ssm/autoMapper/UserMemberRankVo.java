package wyz.jingangHotel02.ssm.autoMapper;

public class UserMemberRankVo {
	private String userid;
	private String phone;
	private String username;
	private Integer rankid;
	private String rank;
	private Integer begin;
	private Integer pagesize;

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Integer getRankid() {
		return rankid;
	}

	public void setRankid(Integer rankid) {
		this.rankid = rankid;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public Integer getBegin() {
		return begin;
	}

	public void setBegin(Integer begin) {
		this.begin = begin;
	}

	public Integer getPagesize() {
		return pagesize;
	}

	public void setPagesize(Integer pagesize) {
		this.pagesize = pagesize;
	}

}
