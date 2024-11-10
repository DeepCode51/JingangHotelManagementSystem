<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>客房查询结果</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/commen.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/queryRooms.css" />

</head>

<body>
	<div id="header"><%@include file="/commen/top.jsp"%></div>
	<div id="nav">
		<%@ include file="/commen/navigation.jsp"%>
	</div>
	<div id="section">
		<div id="section_content" >
				<table width="1000px" border="solid" bordercolor="black" cellspacing="0" style="text-align: center;">
				  <tr>
				    <th width="15%">房间号</th>
				    <th width="20%">类型</th>
				    <th width="15%">价格</th>
				    <th width="40%">描述</th>
				    <th width="10%">操作</th>
				  </tr>
				<c:forEach var="rooms" items="${roomList }">
				  <tr height="80px">
				    <td>${rooms.roomid }</td>
				    <td>${rooms.roomtype }</td>
				    <td>${rooms.price }</td>
				    <td>${rooms.description }</td>
				    <td>
				    	<form action="${pageContext.request.contextPath }/generateOrders.action" method="post" onsubmit="return toValid()">
				   		<input type="hidden" name="dateOfStay" value="${dateOfStay }"/>
						<input type="hidden" name="dateOfDeparture" value="${dateOfDeparture }"/>
						<input type="hidden" name="roomid" value="${rooms.roomid }" />
						<input type="hidden" name="price" value="${rooms.price }"/>
				    	<input type="submit" value="预定"/>
				    	</form>
				    </td>
				  </tr>
				</c:forEach>
				</table>
		<c:if test="${roomPageBean.totalCount!=0 }">
		<div id="bottom">
		第${roomPageBean.currPage }/${roomPageBean.totalPage}页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		总记录数:${roomPageBean.totalCount }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		每页显示的记录数:${roomPageBean.pageSize }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<c:if test="${roomPageBean.currPage !=1}">
				<a
					href="${pageContext.request.contextPath }/queryRoomsSpecail.action?dateOfStay=${dateOfStay }&dateOfDeparture=${dateOfDeparture }&roomtypeid=${roomtypeid }&currPage=1">首页</a>
				<a
					href="${pageContext.request.contextPath }/queryRoomsSpecail.action?dateOfStay=${dateOfStay }&dateOfDeparture=${dateOfDeparture }&roomtypeid=${roomtypeid }&currPage=${roomPageBean.currPage-1}">上一页</a>
			</c:if> <c:forEach var="i" begin="1" end="${roomPageBean.totalPage }">
				<c:if test="${roomPageBean.currPage!=i }">
					<a
						href="${pageContext.request.contextPath }/queryRoomsSpecail.action?dateOfStay=${dateOfStay }&dateOfDeparture=${dateOfDeparture }&roomtypeid=${roomtypeid }&currPage=${i }">[${i
						}]</a>
				</c:if>
				<c:if test="${roomPageBean.currPage==i }">[${i }]</c:if>

			</c:forEach> <c:if test="${roomPageBean.currPage!=roomPageBean.totalPage }">
				<a
					href="${pageContext.request.contextPath }/queryRoomsSpecail.action?dateOfStay=${dateOfStay }&dateOfDeparture=${dateOfDeparture }&roomtypeid=${roomtypeid }&currPage=${roomPageBean.currPage+1}">下一页</a>
				<a
					href="${pageContext.request.contextPath }/queryRoomsSpecail.action?dateOfStay=${dateOfStay }&dateOfDeparture=${dateOfDeparture }&roomtypeid=${roomtypeid }&currPage=${roomPageBean.totalPage}">尾页</a>
			</c:if>
		</div>
		</c:if>
		</div>
	</div>
</body>
<script type="text/javascript">
function toValid(){
	var user = <%=session.getAttribute("user") %>;
	if (user==null) {
		alert("请先登陆再进行操作!");
		var curPath=window.document.location.href;
		var pathName=window.document.location.pathname;
		var pos=curPath.indexOf(pathName);
		var localhostPath=curPath.substring(0,pos);
		var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
		var href = localhostPath+projectName+"/jsp/login.jsp";
		window.location.href=href;
		return false;
	}
	return true;
}

</script>
</html>
