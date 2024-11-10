package wyz.jingangHotel02.ssm.autoPo;

import java.util.List;

public class RoomVo {
	public Integer begin;

	public Integer pagesize;

	public String roomid;

	public List<String> roomlist;

	public Integer roomtypeid;

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

	public String getRoomid() {
		return roomid;
	}

	public void setRoomid(String roomid) {
		this.roomid = roomid;
	}

	public List<String> getRoomlist() {
		return roomlist;
	}

	public void setRoomlist(List<String> roomlist) {
		this.roomlist = roomlist;
	}

	public Integer getRoomtypeid() {
		return roomtypeid;
	}

	public void setRoomtypeid(Integer roomtypeid) {
		this.roomtypeid = roomtypeid;
	}

}
