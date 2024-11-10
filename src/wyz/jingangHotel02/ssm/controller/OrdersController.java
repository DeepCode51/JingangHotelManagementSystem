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
import wyz.jingangHotel02.ssm.autoPo.Orders;
import wyz.jingangHotel02.ssm.autoPo.PageBean;
import wyz.jingangHotel02.ssm.autoPo.Score;
import wyz.jingangHotel02.ssm.autoPo.Scoredetail;
import wyz.jingangHotel02.ssm.autoPo.User;
import wyz.jingangHotel02.ssm.autoPo.UserMemberRankScore;
import wyz.jingangHotel02.ssm.service.impl.GoodsService;
import wyz.jingangHotel02.ssm.service.impl.MemberService;
import wyz.jingangHotel02.ssm.service.impl.OrdersService;
import wyz.jingangHotel02.ssm.service.impl.ScoreService;
import wyz.jingangHotel02.ssm.service.impl.ScoredetailService;
import wyz.jingangHotel02.ssm.service.impl.UserService;

@Controller
public class OrdersController {

	@Autowired
	private OrdersService ordersService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private GoodsService goodsService;
	
	@Autowired
	private ScoreService scoreService;
	
	@Autowired
	private ScoredetailService scoredetailService;
	
	//updateOrderStatus
	@RequestMapping(value = "/updateOrderStatus", method = { RequestMethod.GET })
	public String updateOrderStatus(Integer orderid, String status,String userid) {
		Orders _orders = new Orders();
		_orders.setOrderid(orderid);
		_orders.setStatus(status);
		ordersService.updateOrdersStatus(_orders);
		Orders orders = ordersService.findSingleOrdersById(orderid);
		if (status.equals("已入住")) {
			//入住的话，在积分表中加积分
			User user = userService.selectUserByUserid(userid);
			String memberid = user.getMemberid();
			if (memberid!=null&&memberid!="") {
				Member member = memberService.selectByMemberid(memberid);
				String scoreid = member.getScoreid();
				UserMemberRankScore userMemberRankScore = goodsService.prepareforbuy(memberid);
				Integer id = scoreService.selectLastId();
				String detailid = id.toString();
				int num = 4 - detailid.length();
				for (int i = 0; i < 4 - num; i++) {
					detailid = 0 + detailid;
				}
				detailid = "SD"+detailid;
				Date thisTime = new Date();
				Integer restScore = userMemberRankScore.getRestscore()+orders.getTotalprice().intValue();
				Score score = new Score();
				score.setScoreid(scoreid);
				score.setDetailid(detailid);
				score.setOperatetime(thisTime);
				score.setRestscore(restScore);
				score.setStatus("获得");
				scoreService.insert(score);
				Scoredetail scoredetail = new Scoredetail();
				scoredetail.setDetailid(detailid);
				scoredetail.setGoods(0);
				scoredetail.setScore(orders.getTotalprice().intValue());
				scoredetailService.insert(scoredetail);
			}
		}
		return "redirect:managerr/ordermg.jsp?status=fss";
	}
	
	//管理员分页条件查询订单
	@RequestMapping(value = "/selectOrders", method = { RequestMethod.GET })
	public String selectOrders(Model model, String status,int currPage) {
		status=status.trim();
		int pageSize = 5;
		int totalCount = ordersService.countOrdersByStatus(status);
		double num = totalCount;
		Double totalPage = Math.ceil(num / pageSize);
		int begin = (currPage - 1) * pageSize;
		List<Orders> ordersList = ordersService.selectOrdersByStatus(status,begin,pageSize);
		
		PageBean<Orders> ordersPageBean = new PageBean<Orders>(currPage,pageSize,totalCount,totalPage.intValue(),ordersList);
		
		model.addAttribute("ordersPageBean", ordersPageBean);
		model.addAttribute("status", status);
		
		return "managerr/orders";
	}
	
	
	//订单查询功能
	@RequestMapping(value = "/findUserOrders", method = { RequestMethod.GET })
	public String findUserOrders(HttpSession session, Model model, int status,int currPage) {
		String _status = null;
		switch (status) {
		case 1:
			_status = "申请取消";
			break;
		case 2:
			_status = "已取消";
			break;
		case 3:
			_status = "待付款";
			break;
		case 4:
			_status = "已支付";
			break;
		case 5:
			_status = "已入住";
			break;
		case 6:
			_status = "已完成";
			break;
		default:
			break;
		}
		User user = (User) session.getAttribute("user");
		
		int pageSize = 5;
		// 设置总记录数
		int totalCount = ordersService.findUserOrdersCount(user.getUserid(),_status);

		double num = totalCount;
		Double totalPage = Math.ceil(num / pageSize);
		
		int begin = (currPage - 1) * pageSize;
		
		List<Orders> ordersList = ordersService.findUserOrdersPage(
				user.getUserid(), _status,begin,pageSize);
		
		PageBean<Orders> ordersPageBean = new PageBean<Orders>(currPage,pageSize,totalCount,totalPage.intValue(),ordersList);
		
		model.addAttribute("ordersPageBean", ordersPageBean);
		
		model.addAttribute("status", status);
		
		return "jsp/myOrders";
	}
	
	//申请取消订单
	@RequestMapping(value="applyCancelOrder",method={RequestMethod.GET})
	public String applyCancelOrder(Integer orderid){
		Orders orders = ordersService.findSingleOrdersById(orderid);
		orders.setStatus("申请取消");
		ordersService.updateOrdersStatus(orders);
		return "redirect:jsp/success/cancel.jsp";
	}
}
