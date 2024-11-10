<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>会员管理</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/commen.css" />
<script src="${pageContext.request.contextPath }/js/jquery-3.3.1.js"></script>
</head>
<style>
	.content {
		margin-top: 20px;
		margin-left: 50px;
	}
	form{
		margin-top:20px; 
	}
	form div{
		margin-top: 15px;
	}
	input[type=submit]{
		margin-right: 20px;
	}
	#t1 tr td{
		height: 60px;
	}
	.middle {
		text-align: center;
	}
</style>
<script type="text/javascript">
	function fixrank(data){
		var father = $(data).parent().prev();
		$(data).hide();
		$(father).children("span").hide();
		$(father).children("form").show();
	}
	
	function cacl(data){
		$(data).parent().hide();
		$(data).parent().prev().show();
		$(data).parent().parent().next().children("a").eq(0).show();
	}
</script>
<body>
	<%@include file="commen/commen.jsp"%>
	<%@include file="commen/top.jsp"%>
	<div style="position: absolute;">
		<%@ include file="commen/navigation.jsp"%>
	</div>
	<div id="section">
		<div class="content">
			<div class="top">
			<a href="${pageContext.request.contextPath }/selectMembers.action?currPage=1&phone=&username=&rankid=">会员信息</a>
			丨
			<a href="${pageContext.request.contextPath }/findGoodsByPage.action?currPage=1&status=0">会员商品信息</a>
			丨
			<a href="${pageContext.request.contextPath }/selectRanks.action">会员折扣</a>
			<hr>
			<form action="${pageContext.request.contextPath }/selectMembers.action" method="get" id="search">
				<input type="hidden" name="currPage" value="1">
				<span>手机号</span><input type="text" name="phone" value="${vo.phone }">
				<span>姓名</span><input type="text" name="username" value="${vo.username }">
				<span>会员等级</span>
				<select name="rankid">
					<option value="0" <c:if test="${empty vo.rankid or vo.rankid=='0' }">selected="selected"</c:if> >请选择</option>
					<option value="1" <c:if test="${vo.rankid=='1' }">selected="selected"</c:if> >白银会员</option>
					<option value="2" <c:if test="${vo.rankid=='2' }">selected="selected"</c:if> >黄金会员</option>
					<option value="3" <c:if test="${vo.rankid=='3' }">selected="selected"</c:if> >钻石会员</option>
				</select>
				<input type="submit" value="查询">
			</form>
			</div>
			<hr>
			<div class="middle">
				<table width="1000px" border="solid" cellspacing="0" style="text-align: center;font-size: 13px;" id="t1">
					<tr height="40px">
						<th width="20%">用户编号</th>
						<th width="20%">手机号</th>
						<th width="20%">真实姓名</th>
						<th width="20%">会员等级</th>
						<th width="20%">操作</th>
					</tr>
					<c:forEach items="${pageBean.list }" var="user">
					<tr height="20px">
						<td>${user.userid }</td>
						<td>${user.phone }</td>
						<td>${user.username }</td>
						<td><span>${user.rank }</span>
						<form action="${pageContext.request.contextPath }/fixRank.action" style="display: none;" method="post" id="fixrank">
							<input type="hidden" value="${user.memberid }" name="memberid">
							<select name="rank" style="height: 18px;">
								<option value="1" <c:if test="${user.rank=='白银会员' }">selected="selected"</c:if> >白银会员</option>
								<option value="2" <c:if test="${user.rank=='黄金会员' }">selected="selected"</c:if> >黄金会员</option>
								<option value="3" <c:if test="${user.rank=='钻石会员' }">selected="selected"</c:if> >钻石会员</option>
							</select><br>
							<input type="submit" value="修改" style="margin-top: 2px;font-size: 10px;height: 18px;">
							<a href="javascript:void(0)" onclick="cacl(this)" style="margin-top: 2px;font-size: 10px;height: 18px;">取消</a>
						</form>
						</td>
						<td>
							<a href="javascript:void(0)" onclick="fixrank(this)">修改等级</a>&nbsp;&nbsp;
							<a href="${pageContext.request.contextPath }/selectMemberInfo.action?currPage=1&memberid=${user.memberid }">积分详情</a>
						</td>
					</tr>
					</c:forEach>
					<tr>
						<td colspan="5" align="center" style="height: 30px;">
			            <c:choose>
				            <c:when test="${pageBean.list!=null and pageBean.list.size()>0 }">
										<span>第${pageBean.currPage }/${pageBean.totalPage}页</span>
										<span>总记录数:${pageBean.totalCount }</span>
										<span>每页显示的记录数:${pageBean.pageSize }</span>
										<c:if test="${pageBean.currPage !=1}">
											<a href="${pageContext.request.contextPath }/selectMembers.action?currPage=1&username=${vo.username }&phone=${vo.phone }&rankid=${vo.rankid }">首页</a>
											<a href="${pageContext.request.contextPath }/selectMembers.action?currPage=${pageBean.currPage-1}&username=${vo.username }&phone=${vo.phone }&rankid=${vo.rankid }">上一页</a>
										</c:if> <c:forEach var="i" begin="1" end="${pageBean.totalPage }">
											<c:if test="${pageBean.currPage!=i }">
												<a href="${pageContext.request.contextPath }/selectMembers.action?currPage=${i }&username=${vo.username }&phone=${vo.phone }&rankid=${vo.rankid }">[${i}]</a>
											</c:if>
											<c:if test="${pageBean.currPage==i }">[${i }]</c:if>
					
										</c:forEach> <c:if test="${pageBean.currPage!=pageBean.totalPage }">
											<a href="${pageContext.request.contextPath }/selectMembers.action?currPage=${pageBean.currPage+1}&username=${vo.username }&phone=${vo.phone }&rankid=${vo.rankid }">下一页</a>
											<a href="${pageContext.request.contextPath }/selectMembers.action?currPage=${pageBean.totalPage}&username=${vo.username }&phone=${vo.phone }&rankid=${vo.rankid }">尾页</a>
										</c:if>
							</c:when>
							<c:otherwise>
								抱歉没有查询到会员信息！
							</c:otherwise>
						</c:choose>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
