package wyz.jingangHotel02.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import wyz.jingangHotel02.ssm.autoMapper.HManagerMapper;
import wyz.jingangHotel02.ssm.autoPo.HManager;
import wyz.jingangHotel02.ssm.autoPo.HManagerExample;
import wyz.jingangHotel02.ssm.autoPo.HManagerExample.Criteria;

public class HManagerServiceImpl implements HManagerService {

	@Autowired
	private HManagerMapper hManagerMapper;
	
	@Override
	public HManager selectBySelective(HManager admin) {
		HManagerExample example = new HManagerExample();
		Criteria criteria = example.createCriteria();
		criteria.andAdminidEqualTo(admin.getAdminid());
		criteria.andPasswordEqualTo(admin.getPassword());
		List<HManager> list = hManagerMapper.selectByExample(example);
		if (list==null||list.size()<=0) {
			return null;
		}
		return list.get(0);
	}

	@Override
	public List<HManager> selectAllManager() {
		HManagerExample example = new HManagerExample();
		example.setOrderByClause("adminid");
		return hManagerMapper.selectByExample(example);
	}

	@Override
	public HManager selectAManager(int id) {
		return hManagerMapper.selectByPrimaryKey(id);
	}

	@Override
	public void insertManager(HManager hManager) {
		hManagerMapper.insertSelective(hManager);
	}

	@Override
	public List<HManager> selectManagersByAdminid(String adminid) {
		HManagerExample example = new HManagerExample();
		Criteria criteria = example.createCriteria();
		criteria.andAdminidEqualTo(adminid);
		return hManagerMapper.selectByExample(example);
	}

	@Override
	public int countManager() {
		HManagerExample example = new HManagerExample();
		return hManagerMapper.countByExample(example);
	}

	@Override
	public void updateManager(HManager hManager) {
		hManagerMapper.updateByPrimaryKeySelective(hManager);
	}

	@Override
	public void deleteManager(int id) {
		hManagerMapper.deleteByPrimaryKey(id);
	}

}
