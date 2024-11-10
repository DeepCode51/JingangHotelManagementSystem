package wyz.jingangHotel02.ssm.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import wyz.jingangHotel02.ssm.autoPo.Member;
import wyz.jingangHotel02.ssm.autoPo.PageBean;
import wyz.jingangHotel02.ssm.autoPo.Score;
import wyz.jingangHotel02.ssm.autoPo.Scoredetail;
import wyz.jingangHotel02.ssm.autoPo.User;
import wyz.jingangHotel02.ssm.service.impl.MemberService;
import wyz.jingangHotel02.ssm.service.impl.ScoreService;
import wyz.jingangHotel02.ssm.service.impl.ScoredetailService;
import wyz.jingangHotel02.ssm.service.impl.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ScoreService scoreService;
	
	@Autowired
	private ScoredetailService scoredetailService;
	
	//管理员将用户升级为会员
	@RequestMapping(value="/updateUserToMember",method={RequestMethod.GET})
	public String updateUserToMember(String userid){
		//排序获取最后一名会员的memberid
		User last = userService.selectLastMemberid();
		String memberid = "";
		String scoreid = "";
		if (last==null) {
			memberid = "HY0001";
		}else {
			String mid = last.getMemberid();
			mid = mid.substring(2);
			mid = Integer.parseInt(mid)+1+"";
			int num = 4 - mid.length();
			for (int i = 0; i < num; i++) {
				mid = "0"+mid;
			}
			memberid = "HY"+mid;
			scoreid = "S" + mid;
		}
		User user = new User();
		user.setUserid(userid);
		user.setMemberid(memberid);
		userService.updateUser(user);
		Member member = new Member();
		member.setMemberid(memberid);
		member.setRank(1);
		member.setScoreid(scoreid);
		memberService.insertMember(member);
		Integer lastscoreid = scoreService.selectLastId()+1;
		System.out.println(lastscoreid);
		String detailid = lastscoreid.toString();
		int num = 4 - lastscoreid.toString().length();
		System.out.println(num);
		for (int i = 0; i < num; i++) {
			detailid = "0"+ detailid;
		}
		detailid = "SD" + detailid;
		Score score = new Score();
		score.setScoreid(scoreid);
		score.setOperatetime(new Date());
		score.setStatus("获得");
		score.setRestscore(500);
		score.setDetailid(detailid);
		scoreService.insert(score);
		Scoredetail scoredetail = new Scoredetail();
		scoredetail.setDetailid(detailid);
		scoredetail.setNumber(1);
		scoredetail.setGoods(0);
		scoredetail.setScore(500);
		scoredetailService.insert(scoredetail);
		
		return "redirect:managerr/usermg.jsp?status=uc";
	}
	
	//管理员修改用户信息
	@RequestMapping(value="/updateUserByManager",method={RequestMethod.POST})
	public String updateUserByManager(User user){
		User _user = userService.selectUsersByPhone(user.getPhone().trim());
		if (_user!=null) {
			if (!user.getUserid().equals(_user.getUserid())) {
				return "redirect:managerr/usermg.jsp?status=sp";
			}
		}
		userService.updateUser(user);
		return "redirect:managerr/usermg.jsp?status=sc";
	}
	
	//管理员分页查询用户信息
	@RequestMapping(value="/selectAllUsers",method={RequestMethod.GET})
	public String selectAllUsers(Model model,Integer currPage,String username ,String phone,String sex){
		Integer pageSize = 5;
		User user = new User();
		user.setUsername(username.trim());
		user.setPhone(phone.trim());
		if (sex.trim().equals("0")) {
			user.setSex(null);
		}else {
			user.setSex(sex.trim());
		}
		
		Integer totalCount = userService.countAllUsers(user);
		double num = totalCount;
		Double totalPage = Math.ceil(num / pageSize);
		
		Integer begin = (currPage - 1) * pageSize;
		
		List<User> list = userService.selectAllUsers(user,begin,pageSize);
		
		PageBean<User> pageBean = new PageBean<User>(currPage, pageSize, totalCount, totalPage.intValue(), list);
		
		model.addAttribute("pageBean", pageBean);
		model.addAttribute("_user", user);
		
		return "managerr/usersinfo";
	}
	
	
	//用户修改用户信息
	@RequestMapping(value="/updateUser",method={RequestMethod.POST})
	public String updateUser(HttpSession session,String sex ,String phone,String email,Date birthday) throws Exception{
		User user = (User)session.getAttribute("user");
		if (!user.getPhone().equals(phone.trim())) {
			User _user = userService.selectUsersByPhone(phone.trim());
			if (_user != null) {
				return "redirect:/jsp/personInfo/personInfo.jsp?status=fail";
			}
		}
		if (!sex.trim().equals("0")) {
			user.setSex(sex.trim());			
		}
		user.setPhone(phone);
		user.setEmail(email.trim());
		user.setBirthday(birthday);
		int record = userService.updateUser(user);
		if (record == 1) {
			session.setAttribute("user", user);
			return "redirect:/jsp/personInfo/personInfo.jsp?status=success";
		}
		return "redirect:/jsp/personInfo/personInfo.jsp?status=fail";
	}
}
