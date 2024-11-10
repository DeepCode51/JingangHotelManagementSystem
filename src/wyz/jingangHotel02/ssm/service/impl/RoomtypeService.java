package wyz.jingangHotel02.ssm.service.impl;

import java.util.List;

import wyz.jingangHotel02.ssm.autoPo.Roomtype;

public interface RoomtypeService {

	public List<Roomtype> selectAll();

	public void updatePrice(Roomtype roomtype);

}
