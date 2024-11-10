package wyz.jingangHotel02.ssm.service.impl;

import java.util.List;

import wyz.jingangHotel02.ssm.autoPo.User;

public interface UserService{
	public int updateUser(User user);

	public Integer countAllUsers(User user);

	public List<User> selectAllUsers(User user, Integer begin, Integer pageSize);

	public User selectUsersByPhone(String phone);

	public User selectLastMemberid();

	public User selectUserByUserid(String userid);
}
