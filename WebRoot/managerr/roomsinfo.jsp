<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>index</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/commen.css" />
<script src="${pageContext.request.contextPath }/js/jquery-3.3.1.js"></script>
</head>
<style>
	#content {
		margin-top: 50px;
		margin-left: 50px;
	}
</style>
<script type="text/javascript">
	function addroom(data){
		$(data).hide();
		$(data).next().hide();
		$(data).prev().show();
		$(".top a").hide();
		$("#t1").hide();
		$("#t1").hide().next().hide();
		$("#form2").attr("action",'${pageContext.request.contextPath }/insertRoom.action');
		$("#form2").show();
	}
	
	function fixroom(data){
		var father = $(data).parent().parent();
		var roomid = $(father).children("td").eq(0).html();
		var roomtypeid = $(father).children("td").eq(1).html();
		var discription = $(father).children("td").eq(5).html();
		$("#form2 input[name='roomid']").val(roomid);
		$("#form2 select").val(roomtypeid);
		$("#form2 textarea").val(discription);
		$("#form2 input[type='hidden']").val(roomid);
		$(".top a").hide();
		$(".top span:nth-child(2)").show();
		$(".top form").hide();
		$("#t1").hide();
		$("#t1").hide().next().hide();
		$("#form2").attr("action",'${pageContext.request.contextPath }/updateRoom.action');
		$("#form2").show();
	}
	
	function fixprice(){
		$(".top a").hide();
		$(".top span:nth-child(1)").show();
		$(".top form").hide();
		$("#t1").hide();
		$("#t1").hide().next().hide();
		$.ajax({
			type:'get',
			url:'${pageContext.request.contextPath }/queryPrice.action',
			dataType:'json',
			success:function(data){
				$(".top").append("<table width='425px' cellspacing='0' ></table>");
				$(data.list).each(function(index,item){
					$(".top table").append("<form action='${pageContext.request.contextPath }/updatePrice.action' method='post' ><tr><td>"+item.roomtype+"：&nbsp;&nbsp;</td><td><input type='hidden' value="+item.roomtypeid+" name='roomtypeid'><input type='text' value="+item.price+" name='price'></td><td>&nbsp;&nbsp;<input type='submit' value='修改'></td></tr></form>");
				});
				$(".top table").append("<tr><td colspan='3'><a href='javascript:location.reload()'>返回</a></td></tr>");
			}
		});
	}
</script>
<body>
	<%@include file="commen/commen.jsp"%>
	<%@include file="commen/top.jsp"%>
	<div style="position: absolute;">
		<%@ include file="commen/navigation.jsp"%>
	</div>
	<div id="section">
		<div id="content">
			<div class="top">
			<span style="font-size: 20px;margin-left: 100px;font-weight: bold;display: none;">修改房价</span>
			<span style="font-size: 20px;margin-left: 200px;font-weight: bold;display: none;">修改客房</span>
			<a href="javascript:void(0);" onclick="fixprice();" style="float: right;margin-right: 20px;">修改房价</a>
			<span style="font-size: 20px;margin-left: 200px;font-weight: bold;display: none;">新增客房</span>
			<a href="javascript:void(0);" onclick="addroom(this);" style="float: right;margin-right: 20px;">新增客房</a>
			<form action="${pageContext.request.contextPath }/selectRooms.action?" method="get">
				<span>房间类型：</span>
				<select name="roomtypeid">
					<option value="0" <c:if test="${roomVo.roomtypeid=='0' }">selected="selected"</c:if> >请选择</option>
					<option value="1" <c:if test="${roomVo.roomtypeid=='1' }">selected="selected"</c:if> >单人间</option>
					<option value="2" <c:if test="${roomVo.roomtypeid=='2' }">selected="selected"</c:if> >双人间</option>
					<option value="3" <c:if test="${roomVo.roomtypeid=='3' }">selected="selected"</c:if> >三人间</option>
					<option value="4" <c:if test="${roomVo.roomtypeid=='4' }">selected="selected"</c:if> >棋牌室</option>
				</select>
				<span>楼层：</span>
				<select name="roomid">
					<option value="0" <c:if test="${roomVo.roomid=='0' }">selected="selected"</c:if> >请选择</option>
					<option value="G2" <c:if test="${roomVo.roomid=='G2' }">selected="selected"</c:if> >二楼</option>
					<option value="G3" <c:if test="${roomVo.roomid=='G3' }">selected="selected"</c:if> >三楼</option>
					<option value="G4" <c:if test="${roomVo.roomid=='G4' }">selected="selected"</c:if> >四楼</option>
					<option value="G5" <c:if test="${roomVo.roomid=='G5' }">selected="selected"</c:if> >五楼</option>
					<option value="G6" <c:if test="${roomVo.roomid=='G6' }">selected="selected"</c:if> >六楼</option>
				</select>
				<input type="hidden" name="currPage" value="1">
				<input type="submit" value="查询">
			</form>
			</div>
			<hr>
			<table width="1000px" border="solid" bordercolor="black" cellspacing="0" style="text-align: center;" id="t1">
				  <tr>
				    <th width="15%">房间号</th>
				    <th width="15%">类型</th>
				    <th width="15%">价格</th>
				    <th width="35%">描述</th>
				    <th width="20%">操作</th>
				  </tr>
				  <c:forEach var="rooms" items="${pageBean.list }">
				  <tr height="65px">
				    <td>${rooms.roomid }</td>
				    <td style="display: none;">${rooms.roomtypeid }</td>
				    <td>${rooms.roomtype }</td>
				    <td style="display: none;">暂无图片</td>
				    <td>${rooms.price }</td>
				    <td>${rooms.description }</td>
				    <td>
				    	<a href="javascript:void(0)" onclick="fixroom(this);">修改信息`</a>
				    </td>
				   </tr>
				   </c:forEach>
			</table>
			<c:if test="${pageBean.list.size()>0 }">
			<div id="bottom">
			第${pageBean.currPage }/${pageBean.totalPage}页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			总记录数:${pageBean.totalCount }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			每页显示的记录数:${pageBean.pageSize }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<c:if test="${pageBean.currPage !=1}">
					<a
						href="${pageContext.request.contextPath }/selectRooms.action?currPage=1&roomid=${roomVo.roomid }&roomtypeid=${roomVo.roomtypeid}">首页</a>
					<a
						href="${pageContext.request.contextPath }/selectRooms.action?roomid=${roomVo.roomid }&roomtypeid=${roomVo.roomtypeid}&currPage=${pageBean.currPage-1}">上一页</a>
				</c:if> <c:forEach var="i" begin="1" end="${pageBean.totalPage }">
					<c:if test="${pageBean.currPage!=i }">
						<a
							href="${pageContext.request.contextPath }/selectRooms.action?roomid=${roomVo.roomid }&roomtypeid=${roomVo.roomtypeid}&currPage=${i }">[${i
							}]</a>
					</c:if>
					<c:if test="${pageBean.currPage==i }">[${i }]</c:if>
	
				</c:forEach> <c:if test="${pageBean.currPage!=pageBean.totalPage }">
					<a
						href="${pageContext.request.contextPath }/selectRooms.action?roomid=${roomVo.roomid }&roomtypeid=${roomVo.roomtypeid}&currPage=${pageBean.currPage+1}">下一页</a>
					<a
						href="${pageContext.request.contextPath }/selectRooms.action?roomid=${roomVo.roomid }&roomtypeid=${roomVo.roomtypeid}&currPage=${pageBean.totalPage}">尾页</a>
				</c:if>
			</div>
			</c:if>
			<form method="post" id="form2" style="display: none;">
				<table width="425px" cellspacing="0">
					<tr>
						<td style="text-align: right;">房间号：</td>
						<td><input type="text" name="roomid"> </td>
					</tr>
					<tr>
						<td style="text-align: right;">类型：</td>
						<td>
							<select name="roomtypeid">
								<option value="1">单人间</option>
								<option value="2">双人间</option>
								<option value="3">三人间</option>
								<option value="4">棋牌室</option>
							</select>
						</td>
					</tr>
					<tr>
						<td style="text-align: right;">描述：</td>
						<td><textarea rows="5" cols="50" name="description"></textarea> </td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;">
							<input type="hidden" name="oldroomid">
							<input type="submit" value="提交">
							<a href="javascript:location.reload();">返回</a>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>
