package wyz.jingangHotel02.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import wyz.jingangHotel02.ssm.autoMapper.OrdersCommentsMapper;
import wyz.jingangHotel02.ssm.autoPo.CommentsWithBLOBs;
import wyz.jingangHotel02.ssm.autoPo.OrdersComments;
import wyz.jingangHotel02.ssm.autoPo.OrdersCommentsVo;
import wyz.jingangHotel02.ssm.autoPo.UserCommemts;

public class OrdersCommentsServiceImpl implements OrdersCommentsService {

	@Autowired
	private OrdersCommentsMapper ordersCommentsMapper;
	
	@Override
	public List<CommentsWithBLOBs> selectUserComments(
			OrdersComments ordersComments) {
		return ordersCommentsMapper.selectUserComments(ordersComments);
	}

	@Override
	public List<UserCommemts> selectAllComments(OrdersComments ordersComments) {
		return ordersCommentsMapper.selectAllComments(ordersComments);
	}

	@Override
	public int selectCountAllComments(OrdersCommentsVo ordersCommentsVo) {
		return ordersCommentsMapper.selectCountAllComments(ordersCommentsVo);
	}

	@Override
	public List<UserCommemts> selectAllCommentsByPage(
			OrdersCommentsVo ordersCommentsVo) {
		return ordersCommentsMapper.selectAllCommentsByPage(ordersCommentsVo);
	}

	@Override
	public int selectCountUserComments(OrdersCommentsVo ordersCommentsVo) {
		return ordersCommentsMapper.selectCountUserComments(ordersCommentsVo);
	}

	@Override
	public List<CommentsWithBLOBs> selectUserCommentsByPage(
			OrdersCommentsVo ordersCommentsVo) {
		return ordersCommentsMapper.selectUserCommentsByPage(ordersCommentsVo);
	}

}
