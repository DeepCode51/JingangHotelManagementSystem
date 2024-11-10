<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>会员折扣</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/commen.css" />
<script src="${pageContext.request.contextPath }/js/jquery-3.3.1.js"></script>
</head>
<style>
	#section_top,#content{
		margin-top: 20px;
		margin-left: 50px;
	}
</style>
<body>
	<%@include file="commen/commen.jsp"%>
	<%@include file="commen/top.jsp"%>
	<div style="position: absolute;">
		<%@ include file="commen/navigation.jsp"%>
	</div>
	<div id="section">
		<div id="section_top">
			<a href="${pageContext.request.contextPath }/selectMembers.action?currPage=1&phone=&username=&rankid=">会员信息</a>
			丨
			<a href="${pageContext.request.contextPath }/findGoodsByPage.action?currPage=1&status=0">会员商品信息</a>
			丨
			<a href="${pageContext.request.contextPath }/selectRanks.action">会员折扣</a>
			<hr>
		</div>
		<div id="content">
			<table width="600px" style="text-align: center;margin-left: 150px;" cellspacing="0" border="1px">
				<tr height="40px">
					<th>等级编号</th>
					<th>会员等级</th>
					<th>当前折扣</th>
					<th>操作</th>
				</tr>
				<c:forEach var="rank" items="${list }">
				<tr height="60px">
					<td>${rank.rankid }</td>
					<td>${rank.rank }</td>
					<td>
						<span>${rank.discount }</span>
						<input type="text" name="discount" style="display: none;">
						<a href="javascript:void(0);" onclick="update(this)" style="display: none;">修改</a>
						<a href="javascript:location.reload();" style="display: none;">取消</a>
					</td>
					<td><a href="javascript:void(0);" onclick="cg(this);">修改折扣</a></td>
				</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
<script type="text/javascript">
	function cg(data){
		var td = $(data).parent().prev();
		$(td).children("span").hide();
		$(td).children("input").show();
		$(td).children("a").show();
	}
	
	function update(dt){
		var rankid = $(dt).parent().prev().prev().html();
		var discount = $(dt).prev().val();
		$.ajax({
			type:'post',
			url:'${pageContext.request.contextPath }/updateRanks.action',
			data:{"rankid":rankid,"discount":discount},
			dataType:'json',
			success:function(data){
				alert(data.msg);
				location.reload();
			}
		});
	}
</script>
</html>
