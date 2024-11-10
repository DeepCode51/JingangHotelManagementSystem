package wyz.jingangHotel02.ssm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import wyz.jingangHotel02.ssm.autoPo.HManager;
import wyz.jingangHotel02.ssm.service.impl.HManagerService;

@Controller
public class ManagerController {
	
	@Autowired
	private HManagerService hManagerService;
	
	//查询所有的管理员
	@RequestMapping(value="selectAllManager",method=RequestMethod.GET)
	public String selectAllManager(Model model){
		List<HManager> list = hManagerService.selectAllManager();
		model.addAttribute("list", list);
		return "managerr/managerinfo";
	}
	
	//修改管理员之修改管理员信息
	@RequestMapping(value="updateManager",method=RequestMethod.POST)
	public String updateManager(Model model,HManager hManager){
		List<HManager> list = hManagerService.selectManagersByAdminid(hManager.getAdminid());
		for (HManager _hManager : list) {
			if (_hManager.getId()==hManager.getId()) {
				list.remove(_hManager);
				break;
			}
		}
		
		if (list!=null && list.size()>0) {
			return "redirect:managerr/managermg.jsp?status=sid";
		}
		
		hManagerService.updateManager(hManager);
		return "redirect:managerr/managermg.jsp?status=fs";
	}
	
	//新增管理员
	@RequestMapping(value="insertManager",method=RequestMethod.POST)
	public String insertManager(Model model,HManager hManager){
		int count = hManagerService.countManager();
		if (count>=7) {
			return "redirect:managerr/managermg.jsp?status=fl";
		}
		List<HManager> result = hManagerService.selectManagersByAdminid(hManager.getAdminid());
		if (result!=null && result.size()>0) {
			return "redirect:managerr/managermg.jsp?status=af";
		}
		hManager.setLevel(2);
		hManagerService.insertManager(hManager);
		return "redirect:managerr/managermg.jsp?status=as";
	}
	
	//删除管理员
	@RequestMapping(value="deleteManager",method=RequestMethod.GET)
	public String deleteManager(Model model,int id){
		hManagerService.deleteManager(id);
		return "redirect:managerr/managermg.jsp?status=ds";
	}
	
}
