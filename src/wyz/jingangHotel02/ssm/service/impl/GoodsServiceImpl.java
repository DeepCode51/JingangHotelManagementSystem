package wyz.jingangHotel02.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import wyz.jingangHotel02.ssm.autoMapper.GoodsMapper;
import wyz.jingangHotel02.ssm.autoMapper.UserMemberRankScoreMapper;
import wyz.jingangHotel02.ssm.autoPo.Goods;
import wyz.jingangHotel02.ssm.autoPo.GoodsExample;
import wyz.jingangHotel02.ssm.autoPo.GoodsExample.Criteria;
import wyz.jingangHotel02.ssm.autoPo.UserMemberRankScore;

public class GoodsServiceImpl implements GoodsService{

	@Autowired
	private GoodsMapper goodsMapper;
	@Autowired UserMemberRankScoreMapper userMemberRankScoreMapper;
	
	@Override
	public List<Goods> findGoods() {
		GoodsExample example = new GoodsExample();
		List<Goods> list = goodsMapper.selectByExample(example);
		return list;
	}

	@Override
	public int findGoodsNum() {
		GoodsExample example = new GoodsExample();
		int count = goodsMapper.countByExample(example);
		return count;
	}

	@Override
	public List<Goods> findGoodsByPages(int begin,int pageSize) {
		GoodsExample example = new GoodsExample();
		example.setOrderByClause("goodsid limit "+begin+","+pageSize);
		Criteria criteria = example.createCriteria();
		criteria.andGoodsidNotEqualTo(0);
		return goodsMapper.selectByExample(example);
	}

	@Override
	public UserMemberRankScore prepareforbuy(String memberID) {
		UserMemberRankScore userMemberRankScore = userMemberRankScoreMapper.prepareforbuy(memberID);
		return userMemberRankScore;
	}

	@Override
	public void updateGoodsStatus(Integer goodsid, Integer status) {
		Goods goods = new Goods();
		goods.setGoodsid(goodsid);
		goods.setStatus(status);
		goodsMapper.updateByPrimaryKeySelective(goods);
	}

	@Override
	public void updateGoods(Goods goods) {
		goodsMapper.updateByPrimaryKeySelective(goods);
	}

	@Override
	public void insertGoods(Goods goods) {
		goodsMapper.insertSelective(goods);
	}

	@Override
	public String selectDetailId() {
		return userMemberRankScoreMapper.selectDetailId();
	}

}
