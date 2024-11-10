package wyz.jingangHotel02.ssm.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import wyz.jingangHotel02.ssm.autoPo.Goods;
import wyz.jingangHotel02.ssm.autoPo.PageBean;
import wyz.jingangHotel02.ssm.autoPo.Score;
import wyz.jingangHotel02.ssm.autoPo.Scoredetail;
import wyz.jingangHotel02.ssm.autoPo.User;
import wyz.jingangHotel02.ssm.autoPo.UserMemberRankScore;
import wyz.jingangHotel02.ssm.service.impl.GoodsService;
import wyz.jingangHotel02.ssm.service.impl.ScoreService;
import wyz.jingangHotel02.ssm.service.impl.ScoredetailService;

@Controller
public class GoodsController {

	@Autowired
	private GoodsService goodsService;
	@Autowired
	private ScoreService scoreService;
	@Autowired
	private ScoredetailService scoredetailService;
	
	//修改或者添加图片
	@RequestMapping(value = "/addOrUpdateImg", method = { RequestMethod.POST })
	public String addOrUpdateImg(MultipartFile file,Integer goodsid,Integer currPage) throws IllegalStateException, IOException{
		String path = "E:\\images\\jingangHotel\\goods\\";
		String originalFilename = file.getOriginalFilename();
		String newFilename = new SimpleDateFormat("yyMMddHHmmss").format(new Date())+originalFilename.substring(originalFilename.lastIndexOf("."));
		File newFile =new File(path+newFilename);
		file.transferTo(newFile);
		Goods goods = new Goods();
		goods.setGoodsid(goodsid);
		goods.setImg(newFilename);
		goodsService.updateGoods(goods);
		return "redirect:findGoodsByPage.action?currPage="+currPage+"&status=0";
	}
	
	//商品添加
	@RequestMapping(value = "/insertGoods", method = { RequestMethod.POST })
	public String insertGoods(Goods goods){
		goodsService.insertGoods(goods);
		return "redirect:findGoodsByPage.action?currPage=1&status=0";
	}
	
	//更新物品
	@RequestMapping(value = "/updateGoods", method = { RequestMethod.POST })
	public String updateGoods(Goods goods){
		goodsService.updateGoods(goods);
		return "redirect:findGoodsByPage.action?currPage=1&status=0";
	}
	
	//物品的上下架
	@RequestMapping(value = "/updateGoodsStatus", method = { RequestMethod.GET })
	public String updateGoodsStatus(Integer goodsid,Integer status,Integer currPage){
		if (status==1) {
			status=0;
		}else {
			status=1;
		}
		goodsService.updateGoodsStatus(goodsid,status);
		
		return "redirect:findGoodsByPage.action?currPage="+currPage+"&status=0";
	}
	
	// 会员商城物品分页查询
	@RequestMapping(value = "/findGoodsByPage", method = { RequestMethod.GET })
	public String findGoodsByPage(Model model, Integer currPage,Integer status)
			throws Exception {
		// currentPage当前页数
		// 设置每页条数
		int pageSize = 5;
		// 设置总记录数
		int totalCount = goodsService.findGoodsNum() - 1;

		double num = totalCount;
		Double totalPage = Math.ceil(num / pageSize);

		int begin = (currPage - 1) * pageSize;
		List<Goods> list = goodsService.findGoodsByPages(begin, pageSize);

		PageBean<Goods> pageBean = new PageBean<Goods>(currPage, pageSize,
				totalCount, totalPage.intValue(), list);

		model.addAttribute("goodspageBean", pageBean);

		if (status==0) {
			return "managerr/memberShop";
		}
		
		return "jsp/memberShop";
	}

	// 会员商城物品购买
	@RequestMapping(value = "buyGoods", method = { RequestMethod.POST })
	public String buyGoods(HttpSession session, int goodsid, int score,
			int number) throws Exception {
		User user = (User) session.getAttribute("user");
		// userMemberRankScore里面只有scoreID detailID restScore
		UserMemberRankScore userMemberRankScore = goodsService
				.prepareforbuy(user.getMemberid());
		String scoreID = userMemberRankScore.getScoreid();
		String detailID = goodsService.selectDetailId();
		// 对查出来的detailID进行处理
		detailID = detailID.substring(2);
		detailID = Integer.parseInt(detailID) + 1 + "";
		int num = 4 - detailID.length();
		for (int i = 0; i < num; i++) {
			detailID = "0" + detailID;
		}
		detailID = "SD" + detailID;

		int restscore = userMemberRankScore.getRestscore();
		score = score * number;
		restscore = restscore - score;
		if (restscore < 0) {
			return "redirect:jsp/erro/wrong.jsp?status=goods";
		}
		Date operatetime = new Date();
		Score scoreObj = new Score();
		scoreObj.setScoreid(scoreID);
		scoreObj.setOperatetime(operatetime);
		scoreObj.setStatus("消费");
		scoreObj.setDetailid(detailID);
		scoreObj.setRestscore(restscore);
		// 将scoreObj插入进表
		int scoreindex = scoreService.insert(scoreObj);
		if (scoreindex != 1) {
			return "jsp/erro/wrong";
		}

		Scoredetail scoredetail = new Scoredetail();
		scoredetail.setDetailid(detailID);
		scoredetail.setGoods(goodsid);
		scoredetail.setNumber(number);
		scoredetail.setScore(score);
		// 将scoredetail插入进表
		int scoredetailindex = scoredetailService.insert(scoredetail);
		if (scoredetailindex != 1) {
			return "jsp/erro/wrong";
		}

		// 跳转到成功页面
		return "jsp/success/buysuccess";
	}
}
