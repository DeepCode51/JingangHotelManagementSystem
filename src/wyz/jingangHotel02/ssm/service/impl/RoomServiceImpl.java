package wyz.jingangHotel02.ssm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import wyz.jingangHotel02.ssm.autoMapper.RoomMapper;
import wyz.jingangHotel02.ssm.autoPo.Room;
import wyz.jingangHotel02.ssm.autoPo.RoomExample;
import wyz.jingangHotel02.ssm.autoPo.RoomExample.Criteria;

public class RoomServiceImpl implements RoomService {

	@Autowired
	private RoomMapper roomMapper;

	@Override
	public Room selectARoom(String roomid) {
		return roomMapper.selectByPrimaryKey(roomid);
	}

	@Override
	public void updateRoom(Room record, String roomid) {
		RoomExample example = new RoomExample();
		Criteria criteria = example.createCriteria();
		criteria.andRoomidEqualTo(roomid);
		roomMapper.updateByExampleSelective(record, example);
	}

	@Override
	public Room selectRoomByRoomid(String roomid) {
		return roomMapper.selectByPrimaryKey(roomid);
	}

	@Override
	public void insertRoom(Room room) {
		roomMapper.insertSelective(room);
	}
}
