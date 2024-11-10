package wyz.jingangHotel02.ssm.autoMapper;

import java.util.List;

import wyz.jingangHotel02.ssm.autoPo.RoomAndType;
import wyz.jingangHotel02.ssm.autoPo.RoomVo;

public interface RoomAndTypeMapper {
	public List<RoomAndType> selectRoomAndTypeWithoutSome(RoomVo roomVo);
	
	public Integer selectCount(RoomVo roomVo);
	
	public List<RoomAndType> selectRooms(RoomVo roomVo);
	
	public Integer countRooms(RoomVo roomVo);
}
