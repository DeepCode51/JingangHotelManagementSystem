<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>会员商城</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/commen.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/memberShop.css" />
<script src="${pageContext.request.contextPath }/js/jquery-3.3.1.js"></script>
</head>
<style>
	tr{
		height: 50px;
	}

</style>
<script type="text/javascript">
	function fix(data,status){
		var table = $(data).parent().parent().parent();
		var goodsname=$(data).parent().parent().children("td").eq(0).html();
		var score = $(data).parent().parent().children("td").eq(1).html();
		var goodsid= $(data).parent().parent().children("td").eq(2).html();
		$("#form2").children("div").html("商品修改");
		$("#form2").attr('action','${pageContext.request.contextPath }/updateGoods.action');
		$("input[name='goodsname']").val(goodsname);
		$("input[name='score']").val(score);
		$("input[name='goodsid']").val(goodsid);
		$("select").val(status);
		$("#add").hide();
		$("#tablelist").hide();
		$("#form2").show();
	}
	
	function add(){
		$("#add").hide();
		$("#form2").children("div").html("商品添加");
		$("#form2").attr('action','${pageContext.request.contextPath }/insertGoods.action');
		$("input[name='goodsname']").val("");
		$("input[name='score']").val("");
		$("input[name='goodsid']").val("");
		$("select").val(0);
		$("#tablelist").hide();
		$("#form2").show();
	}
	function changeimg(data){
		$(data).hide();
		$(data).parent().parent().children("td").children("span").hide();
		$(data).parent().parent().children("td").children("form").show();
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
			<a href="${pageContext.request.contextPath }/selectMembers.action?currPage=1&phone=&username=&rankid=">会员信息</a>
			丨
			<a href="${pageContext.request.contextPath }/findGoodsByPage.action?currPage=1&status=0">会员商品信息</a>
			丨
			<a href="${pageContext.request.contextPath }/selectRanks.action">会员折扣</a>
		</div>
		<hr>
		<a href="javascript:void(0);" onclick="add()" style="margin-left: 20px;" id="add">商品添加</a>
		<table width="1000px" style="text-align: center;" id="tablelist">
			<tr>
				<th width="20%">商品名</th>
				<th width="20%">所需积分</th>
				<th width="20%">图片</th>
				<th width="10%">状态</th>
				<th width="30%">操作</th>
			</tr>
			<c:forEach var="goods" items="${goodspageBean.list }">
					<tr>
						<td>${goods.goodsname }</td>
						<td>${goods.score }</td>
						<td style="display: none;">${goods.goodsid }</td>
						<td>
							<span>
							<c:choose>
								<c:when test="${goods.img!=null and goods.img!='' }">
									<img src="/img/jingangHotel/goods/${goods.img }">
								</c:when>
								<c:otherwise>
									暂无图片
								</c:otherwise>
							</c:choose>
							</span>
							<form action="${pageContext.request.contextPath }/addOrUpdateImg.action" enctype="multipart/form-data" method="post" style="display: none;">
								<input type="hidden" name="goodsid" value="${goods.goodsid }"> 
								<input type="hidden" name="currPage" value="${goodspageBean.currPage}"> 
								<input type="file" style="font-size: 10px;" name="file" required>
								<input type="submit" value="修改" style="font-size: 10px;">
								<a href="javascript:location.reload();" style="font-size: 10px;">取消</a>
							</form>
						</td>
						<td>
							<c:choose>
								<c:when test="${goods.status==0 }">
									上架
								</c:when>
								<c:otherwise>
									下架
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							<a href="${pageContext.request.contextPath }/updateGoodsStatus.action?goodsid=${goods.goodsid }&status=${goods.status}&currPage=${goodspageBean.currPage}">
							<c:choose><c:when test="${goods.status==1 }">上</c:when><c:otherwise>下</c:otherwise></c:choose>架
							</a>
							&nbsp;&nbsp;<a href="javascript:void(0)" onclick="fix(this,'${goods.status }')">修改商品</a>
							&nbsp;&nbsp;<a href="javascript:void(0)" onclick="changeimg(this)">更换图片</a>
						</td>
					</tr>
			</c:forEach>
			<tr>
				<td colspan="5" align="center">第${goodspageBean.currPage }/${goodspageBean.totalPage
					}页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					总记录数:${goodspageBean.totalCount }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					每页显示的记录数:${goodspageBean.pageSize }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<c:if test="${goodspageBean.currPage !=1}">
						<a
							href="${pageContext.request.contextPath }/findGoodsByPage.action?currPage=1&status=0">首页</a>
						<a
							href="${pageContext.request.contextPath }/findGoodsByPage.action?currPage=${goodspageBean.currPage-1}&status=0">上一页</a>
					</c:if> <c:forEach var="i" begin="1" end="${goodspageBean.totalPage }">
						<c:if test="${goodspageBean.currPage!=i }">
							<a
								href="${pageContext.request.contextPath }/findGoodsByPage.action?currPage=${i }&status=0">[${i
								}]</a>
						</c:if>
						<c:if test="${goodspageBean.currPage==i }">[${i }]</c:if>

					</c:forEach> <c:if test="${goodspageBean.currPage!=goodspageBean.totalPage }">
						<a
							href="${pageContext.request.contextPath }/findGoodsByPage.action?currPage=${goodspageBean.currPage+1}&status=0">下一页</a>
						<a
							href="${pageContext.request.contextPath }/findGoodsByPage.action?currPage=${goodspageBean.totalPage}&status=0">尾页</a>
					</c:if>
				</td>
			</tr>
		</table>
		<form action="" method="post" style="display: none;" id="form2">
			<div style="margin-left: 200px;"></div>
			<table width="600px" height="300px" style="text-align: center;" cellspacing="0">
				<tr>
					<td>商品名</td>
					<td><input type="text" name="goodsname"></td>
				</tr>
				<tr>
					<td>所需积分</td>
					<td><input type="text" name="score"></td>
				</tr>
				<tr>
					<td>状态</td>
					<td>
						<select name="status">
							<option value="0">上架</option>
							<option value="1">下架</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="hidden" name="goodsid">
						<input type="submit" value="提交">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="javascript:location.reload();">返回</a>
					</td>
				</tr>
			</table>
		</form>
 	</div>
</body>
</html>
