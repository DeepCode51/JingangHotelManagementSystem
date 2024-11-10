package wyz.jingangHotel02.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import wyz.jingangHotel02.ssm.autoMapper.UserMapper;
import wyz.jingangHotel02.ssm.autoPo.User;
import wyz.jingangHotel02.ssm.autoPo.UserExample;

public class LoginServiceImpl implements LoginService {
	@Autowired
	private UserMapper userMapper;

	@Override
	public User findUserByPhoneAndPsd(String phone,String password) {
		UserExample userExample = new UserExample();
		UserExample.Criteria criteria = userExample.createCriteria();
		criteria.andPhoneEqualTo(phone);
		criteria.andUserpasswordEqualTo(password);
		List<User> list = userMapper.selectByExample(userExample);
		if (list.isEmpty()) {
			return null;
		}else {
			User user = list.get(0);
			return user;
		}
	}

}
