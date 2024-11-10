package wyz.jingangHotel02.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import wyz.jingangHotel02.ssm.autoMapper.RoomtypeMapper;
import wyz.jingangHotel02.ssm.autoPo.Roomtype;
import wyz.jingangHotel02.ssm.autoPo.RoomtypeExample;

public class RoomtypeServiceImpl implements RoomtypeService {

	@Autowired
	private RoomtypeMapper roomtypeMapper;
	
	@Override
	public List<Roomtype> selectAll() {
		RoomtypeExample example = new RoomtypeExample();
		return roomtypeMapper.selectByExample(example);
	}

	@Override
	public void updatePrice(Roomtype roomtype) {
		roomtypeMapper.updateByPrimaryKeySelective(roomtype);
	}

}
