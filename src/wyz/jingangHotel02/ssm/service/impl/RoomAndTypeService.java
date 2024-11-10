package wyz.jingangHotel02.ssm.service.impl;

import java.util.List;

import wyz.jingangHotel02.ssm.autoPo.RoomAndType;
import wyz.jingangHotel02.ssm.autoPo.RoomVo;

public interface RoomAndTypeService {
	public List<RoomAndType> selectRoomAndTypeWithoutSome(RoomVo roomVo);
	
	public Integer selectCount(RoomVo roomVo);
	
	public List<RoomAndType> queryRoomByPage(RoomVo roomVo ,int begin,int pageSize);

	public int countRooms(RoomVo roomVo);

	public List<RoomAndType> selectRooms(RoomVo roomVo);
}
