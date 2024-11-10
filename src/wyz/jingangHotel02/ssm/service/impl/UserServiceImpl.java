package wyz.jingangHotel02.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import wyz.jingangHotel02.ssm.autoMapper.UserMapper;
import wyz.jingangHotel02.ssm.autoPo.User;
import wyz.jingangHotel02.ssm.autoPo.UserExample;
import wyz.jingangHotel02.ssm.autoPo.UserExample.Criteria;

public class UserServiceImpl implements UserService{

	@Autowired
	private UserMapper userMapper;

	@Override
	public int updateUser(User user) {
		return userMapper.updateByPrimaryKeySelective(user);
	}

	@Override
	public Integer countAllUsers(User user) {
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		if (user.getPhone()!=null && user.getPhone().length()>0) {
			criteria.andPhoneEqualTo(user.getPhone());
		}
		if (user.getSex()!=null && user.getSex().length()>0) {
			criteria.andSexEqualTo(user.getSex());
		}
		if (user.getUsername()!=null && user.getUsername().length()>0) {
			criteria.andUsernameLike("%"+user.getUsername()+"%");
		}
		return userMapper.countByExample(example);
	}

	@Override
	public List<User> selectAllUsers(User user, Integer begin, Integer pageSize) {
		UserExample example = new UserExample();
		example.setOrderByClause("userid limit "+begin+","+pageSize);
		Criteria criteria = example.createCriteria();
		if (user.getPhone()!=null && user.getPhone().length()>0) {
			criteria.andPhoneEqualTo(user.getPhone());
		}
		if (user.getSex()!=null && user.getSex().length()>0) {
			criteria.andSexEqualTo(user.getSex());
		}
		if (user.getUsername()!=null && user.getUsername().length()>0) {
			criteria.andUsernameLike("%"+user.getUsername()+"%");
		}
		return userMapper.selectByExample(example);
	}

	@Override
	public User selectUsersByPhone(String phone) {
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andPhoneEqualTo(phone);
		List<User> list = userMapper.selectByExample(example);
		if (list!=null && list.size()>0) {
			return list.get(0);
		}else {
			return null;
		}
	}

	@Override
	public User selectLastMemberid() {
		UserExample example = new UserExample();
		example.setOrderByClause("memberid desc limit 1");
		Criteria criteria = example.createCriteria();
		criteria.andMemberidIsNotNull();
		List<User> list = userMapper.selectByExample(example);
		if (list!=null && list.size()>0 ) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public User selectUserByUserid(String userid) {
		return userMapper.selectByPrimaryKey(userid);
	}

}
