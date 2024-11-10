package auto;

import wyz.jingangHotel02.ssm.autoPo.Orders;

public class test {
	public static void main(String[] args) {
		Orders orders = new Orders();
		orders.setOrderid(1);
		System.out.println(orders.getRoomid()+"-"+orders.getStatus()+"-"+orders.getUserid()+"-"+orders.getCommemtid()+"-"+orders.getOrderid()+"-"+orders.getTotalprice());
	}
}
