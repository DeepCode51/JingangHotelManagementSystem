package wyz.jingangHotel02.ssm.controller;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

import wyz.jingangHotel02.ssm.autoPo.PageBean;
import wyz.jingangHotel02.ssm.autoPo.Room;
import wyz.jingangHotel02.ssm.autoPo.RoomAndType;
import wyz.jingangHotel02.ssm.autoPo.RoomVo;
import wyz.jingangHotel02.ssm.autoPo.Roomtype;
import wyz.jingangHotel02.ssm.service.impl.RoomAndTypeService;
import wyz.jingangHotel02.ssm.service.impl.RoomService;
import wyz.jingangHotel02.ssm.service.impl.RoomtypeService;

@Controller
public class RoomController {
	
	@Autowired
	private RoomAndTypeService roomAndTypeService;
	
	@Autowired
	private RoomService roomService;
	
	@Autowired
	private RoomtypeService roomtypeService;
	
	//修改房价
	@RequestMapping(value="updatePrice",method=RequestMethod.POST)
	public String updatePrice(Roomtype roomtype){
		roomtypeService.updatePrice(roomtype);
		return "redirect:managerr/roomsmg.jsp?status=fps";
	}
	
	//查询房价
	@ResponseBody
	@RequestMapping(value="queryPrice",method=RequestMethod.GET ,produces="application/json;charset=UTF-8")
	public String queryPrice(){
		List<Roomtype> list = roomtypeService.selectAll();
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("list", list);
		return jsonObject.toJSONString();
	}
	
	//新增客房(要创建客房图片文件夹)
	@RequestMapping(value="insertRoom",method=RequestMethod.POST)
	public String insertRoom(String roomid,Integer roomtypeid,String description){
		Room _room = roomService.selectRoomByRoomid(roomid);
		if (_room !=null) {
			return "redirect:managerr/roomsmg.jsp?status=is";
		}
		String path = "E:\\images\\jingangHotel\\room\\"+roomid;
		File file = new File(path);
		file.mkdirs();
		Room room = new Room();
		room.setRoomid(roomid);
		room.setRoomtypeid(roomtypeid);
		room.setDescription(description);
		roomService.insertRoom(room);
		return "redirect:managerr/roomsmg.jsp?status=irs";
	}
	
	//修改房间信息
	@RequestMapping(value="updateRoom",method=RequestMethod.POST)
	public String updateRoom(String oldroomid,String roomid,Integer roomtypeid,String description){
		Room record = new Room();
		record.setRoomid(roomid);
		record.setRoomtypeid(roomtypeid);
		record.setDescription(description);
		roomService.updateRoom(record,oldroomid);
		return "redirect:managerr/roomsmg.jsp?status=frs";
	}
	
	//查询房间信息
	@RequestMapping(value="selectRooms",method=RequestMethod.GET)
	public String selectRooms(Model model ,Integer currPage ,String roomid,Integer roomtypeid){
		
		int pageSize = 5;
		
		RoomVo roomVo = new RoomVo();
		if (roomid!=null && roomid !="" && (!roomid.equals("0"))) {
			roomVo.setRoomid("%"+roomid+"%");
		}
		if (roomid!=null && roomid !="" && (!roomtypeid.equals("0"))) {
			roomVo.setRoomtypeid(roomtypeid);
		}
		int totalCount = roomAndTypeService.countRooms(roomVo);
		double num = totalCount;
		Double totalPage = Math.ceil(num / pageSize);
		int begin = (currPage - 1) * pageSize;
		roomVo.setBegin(begin);
		roomVo.setPagesize(pageSize);
		
		List<RoomAndType> list = roomAndTypeService.selectRooms(roomVo);
		
		PageBean<RoomAndType> pageBean = new PageBean<RoomAndType>(currPage, pageSize, totalCount, totalPage.intValue(), list);
		
		roomVo.setRoomid(roomid);
		roomVo.setRoomtypeid(roomtypeid);
		model.addAttribute("pageBean", pageBean);
		model.addAttribute("roomVo", roomVo);
		
		return "managerr/roomsinfo";
	}
	
}
