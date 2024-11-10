package wyz.jingangHotel02.ssm.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import wyz.jingangHotel02.ssm.autoPo.Orders;
import wyz.jingangHotel02.ssm.autoPo.PageBean;
import wyz.jingangHotel02.ssm.autoPo.RoomAndType;
import wyz.jingangHotel02.ssm.autoPo.RoomVo;
import wyz.jingangHotel02.ssm.autoPo.User;
import wyz.jingangHotel02.ssm.service.impl.OrdersService;
import wyz.jingangHotel02.ssm.service.impl.RoomAndTypeService;
import wyz.jingangHotel02.ssm.service.impl.UserMemberRankScoreService;

@Controller
public class OrderRoomController {

	@Autowired
	private OrdersService ordersService;

	@Autowired
	private RoomAndTypeService roomAndTypeService;
	
	@Autowired
	private UserMemberRankScoreService userMemberRankScoreService;

	// 按用户输入条件分页查询房间
	@RequestMapping(value = "/queryRoomsSpecail", method = { RequestMethod.GET })
	public String queryRoomsSpecail(Model model, Date dateOfStay,
			Date dateOfDeparture, Integer roomtypeid, Integer currPage) {
		//日期校验
		if (dateOfStay.getTime() < (getStartTime().getTime())||dateOfDeparture.getTime() <= dateOfStay.getTime()) {
			return "redirect:/jsp/orderRoom.jsp?error=error";
		}
		
		// 查询没有与所选时间冲突的客房id
		List<String> roomFirst = ordersService.findByFirstWay(dateOfStay);
		List<String> roomSecond = ordersService
				.findBySecondWay(dateOfDeparture);
		List<String> roomThird = ordersService.findByThirdWay(dateOfStay,
				dateOfDeparture);
		roomFirst.addAll(roomSecond);
		roomFirst.addAll(roomThird);
		List<String> roomID = new ArrayList<String>();
		if (!roomFirst.isEmpty()) {
			for (String room : roomFirst) {
				if (!roomID.contains(room)) {
					roomID.add(room);
				}
			}
		}
		// 将所查的所有客房id和所要查的客房类型包装到包装类中
		RoomVo roomVo = new RoomVo();
		roomVo.setRoomlist(roomID);
		roomVo.setRoomtypeid(roomtypeid);
		// 查询除此些id的所有客房

		// 设置每页条数
		int pageSize = 5;

		// 设置总记录数
		int totalCount = roomAndTypeService.selectCount(roomVo);

		double num = totalCount;
		Double totalPage = Math.ceil(num / pageSize);

		int begin = (currPage - 1) * pageSize;

		List<RoomAndType> roomAndTypeList = roomAndTypeService.queryRoomByPage(
				roomVo, begin, pageSize);

		PageBean<RoomAndType> pageBean = new PageBean<RoomAndType>(currPage,
				pageSize, totalCount, totalPage.intValue(), roomAndTypeList);

		//将数据传到页面
		model.addAttribute("roomPageBean", pageBean);
		model.addAttribute("roomList", roomAndTypeList);
		model.addAttribute("dateOfStay", dateToString(dateOfStay));
		model.addAttribute("dateOfDeparture", dateToString(dateOfDeparture));
		model.addAttribute("roomtypeid", roomtypeid);
		return "jsp/queryRooms";
	}

	// 生成订单
	@Transactional
	@RequestMapping(value = "/generateOrders", method = { RequestMethod.POST })
	public String generateOrders(HttpSession session, Date dateOfStay,
			Date dateOfDeparture, String roomid, double price) {
		User user = (User) session.getAttribute("user");
		String status = "已支付";
		Date thisTime = new Date();
		int days = calDays(dateOfStay, dateOfDeparture);
		//查看是否为会员，是的话算上折扣
		double discount = 1.0;
		if (user.getMemberid()!=null) {
			discount = userMemberRankScoreService.findDiscountByMemberid(user.getMemberid());
		}
		
		Double totalprice = price * days * discount;

		Orders orders = new Orders();
		orders.setStatus(status);
		orders.setUserid(user.getUserid());
		orders.setDateofstay(dateOfStay);
		orders.setDateofdeparture(dateOfDeparture);
		orders.setRoomid(roomid);
		orders.setOrdertime(thisTime);
		orders.setTotalprice(totalprice);

		int index = ordersService.insertOrder(orders);
		if (index != 1) {
			return "jsp/erro/ordersInsertFail";
		}
		/*//入住的话，在积分表中加积分
		if (user.getMemberid()!=null) {
			UserMemberRankScore userMemberRankScore = goodsService.prepareforbuy(user.getMemberid());
			String detailID = userMemberRankScore.getDetailid();
			// 对查出来的detailID进行处理
			detailID = detailID.substring(2);
			detailID = Integer.parseInt(detailID) + 1 + "";
			int num = 4 - detailID.length();
			for (int i = 0; i < num; i++) {
				detailID = "0" + detailID;
			}
			detailID = "SD" + detailID;
			Score score = new Score();
			score.setScoreid(userMemberRankScore.getScoreid());
			score.setOperatetime(thisTime);
			score.setStatus("获得");
			score.setDetailid(detailID);
			score.setRestscore(userMemberRankScore.getRestscore()+totalprice.intValue());
			scoreService.insert(score);
			Scoredetail scoredetail = new Scoredetail();
			scoredetail.setDetailid(detailID);
			scoredetail.setGoods(0);
			scoredetail.setScore(totalprice.intValue());
			scoredetailService.insert(scoredetail);
		}*/
		
		return "jsp/success/ordersSuccess";
	}

	//求两个日期差的天数
	private int calDays(Date dateOfStay, Date dateOfDeparture) {
		long time = dateOfDeparture.getTime() - dateOfStay.getTime();
		int days = (int) time / 1000 / 60 / 60 / 24;
		return days;
	}

	//日期类转化为字符串
	private String dateToString(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(date);
	}
	
	private Date getStartTime() {  
        Calendar todayStart = Calendar.getInstance();  
        todayStart.set(Calendar.HOUR_OF_DAY, 0);  
        todayStart.set(Calendar.MINUTE, 0);  
        todayStart.set(Calendar.SECOND, 0);  
        todayStart.set(Calendar.MILLISECOND, 0);  
        return todayStart.getTime();  
    }  
}
