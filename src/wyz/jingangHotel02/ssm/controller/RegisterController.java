package wyz.jingangHotel02.ssm.controller;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import wyz.jingangHotel02.ssm.autoPo.User;
import wyz.jingangHotel02.ssm.service.impl.RegisterService;
import wyz.jingangHotel02.ssm.service.impl.UserMemberRankScoreService;

@Controller
public class RegisterController {

	@Autowired
	private RegisterService registerService;
	
	@Autowired
	private UserMemberRankScoreService userMemberRankScoreService;
	
	@RequestMapping(value="/register",method={RequestMethod.POST})
	public String register(User user) throws Exception {
		//获取数据库最后一条用户信息的ID，以此为注册者生成新ID
		String lastUserId = userMemberRankScoreService.findLastUserId();
		lastUserId = lastUserId.substring(2);
		lastUserId = Integer.parseInt(lastUserId)+1+"";
		int num = 4 - lastUserId.length();
		for (int i = 0; i < num; i++) {
			lastUserId = "0"+lastUserId;
		}
		String userid = "JG"+lastUserId;
		user.setUserid(userid);
		//注册
		int record = registerService.register(user);
		if (record==-1) {
			return "redirect:/jsp/erro/wrong.jsp";
		}
		
		//生成用户评论所可能上传的照片文件夹
		createUserCommentFolder(userid);
		
		return "redirect:/jsp/success/success.jsp";
	}

	private void createUserCommentFolder(String userid) throws Exception{
		String path = "E:\\images\\jingangHotel\\commemt\\"+userid;
		File file = new File(path);
		if (file.exists()&&file.isDirectory()) {
			String[] content = file.list();
			for (String name : content) {
				File temp = new File(path,name);
				temp.delete();
			}
		}else {
			file.mkdirs();
		}
		
	}
}
