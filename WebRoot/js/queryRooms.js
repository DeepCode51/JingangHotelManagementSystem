function toValid(){
	var user = ${user };
	if (user==null) {
		alert("请先登陆再进行操作!");
		window.location.href="${pageContext.request.contextPath }/jsp/login.jsp";
		return false;
	}
	return true;
}