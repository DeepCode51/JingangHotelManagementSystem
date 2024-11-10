package wyz.jingangHotel02.ssm.service.impl;

import wyz.jingangHotel02.ssm.autoPo.User;

public interface LoginService {
	public User findUserByPhoneAndPsd(String phone,String password);
}
