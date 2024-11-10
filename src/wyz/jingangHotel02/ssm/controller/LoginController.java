package wyz.jingangHotel02.ssm.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import wyz.jingangHotel02.ssm.autoPo.HManager;
import wyz.jingangHotel02.ssm.autoPo.User;
import wyz.jingangHotel02.ssm.service.impl.HManagerService;
import wyz.jingangHotel02.ssm.service.impl.LoginService;

@Controller
public class LoginController {

	@Autowired
	private LoginService loginService;

	@Autowired
	private HManagerService hManagerService;
	
	//管理员登陆
	@RequestMapping(value="/mglogin",method={RequestMethod.POST})
	public String mglogin(HttpSession session, String adminid, String password){
		HManager admin = new HManager();
		admin.setAdminid(adminid);
		admin.setPassword(password);
		HManager _admin =  hManagerService.selectBySelective(admin);
		if (_admin==null) {
			return "redirect:managerr/login.jsp?status=error";
		}
		session.setAttribute("admin", _admin);
		return "redirect:managerr/index.jsp";
	}
	
	//管理员退出
	@RequestMapping(value="/mglogout",method={RequestMethod.GET})
	public String mglogout(HttpSession session) {
		session.removeAttribute("admin");
		return "redirect:/managerr/login.jsp";
	}
	
	// 登陆
	@RequestMapping(value="/login",method={RequestMethod.POST})
	public String login(HttpSession session, String phone, String password)
			throws Exception {

		// 调用service进行用户身份验证
		User user = loginService.findUserByPhoneAndPsd(phone, password);
		if (user == null) {
			return "redirect:/jsp/login.jsp?error=error";
		}
		session.setAttribute("user", user);
		return "redirect:/index.jsp";
	}

	// 退出
	@RequestMapping(value="/logout",method={RequestMethod.GET})
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		return "redirect:/jsp/login.jsp";
	}
}
