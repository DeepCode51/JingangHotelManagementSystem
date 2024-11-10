package wyz.jingangHotel02.ssm.service.impl;

import java.util.List;

import wyz.jingangHotel02.ssm.autoPo.HManager;

public interface HManagerService {

	public HManager selectBySelective(HManager admin);

	public List<HManager> selectAllManager();

	public HManager selectAManager(int id);

	public void insertManager(HManager hManager);

	public List<HManager> selectManagersByAdminid(String adminid);

	public int countManager();

	public void updateManager(HManager hManager);

	public void deleteManager(int id);

}
