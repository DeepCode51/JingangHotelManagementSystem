package wyz.jingangHotel02.ssm.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import wyz.jingangHotel02.ssm.autoMapper.OrdersMapper;
import wyz.jingangHotel02.ssm.autoPo.Orders;
import wyz.jingangHotel02.ssm.autoPo.OrdersExample;
import wyz.jingangHotel02.ssm.autoPo.OrdersExample.Criteria;

public class OrdersServiceImpl implements OrdersService {

	@Autowired
	private OrdersMapper ordersMapper;

	@Override
	public List<String> findByFirstWay(Date dateOfStay) {
		OrdersExample example = new OrdersExample();
		Criteria criteria = example.createCriteria();
		List<String> slist = new ArrayList<String>();
		slist.add("已支付");
		slist.add("已入住");
		slist.add("申请取消");
		criteria.andStatusIn(slist);
		criteria.andDateofstayLessThanOrEqualTo(dateOfStay);
		criteria.andDateofdepartureGreaterThan(dateOfStay);
		List<Orders> list = ordersMapper.selectByExample(example);
		List<String> roomList = new ArrayList<String>();
		for (Orders orders : list) {
			roomList.add(orders.getRoomid());
		}
		return roomList;
	}

	@Override
	public List<String> findBySecondWay(Date dateOfDeparture) {
		OrdersExample example = new OrdersExample();
		Criteria criteria = example.createCriteria();
		List<String> slist = new ArrayList<String>();
		slist.add("已支付");
		slist.add("已入住");
		slist.add("申请取消");
		criteria.andStatusIn(slist);
		criteria.andDateofstayLessThan(dateOfDeparture);
		criteria.andDateofdepartureGreaterThanOrEqualTo(dateOfDeparture);
		List<Orders> list = ordersMapper.selectByExample(example);
		List<String> roomList = new ArrayList<String>();
		for (Orders orders : list) {
			roomList.add(orders.getRoomid());
		}
		return roomList;
	}

	@Override
	public List<String> findByThirdWay(Date dateOfStay, Date dateOfDeparture) {
		OrdersExample example = new OrdersExample();
		Criteria criteria = example.createCriteria();
		List<String> slist = new ArrayList<String>();
		slist.add("已支付");
		slist.add("已入住");
		slist.add("申请取消");
		criteria.andStatusIn(slist);
		criteria.andDateofstayGreaterThan(dateOfStay);
		criteria.andDateofdepartureLessThan(dateOfDeparture);
		List<Orders> list = ordersMapper.selectByExample(example);
		List<String> roomList = new ArrayList<String>();
		for (Orders orders : list) {
			roomList.add(orders.getRoomid());
		}
		return roomList;
	}

	@Override
	public int insertOrder(Orders orders) {
		return ordersMapper.insertSelective(orders);
	}

	@Override
	public List<Orders> findUserOrders(String userid, String status) {
		OrdersExample example = new OrdersExample();
		Criteria criteria = example.createCriteria();
		criteria.andUseridEqualTo(userid);
		if (status != null) {
			criteria.andStatusEqualTo(status);
		}
		example.setOrderByClause("ordertime desc");
		List<Orders> list = ordersMapper.selectByExample(example);
		return list;
	}

	public List<Orders> findNotComments(Orders orders) {
		OrdersExample example = new OrdersExample();
		Criteria criteria = example.createCriteria();
		criteria.andUseridEqualTo(orders.getUserid());
		criteria.andStatusEqualTo(orders.getStatus());
		criteria.andDateofdepartureGreaterThanOrEqualTo(orders
				.getDateofdeparture());
		criteria.andCommemtidIsNull();
		List<Orders> list = ordersMapper.selectByExample(example);
		return list;
	}

	@Override
	public int updateOrdersStatus(Orders orders) {
		return ordersMapper.updateByPrimaryKeySelective(orders);
	}

	@Override
	public Orders findSingleOrdersById(Integer orderid){
		return ordersMapper.selectByPrimaryKey(orderid);
	}

	@Override
	public List<Orders> findUserOrdersPage(String userid, String status,
			int begin, int pageSize) {
		OrdersExample example = new OrdersExample();
		Criteria criteria = example.createCriteria();
		criteria.andUseridEqualTo(userid);
		if (status != null) {
			criteria.andStatusEqualTo(status);
		}
		example.setOrderByClause("ordertime desc limit "+begin+","+pageSize);
		List<Orders> list = ordersMapper.selectByExample(example);
		return list;
	}

	@Override
	public int findUserOrdersCount(String userid, String status) {
		OrdersExample example = new OrdersExample();
		Criteria criteria = example.createCriteria();
		criteria.andUseridEqualTo(userid);
		if (status != null) {
			criteria.andStatusEqualTo(status);
		}
		return ordersMapper.countByExample(example);
	}

	@Override
	public int addCommentId(int orderid) {
		Orders orders = new Orders();
		orders.setOrderid(orderid);
		orders.setCommemtid(orderid);
		return ordersMapper.updateByPrimaryKeySelective(orders);
	}

	@Override
	public int countOrdersByStatus(String status) {
		OrdersExample example = new OrdersExample();
		if (status.equals("0")) {
			return ordersMapper.countByExample(example);
		}
		Criteria criteria = example.createCriteria();
		criteria.andStatusEqualTo(status);
		return ordersMapper.countByExample(example);
	}

	@Override
	public List<Orders> selectOrdersByStatus(String status, int begin,
			int pageSize) {
		OrdersExample example = new OrdersExample();
		example.setOrderByClause("orderid limit "+begin+","+pageSize);
		if (status.equals("0")) {
			return ordersMapper.selectByExample(example);
		}
		Criteria criteria = example.createCriteria();
		criteria.andStatusEqualTo(status);
		return ordersMapper.selectByExample(example);
	}
}
