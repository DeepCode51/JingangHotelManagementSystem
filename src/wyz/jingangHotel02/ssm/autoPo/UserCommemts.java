package wyz.jingangHotel02.ssm.autoPo;

public class UserCommemts extends CommentsWithBLOBs {
	private String phone;
	
	private String userid;
	
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

}
