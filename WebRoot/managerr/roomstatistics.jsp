<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>统计信息</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/commen.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/roomstatistics.css" />
<script src="${pageContext.request.contextPath }/js/jquery-3.3.1.js"></script>
<script type="text/javascript">
	function qr(){
		var year = $("#year").val();
		var roomtype = $("#roomtype").val();
		$.ajax({
			type:'get',
			url:'${pageContext.request.contextPath }/selectStatistics.action?year='+year+'&roomtypeid='+roomtype,
			dataType:'json',
			success:function(data){
				$(data.list).each(function(index,item){
					$("#tb").children().eq(item.month-1).css("height",item.count*80);
					$("#num"+item.month).html(item.count);
				});
			}
		});
		$("#tb").show();
	}
	
	$(function(){
		for ( var i = 0; i < 12; i++) {
			$("#tb").children().eq(i).css("left",60*(i+1));
		}
		
	});
</script>
</head>
<style>
	#content {
		margin-top: 50px;
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
		<div id="content">
		<div>
			<span>请选择查询的年份</span>
			<select id="year">
				<option value="2016">2016</option>
				<option value="2017">2017</option>
				<option value="2018">2018</option>
			</select>
			<span>请选择查询的房间类型</span>
			<select id="roomtype">
				<option value="0">所有</option>
				<option value="1">单人间</option>
				<option value="2">双人间</option>
				<option value="3">三人间</option>
				<option value="4">棋牌室</option>
			</select>
			<a href="javascript:void(0)" onclick="qr()">查询</a>
		</div>
			<div id="tb">
				<div style="margin-left: -10px;" ><span class="num" id="num1"></span><span class="month">1月</span></div>
				<div><span class="num" id="num2"></span><span class="month">2月</span></div>
				<div><span class="num" id="num3"></span><span class="month">3月</span></div>
				<div><span class="num" id="num4"></span><span class="month">4月</span></div>
				<div><span class="num" id="num5"></span><span class="month">5月</span></div>
				<div><span class="num" id="num6"></span><span class="month">6月</span></div>
				<div><span class="num" id="num7"></span><span class="month">7月</span></div>
				<div><span class="num" id="num8"></span><span class="month">8月</span></div>
				<div><span class="num" id="num9"></span><span class="month">9月</span></div>
				<div><span class="num" id="num10"></span><span class="month">10月</span></div>
				<div><span class="num" id="num11"></span><span class="month">11月</span></div>
				<div><span class="num" id="num12"></span><span class="month">12月</span></div>
				<br>
				
			</div>
		</div>
	</div>
</body>
</html>
