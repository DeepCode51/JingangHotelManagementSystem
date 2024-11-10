window.onload = function() {
	document.oncontextmenu = function() {
		return false;
	}
}

function loginsubmit() {
	var username = $("#username").val();
	var password = $("#password").val();
	if (username == null || username == "") {
		alert("账号不能为空！");
		return false;
	} else if (username.length != 11) {
		alert("请输入11位数字的账号!");
		return false;
	}
	if (password == null || password == "") {
		alert("密码不能为空！");
		return false;
	}
	var regexph = /^1[3578][0-9]{9}$/;
	if (!regexph.test(username)) {
		alert("请输入正确格式的账号！");
		return false;
	}
	var regexpw = /\w{8,16}/;
	if (!regexpw.test(password)) {
		alert("请输入正确格式的密码！");
		return false;
	}
	return true;
}

$(function() {
	$("#username").keyup(
			function() {
				var username = $(this).val();
				if (username == null || username == "" || username.length != 11
						|| (!/^1[3578][0-9]{9}$/.test(username))) {
					$("#unerro").css("display", "initial");
				} else {
					$("#unerro").css("display", "none");
				}
			});
	$("#password").keyup(
			function() {
				var password = $(this).val();
				if (password == null || password == ""
						|| (!/^\w{8,16}$/.test(password))) {
					$("#pderro").css("display", "initial");
				} else {
					$("#pderro").css("display", "none");
				}
			});
});