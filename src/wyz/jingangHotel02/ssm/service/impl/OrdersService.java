package wyz.jingangHotel02.ssm.service.impl;

import java.util.Date;
import java.util.List;

import wyz.jingangHotel02.ssm.autoPo.Orders;

public interface OrdersService {

	public List<Orders> findUserOrders(String userid,String status);
	
	public List<Orders> findUserOrdersPage(String userid,String status,int begin,int pageSize);
	
	public int findUserOrdersCount(String userid,String status);
	
	public int insertOrder(Orders orders);
	
	public List<String> findByFirstWay(Date dateOfStay);

	public List<String> findBySecondWay(Date dateOfDeparture);
	
	public List<String> findByThirdWay(Date dateOfStay,Date dateOfDeparture);
	
	public List<Orders> findNotComments(Orders orders);
	
	public int updateOrdersStatus(Orders orders);
	
	public Orders findSingleOrdersById(Integer orderid);
	
	public int addCommentId(int orderid);

	public int countOrdersByStatus(String status);

	public List<Orders> selectOrdersByStatus(String status, int begin,
			int pageSize);
}
