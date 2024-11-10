package wyz.jingangHotel02.ssm.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

import wyz.jingangHotel02.ssm.autoPo.CommentsWithBLOBs;
import wyz.jingangHotel02.ssm.autoPo.Orders;
import wyz.jingangHotel02.ssm.autoPo.OrdersCommentsVo;
import wyz.jingangHotel02.ssm.autoPo.PageBean;
import wyz.jingangHotel02.ssm.autoPo.User;
import wyz.jingangHotel02.ssm.autoPo.UserCommemts;
import wyz.jingangHotel02.ssm.autoPo.UserCommemtsVo;
import wyz.jingangHotel02.ssm.service.impl.CommentsService;
import wyz.jingangHotel02.ssm.service.impl.OrdersCommentsService;
import wyz.jingangHotel02.ssm.service.impl.OrdersService;

@Controller
public class CommentsController {

	@Autowired
	private OrdersService ordersService;
	
	@Autowired
	private OrdersCommentsService ordersCommentsService;
	
	@Autowired
	private CommentsService commentsService;
	
	//管理员审核评价
	@ResponseBody
	@RequestMapping(value = "/updateComment", method = { RequestMethod.POST },produces="application/json;charset=UTF-8")
	public String updateComment(Integer id,String status,String reply) {
		CommentsWithBLOBs commentsWithBLOBs = new CommentsWithBLOBs();
		commentsWithBLOBs.setId(id);
		commentsWithBLOBs.setStatus(status);
		commentsWithBLOBs.setCommentreply(reply);
		commentsService.updateComment(commentsWithBLOBs);
		JSONObject json=new JSONObject();
		json.put("msg", "操作成功！");
		return json.toJSONString();
	}
	
	//分页查询此用户条件查询的评论
	@RequestMapping(value = "/selectComments", method = { RequestMethod.GET })
	public String selectComments(Model model,String status,int currPage) {
		int pageSize = 3;
		int totalCount = commentsService.countCommentsByStatus(status);
		double num = totalCount;
		Double totalPage = Math.ceil(num / pageSize);
		int begin = (currPage - 1) * pageSize;
		
		List<CommentsWithBLOBs> list = commentsService.selectCommentsByStatus(status,begin,pageSize);
		
		PageBean<CommentsWithBLOBs> pageBean = new PageBean<CommentsWithBLOBs>(currPage, pageSize, totalCount, totalPage.intValue(), list);

		model.addAttribute("cPageBean", pageBean);
		
		model.addAttribute("comstatus", status);
		
		return "managerr/comments";
	}
	
	//分页查询所有的已完成订单所对应的已通过的评论
	@RequestMapping(value = "/findTotalComments", method = { RequestMethod.GET })
	public String findTotalComments(Model model,int currPage) {
		
		OrdersCommentsVo ordersCommentsVo = new OrdersCommentsVo();
		ordersCommentsVo.setOrdersstatus("已完成");
		ordersCommentsVo.setCommentsstatus("已通过");
		
		// 设置每页条数
		int pageSize = 3;
		
		int totalCount = ordersCommentsService.selectCountAllComments(ordersCommentsVo);
		
		double num = totalCount;
		Double totalPage = Math.ceil(num / pageSize);
		
		int begin = (currPage - 1) * pageSize;
		
		ordersCommentsVo.setBegin(begin);
		ordersCommentsVo.setPageSize(pageSize);
		
		List<UserCommemts> list = ordersCommentsService.selectAllCommentsByPage(ordersCommentsVo);
		
		List<UserCommemtsVo> list2 = new ArrayList<UserCommemtsVo>();
		
		for (UserCommemts userCommemts : list) {
			String phone = userCommemts.getPhone();
			phone = phone.substring(0, 3) + "****" + phone.substring(7, phone.length());
			userCommemts.setPhone(phone);
		}
		
		for (int i = 0; i < list.size(); i++) {
			UserCommemtsVo userCommemtsVo = new UserCommemtsVo();
			UserCommemts userCommemts = list.get(i);
			userCommemtsVo.setUserCommemts(userCommemts);
			String imgs = userCommemtsVo.getUserCommemts().getImg();
			if (imgs!=null) {
				String[] imgArr = imgs.split(";");
				List<String> l = new ArrayList<String>();
				for (int j = 0; j < imgArr.length; j++) {
					if (imgArr[j]!=null) {
						l.add(imgArr[j]);						
					}
				}
				userCommemtsVo.setList(l);
			}
			list2.add(userCommemtsVo);
		}
		
		PageBean<UserCommemtsVo> pageBean = new PageBean<UserCommemtsVo>(currPage, pageSize, totalCount, totalPage.intValue(), list2);
		
		//求宾馆总评价
		List<UserCommemts> ulist = ordersCommentsService.selectAllComments(ordersCommentsVo);
		
		double sum = 0;
		
		for (UserCommemts userCommemts : ulist) {
			Double score = userCommemts.getScore();
			sum += score;
		}
		
		model.addAttribute("avgScore", (double) Math.round(sum/totalCount * 10) / 10);
		
		model.addAttribute("tPageBean", pageBean);
		
		return "jsp/comment";
	}

	//分页查询此用户条件查询的评论
	@RequestMapping(value = "/findMyCommemts", method = { RequestMethod.GET })
	public String findMyCommemts(Model model, HttpSession session,
			int comstatus,int currPage) {
		User user = (User) session.getAttribute("user");
		String commentsstatus = null;
		switch (comstatus) {
		case 0:
			commentsstatus = "已通过";
			break;
		case 1:
			commentsstatus = "待审核";
			break;
		case 2:
			commentsstatus = "未通过";
			break;
		default:
			commentsstatus ="";
			break;
		}
		String status = "已完成";
		OrdersCommentsVo ordersCommentsVo = new OrdersCommentsVo();
		ordersCommentsVo.setUserid(user.getUserid());
		ordersCommentsVo.setOrdersstatus(status);
		ordersCommentsVo.setCommentsstatus(commentsstatus);
		
		int pageSize = 3;
		
		int totalCount = ordersCommentsService.selectCountUserComments(ordersCommentsVo);
		
		double num = totalCount;
		Double totalPage = Math.ceil(num / pageSize);
		
		int begin = (currPage - 1) * pageSize;
		
		ordersCommentsVo.setBegin(begin);
		ordersCommentsVo.setPageSize(pageSize);
		
		List<CommentsWithBLOBs> list = ordersCommentsService
				.selectUserCommentsByPage(ordersCommentsVo);
		
		PageBean<CommentsWithBLOBs> pageBean = new PageBean<CommentsWithBLOBs>(currPage, pageSize, totalCount, totalPage.intValue(), list);
		
		model.addAttribute("cPageBean", pageBean);
		
		model.addAttribute("comstatus", comstatus);
		
		return "jsp/myComments";
	}
	
	//查询订单没有的评论以便于用户去评论
	@RequestMapping(value="findNotComments", method={RequestMethod.GET })
	public String findNotComments(HttpSession session,Model model){
		User user =(User) session.getAttribute("user");
		Date thisDay = new Date();
		long time = thisDay.getTime();
		time = time - 7*1000*60*60*24;
		thisDay.setTime(time);
		Orders orders =new  Orders();
		orders.setUserid(user.getUserid());
		orders.setDateofdeparture(thisDay);
		orders.setStatus("已完成");
		List<Orders> notCommentsOrdersList = ordersService.findNotComments(orders);
		model.addAttribute("notCommentsOrdersList", notCommentsOrdersList);
		return "jsp/addcomments";
	}
	
	//添加评论
	@Transactional
	@RequestMapping(value="addComment",method={RequestMethod.POST})
	public String addComment(int orderid,Double score,String commetcontent){
		if (score==-1) {
			return "";
		}
		int index1 = ordersService.addCommentId(orderid);
		if (index1!=1) {
			throw new RuntimeException();
		}
		CommentsWithBLOBs comment = new CommentsWithBLOBs();
		comment.setId(orderid);
		comment.setCommenttime(new Date());
		comment.setScore(score);
		comment.setCommetcontent(commetcontent);
		int index2 = commentsService.insertComment(comment);
		if (index2!=1) {
			throw new RuntimeException();
		}
		return "jsp/comments";
	}
}
