<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>宾馆评价</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/commen.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/myComments.css" />
<script src="${pageContext.request.contextPath }/js/jquery-3.3.1.js"
	type="text/javascript" charset="utf-8"></script>
</head>
<script type="text/javascript">
	function addreply(d1,d2){
		var status;
			$(d2).hide();
		if (d1==1) {
			status = "已通过";
			$(d2).next().hide();
			$(d2).next().next().show();
		}else{
			status= "未通过";
			$(d2).prev().hide();
			$(d2).next().show();
		}
		$(d2).parent().prev().children("span").hide();
		$(d2).parent().prev().children("div").show();
		$(d2).parent().prev().children("div").children("input").val(status);
	}
	
	function fix(data){
		var id = $(data).parent().parent().children("td").eq(0).html();
		var status = $(data).parent().prev().children("div").children("input").val();
		var reply = $(data).parent().prev().children("div").children("textarea").val();
		$.ajax({
			type:'post',
			url:'${pageContext.request.contextPath }/updateComment.action',
			data:{"id":id,"status":status,"reply":reply},
			dataType:'json',
			success:function(data){
				alert(data.msg);
				location.reload();
			}
		});
	}
</script>
<body>
	<%@include file="commen/commen.jsp"%>
	<div id="header"><%@include file="commen/top.jsp"%></div>
	<div id="nav">
		<%@ include file="commen/navigation.jsp"%>
	</div>
	<div id="section">
		<div id="section_top">
		<form action="selectComments.action" method="get">
			<span>状态：</span>
			<input type="hidden" name="currPage" value="1">
			<select name="status">
				<option value="0" <c:if test="${comstatus=='0' }">selected="selected"</c:if> >所有评价</option>
				<option value="待审核" <c:if test="${comstatus=='待审核' }">selected="selected"</c:if> >待审核评价</option>
				<option value="已通过" <c:if test="${comstatus=='已通过' }">selected="selected"</c:if> >已通过评价</option>
				<option value="未通过" <c:if test="${comstatus=='未通过' }">selected="selected"</c:if> >未通过评价</option>
			</select>
			<input type="submit" value="查询">
		</form>
		</div>
		<hr>
		<div id="section_content">
					<table width="1000px" cellspacing="0" style="text-align: center;font-size: 12px;">
						<tr height="33px">
							<th>评论编号</th>
							<th>评价时间</th>
							<th>状态</th>
							<th>评分</th>
							<th>评价内容</th>
							<th>管理员回复</th>
							<th width="100px">操作</th>
						</tr>
						<c:forEach items="${cPageBean.list }" var="comment">
						<tr height="99px">
							<td>${comment.id }</td>
							<td><fmt:formatDate value="${comment.commenttime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td>${comment.status }</td>
							<td>${comment.score }</td>
							<td>${comment.commetcontent }</td>
							<td>
								<span>${comment.commentreply }</span>
								<div style="display: none;">
								<input type="hidden" name="status">
								<textarea rows="3" cols="25"></textarea>
								</div>
							</td>
							<td>
								<c:choose>
								<c:when test="${comment.status=='待审核' }">
									<a href="javascript:void(0)" onclick="addreply(1,this)">通过</a>
									<a href="javascript:void(0)" onclick="addreply(2,this)">驳回</a>
									<button onclick="fix(this)" style="display: none;font-size: 12px;" id="bt">提交</button>
								</c:when>
								<c:otherwise>
									暂无操作
								</c:otherwise>
								</c:choose>
							</td>
						</tr>
						</c:forEach>
					</table>
		</div>
		<div id="bottom">
		<c:if test="${cPageBean.totalCount!=0 }">
			第${cPageBean.currPage }/${cPageBean.totalPage}页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			总记录数:${cPageBean.totalCount }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			每页显示的记录数:${cPageBean.pageSize }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<c:if test="${cPageBean.currPage !=1}">
					<a
						href="${pageContext.request.contextPath }/selectComments.action?status=${comstatus }&currPage=1">首页</a>
					<a
						href="${pageContext.request.contextPath }/selectComments.action?status=${comstatus }&currPage=${cPageBean.currPage-1}">上一页</a>
				</c:if> <c:forEach var="i" begin="1" end="${cPageBean.totalPage }">
					<c:if test="${cPageBean.currPage!=i }">
						<a
							href="${pageContext.request.contextPath }/selectComments.action?status=${comstatus }&currPage=${i }">[${i
							}]</a>
					</c:if>
					<c:if test="${cPageBean.currPage==i }">[${i }]</c:if>
	
				</c:forEach> <c:if test="${cPageBean.currPage!=cPageBean.totalPage }">
					<a
						href="${pageContext.request.contextPath }/selectComments.action?status=${comstatus }&currPage=${cPageBean.currPage+1}">下一页</a>
					<a
						href="${pageContext.request.contextPath }/selectComments.action?status=${comstatus }&currPage=${cPageBean.totalPage}">尾页</a>
				</c:if>
		</c:if>
		</div>
	</div>
</body>
</html>
