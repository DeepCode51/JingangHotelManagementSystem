package wyz.jingangHotel02.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import wyz.jingangHotel02.ssm.autoMapper.UserMapper;
import wyz.jingangHotel02.ssm.autoPo.User;
import wyz.jingangHotel02.ssm.autoPo.UserExample;

public class RegisterServiceImpl implements RegisterService{

	@Autowired
	UserMapper userMapper;
	
	@Override
	public int register(User user) {
		UserExample userExample = new UserExample();
		UserExample.Criteria criteria = userExample.createCriteria();
		criteria.andPhoneEqualTo(user.getPhone());
		List<User> list = userMapper.selectByExample(userExample);
		if (list.isEmpty()) {
			int record = userMapper.insertSelective(user);
			return record;
		}
		return -1;
	}

}
