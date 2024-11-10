package wyz.jingangHotel02.ssm.service.impl;

import wyz.jingangHotel02.ssm.autoPo.Room;


public interface RoomService {

	public Room selectARoom(String roomid);

	public void updateRoom(Room record, String roomid);

	public Room selectRoomByRoomid(String roomid);

	public void insertRoom(Room room);
	
}
