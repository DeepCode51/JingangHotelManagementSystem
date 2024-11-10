package wyz.jingangHotel02.ssm.service.impl;

import java.util.List;

import wyz.jingangHotel02.ssm.autoPo.Goods;
import wyz.jingangHotel02.ssm.autoPo.UserMemberRankScore;

public interface GoodsService {
	public List<Goods> findGoods();

	public List<Goods> findGoodsByPages(int begin, int pageSize);

	public int findGoodsNum();

	public UserMemberRankScore prepareforbuy(String memberID);

	public void updateGoodsStatus(Integer goodsid, Integer status);

	public void updateGoods(Goods goods);

	public void insertGoods(Goods goods);
	
	public String selectDetailId();
}
