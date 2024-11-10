package wyz.jingangHotel02.ssm.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

import wyz.jingangHotel02.ssm.autoMapper.UserMemberRankVo;
import wyz.jingangHotel02.ssm.autoPo.Member;
import wyz.jingangHotel02.ssm.autoPo.PageBean;
import wyz.jingangHotel02.ssm.autoPo.Rank;
import wyz.jingangHotel02.ssm.autoPo.User;
import wyz.jingangHotel02.ssm.autoPo.UserMemberRankScore;
import wyz.jingangHotel02.ssm.service.impl.MemberService;
import wyz.jingangHotel02.ssm.service.impl.RankService;
import wyz.jingangHotel02.ssm.service.impl.UserMemberRankScoreService;

@Controller
public class MemberInfoController {
	
	@Autowired
	private UserMemberRankScoreService userMemberRankScoreService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private RankService rankService;
	
	//修改Rank表信息
	@ResponseBody
	@RequestMapping(value = "/updateRanks",method = {RequestMethod.POST},produces="application/json;charset=UTF-8")
	public String updateRanks(int rankid,Double discount){
		Rank rank = new Rank();
		rank.setRankid(rankid);
		rank.setDiscount(discount);
		rankService.updateRanks(rank);
		JSONObject json=new JSONObject();
		json.put("msg", "修改成功！");
		return json.toJSONString();
	}
	
	//查看Rank表信息
	@RequestMapping(value = "/selectRanks",method = {RequestMethod.GET})
	public String fixRank(Model model){
		List<Rank> list = rankService.selectRanks();
		model.addAttribute("list", list);
		return "managerr/discount";
	}
	
	
	//会员个人信息查询
	@RequestMapping(value = "/selectMemberInfo",method = {RequestMethod.GET})
	public String selectMemberInfo(String memberid,Model model,int currPage)throws Exception{
		int pageSize = 5;
			
		int totalCount = userMemberRankScoreService.findCountMemberInfo(memberid);
			
		double num = totalCount;
		Double totalPage = Math.ceil(num / pageSize);
			
		int begin = (currPage - 1) * pageSize;
			
		List<UserMemberRankScore> list = userMemberRankScoreService.findMemberInfoByPage(begin, pageSize, memberid);
			
		PageBean<UserMemberRankScore> pagebean = new PageBean<UserMemberRankScore>(currPage, pageSize, totalCount,
				totalPage.intValue(), list);
			
		model.addAttribute("memberInfoBean", pagebean);
			
		model.addAttribute("memberid", memberid);
		
		return "managerr/memberInfo";
	}
	
	//修改会员等级
	@RequestMapping(value = "/fixRank",method = {RequestMethod.POST})
	public String fixRank(Member member){
		memberService.updateMemberRank(member);
		return "redirect:managerr/membermg.jsp?status=sc";
	}
	
	//分页条件查询会员信息
	@RequestMapping(value = "/selectMembers",method = {RequestMethod.GET})
	public String selectMembers(Model model,Integer currPage,String phone,String username,Integer rankid){
		phone = phone.trim();
		username = username.trim();
		int pageSize = 4;
		
		UserMemberRankVo vo = new UserMemberRankVo();
		vo.setPagesize(2);
		vo.setPhone(phone);
		vo.setRankid(rankid);
		vo.setUsername(username);
		
		Integer totalCount = userMemberRankScoreService.countMembers(vo);
		double num = totalCount;
		Double totalPage = Math.ceil(num / pageSize);
		Integer begin = (currPage - 1) * pageSize;
		
		vo.setBegin(begin);
		vo.setPagesize(pageSize);
		List<UserMemberRankScore> list =userMemberRankScoreService.selectMembers(vo);

		PageBean<UserMemberRankScore> pageBean = new PageBean<UserMemberRankScore>(currPage, pageSize,
				totalCount, totalPage.intValue(), list);
		
		vo.setUsername(username);
		model.addAttribute("vo",vo);
		model.addAttribute("pageBean", pageBean);
		return "managerr/membersinfo";
	}
	
	//会员个人信息查询
	@RequestMapping(value = "/findMemberInfo",method = {RequestMethod.GET})
	public String findMemberInfo(HttpSession session,Model model,int currPage)throws Exception{
		User user = (User)session.getAttribute("user");
		
		int pageSize = 5;
		
		int totalCount = userMemberRankScoreService.findCountMemberInfo(user.getMemberid());
		
		double num = totalCount;
		Double totalPage = Math.ceil(num / pageSize);
		
		int begin = (currPage - 1) * pageSize;
		
		List<UserMemberRankScore> list = userMemberRankScoreService.findMemberInfoByPage(begin, pageSize, user.getMemberid());
		
		PageBean<UserMemberRankScore> pagebean = new PageBean<UserMemberRankScore>(currPage, pageSize, totalCount,
				totalPage.intValue(), list);
		
		model.addAttribute("memberInfoBean", pagebean);
		
		return "jsp/memberInfo";
	}
}
