window.onload = function() {
	document.oncontextmenu = function() {
		return false;
	}
}

function registersubmit(){
	var username = $("#username").val();
	var useridcard=$("#useridcard").val();
	var phone = $("#phone").val();
	var userpassword = $("#userpassword").val();
	var _userpassword = $("_userpassword").val();
	if (!/^[\u4E00-\u9FA5]{2,12}$/.test(username)) {
		alert("姓名请输入2-12个汉字");
		return false;
	}
	if (useridcard.length!=18||useridcard == ""|| useridcard == null) {
		alert("请输入18位身份证号");
		return false;
	}
	if (!/^1[3578][0-9]{9}$/.test(phone)) {
		alert("账号为您的11位手机号");
		return false;
	}
	if (!/\w{8,16}/.test(userpassword)) {
		alert("请输入8-16位有效密码");
		return false;
	}
	// if (userpassword!=_userpassword) {
	// 	alert("两次输入的密码不一致");
	// 	return false;
	// }
	return true;
}