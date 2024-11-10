<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>会员信息</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/commen.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/memberInfo.css" />
</head>

<body>
 <% User _user = (User)session.getAttribute("user");
	if(_user==null){
		out.print("<script type='text/javascript'>alert('请您先登录！');");
		out.print("window.location.href='"+request.getContextPath()+"/jsp/login.jsp'</script>");
		}else{
			if(_user.getMemberid()==null){
				out.print("<script type='text/javascript'>alert('抱歉，您还不是会员！');");
				out.print("window.location.href='"+request.getContextPath()+"'</script>");
				}
		}
		%>
	<div id="header"><%@include file="/commen/top.jsp"%></div>
	<div id="nav">
		<%@ include file="/commen/navigation.jsp"%>
	</div>
	<div id="section">
		<div id="section_top">
			<a href="${pageContext.request.contextPath }/findMemberInfo.action?currPage=1">会员个人信息</a>丨
			<a
				href="${pageContext.request.contextPath }/findGoodsByPage.action?currPage=1&status=1">会员商城</a>
		</div>
		<div id="section_content">
			尊敬的${memberInfoBean.list[0].username }先生，您是${memberInfoBean.list[0].rank }。您的会员积分信息如下：
			<table border="1px" cellspacing="0" bordercolor="lightyellow" width="1000px" style="text-align: center;">
				<tr>
					<th>操作时间</th>
					<th>状态</th>
					<th>物品名</th>
					<th>数量</th>
					<th>变动积分</th>
					<th>剩余积分</th>
				</tr>
				<c:forEach var="member" items="${memberInfoBean.list }">
					<tr>
						<td><fmt:formatDate type="date"
								value="${member.operatetime }" pattern="yyyy-MM-dd HH:mm:ss"/>
						</td>
						<td>${member.status }</td>
						<td><c:choose>
								<c:when test="${member.status == '获得' }">
								</c:when>
								<c:otherwise>
							${member.goodsname }
							</c:otherwise>
							</c:choose>
						</td>
						<td><c:choose>
								<c:when test="${member.status == '获得' }">
								</c:when>
								<c:otherwise>
							${member.number }
							</c:otherwise>
							</c:choose>
						</td>
						<td>${member.score }</td>
						<td>${member.restscore }</td>
					</tr>
				</c:forEach>
				<tr>
				<td colspan="6" align="center">第${memberInfoBean.currPage }/${memberInfoBean.totalPage
					}页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					总记录数:${memberInfoBean.totalCount }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					每页显示的记录数:${memberInfoBean.pageSize }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<c:if test="${memberInfoBean.currPage !=1}">
						<a
							href="${pageContext.request.contextPath }/findMemberInfo.action?currPage=1">首页</a>
						<a
							href="${pageContext.request.contextPath }/findMemberInfo.action?currPage=${memberInfoBean.currPage-1}">上一页</a>
					</c:if> <c:forEach var="i" begin="1" end="${memberInfoBean.totalPage }">
						<c:if test="${memberInfoBean.currPage!=i }">
							<a
								href="${pageContext.request.contextPath }/findMemberInfo.action?currPage=${i }">[${i
								}]</a>
						</c:if>
						<c:if test="${memberInfoBean.currPage==i }">[${i }]</c:if>

					</c:forEach> <c:if test="${memberInfoBean.currPage!=memberInfoBean.totalPage }">
						<a
							href="${pageContext.request.contextPath }/findMemberInfo.action?currPage=${memberInfoBean.currPage+1}">下一页</a>
						<a
							href="${pageContext.request.contextPath }/findMemberInfo.action?currPage=${memberInfoBean.totalPage}">尾页</a>
					</c:if>
				</td>
			</tr>
			</table>
		</div>
	</div>
</body>
</html>
