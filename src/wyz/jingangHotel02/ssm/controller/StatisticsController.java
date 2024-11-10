package wyz.jingangHotel02.ssm.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import wyz.jingangHotel02.ssm.autoPo.YearStatistics;
import wyz.jingangHotel02.ssm.service.impl.StatisticsService;

import com.alibaba.fastjson.JSONObject;

@Controller
public class StatisticsController {

	@Autowired
	private StatisticsService statisticsService;
	
	@ResponseBody
	@RequestMapping(value="selectStatistics",method = RequestMethod.GET ,produces="application/json;charset=UTF-8")
	public String selectStatistics(Integer year,Integer roomtypeid){
		 List<YearStatistics> list = new ArrayList<YearStatistics>();
		YearStatistics statistics;
		for (int month = 1; month <=12; month++) {
			YearStatistics _statistics = new YearStatistics();
			_statistics.setYear(year);
			_statistics.setMonth(month);
			if (roomtypeid!=0) {
				_statistics.setRoomtypeid(roomtypeid);
			}
			Integer count = statisticsService.selectStatistics(_statistics);
			statistics = new YearStatistics();
			statistics.setYear(year);
			statistics.setMonth(month);
			statistics.setCount(count);
			list.add(statistics);
		}
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("list", list);
		return jsonObject.toJSONString();
	}
}
