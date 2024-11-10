package wyz.jingangHotel02.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import wyz.jingangHotel02.ssm.autoMapper.RoomAndTypeMapper;
import wyz.jingangHotel02.ssm.autoPo.RoomAndType;
import wyz.jingangHotel02.ssm.autoPo.RoomVo;

public class RoomAndTypeServiceImpl implements RoomAndTypeService {

	@Autowired
	private RoomAndTypeMapper roomAndTypeMapper;

	@Override
	public List<RoomAndType> selectRoomAndTypeWithoutSome(RoomVo roomVo) {
		return roomAndTypeMapper.selectRoomAndTypeWithoutSome(roomVo);
	}

	@Override
	public Integer selectCount(RoomVo roomVo) {
		return roomAndTypeMapper.selectCount(roomVo);
	}

	@Override
	public List<RoomAndType> queryRoomByPage(RoomVo roomVo, int begin,int pageSize) {
		List<RoomAndType> totalList = selectRoomAndTypeWithoutSome(roomVo);
		int end = begin+pageSize;
		if (end>totalList.size()-1) {
			end = totalList.size();
		}
		List<RoomAndType> list = totalList.subList(begin, end);
		return list;
	}

	@Override
	public int countRooms(RoomVo roomVo) {
		return roomAndTypeMapper.countRooms(roomVo);
	}

	@Override
	public List<RoomAndType> selectRooms(RoomVo roomVo) {
		return roomAndTypeMapper.selectRooms(roomVo);
	}

}
