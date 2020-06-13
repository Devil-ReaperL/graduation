<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title> 购物中心 &gt; 订单管理</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<META HTTP-EQUIV="pragma" CONTENT="no-cache"> 
	<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"> 
	<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/base.css" />
	  
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/other/panel.css" />

    <script type="text/javascript" src="${pageContext.request.contextPath}/JS/jquery-2.1.4.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/JS/order/order.js"></script>
	
</head>
<body class="bg">


<jsp:include page="/WEB-INF/jsp/head.jsp" flush="true" ></jsp:include>

<div class="wrap">
		<div class="wl240 bgfff khzx-menu">
			<div class="panel-group" id="accordion">
			<div class="panel panel-default">
				<div class="panel-heading">
						<dl class="active"><dt>
						<a data-toggle="collapse" data-parent="#accordion" 
						   href="#collapseOne" style="height:100%">
							<i class="icon km02"></i>订单信息<i class="icon km"></i>
						</a>
						</dt>
					</dl>
				</div>
				<div id="collapseOne" class="panel-collapse collapse in">
					<div class="panel-body">
						<a  class="active" href="javascript:;" onclick="allOrder('${user.phonenum}','${pageContext.request.contextPath}/shop/findorder')">全部订单</a>
						<a  href="javascript:;" onclick="waitPayment('${user.phonenum}','${pageContext.request.contextPath}/shop/findorder')">&nbsp待付款</a>
						<a  href="javascript:;" onclick="waitRemark('${user.phonenum}','${pageContext.request.contextPath}/shop/remarkinfo')">&nbsp待评价</a>
					</div>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
						<dl ><dt>
						<a data-toggle="collapse" data-parent="#accordion" 
						   href="#collapseTwo" style="height:100%">
							<i class="icon km02"></i>用户信息<i class="icon km"></i>
						</a>
						</dt>
					</dl>
				</div>
				<div id="collapseTwo" class="panel-collapse collapse ">
					<div class="panel-body">
						<a   href="javascript:;" ">全部订单</a>
						<a  href="javascript:;" >&nbsp待付款</a>
						<a  href="javascript:;" >&nbsp待评价</a>
					</div>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
						
				<dl>
					<dt><a res="1023" href="javascript:;" onclick="outUser()"><i class="icon km06"></i><span class="red">注销</span></a></dt>
				</dl>
				</div>
			</div>
			</div>
		</div>
		<div class="wr935 bgfff">	
				
			<div style="padding: 30px;" id="orderlist">
				<c:if test="${empty orders}">
				<div class="error-box">
					<div class="error-box box-info">对不起，当前没有任何订单！</div>
				</div>
				</c:if>
				<div class="my-order-list" >
					<c:forEach items="${orders}" var="order">
					<div class="my-order-list-head clearfix">
						<div class="date" style="width: 200px;">${order.addtime}</div>
						<div class="no">
							订单号：
							<a href="${pageContext.request.contextPath}/shop/order/show/id/${order.id}/" class="red">${order.id}</a>
						</div>
						<div class="info">							
								<span style="color:red;">
								<c:if test="${empty  order.status}">待支付</c:if>
								<c:if test="${order.status ==10}">等待发货</c:if>
								<c:if test="${order.status ==20}">正在配送</c:if>
								<c:if test="${order.status ==0}">交易失败</c:if>
								<c:if test="${order.status ==100}">交易完成</c:if>
								</span>			
							
						</div>
					</div>
					<div class="my-order-list-body clearfix">
						<div class="my-order-list-item">
							<c:forEach items="${order.pList}" var="product">
							<div class="my-order-list-goods clearfix">
								
								<div class="img">
									<a href="${pageContext.request.contextPath}/product/info/${product.product_id}">
										<img src="/image/${product.product_src}" width="60" height="60" />
									</a>
								</div>
								<div class="name">
									<h3><a href="${pageContext.request.contextPath}/product/info/${product.product_id}" target="_blank">${product.product_name}</a></h3>
									<ul class="clearfix">
										
									</ul>
								</div>
								<div class="price">
									
									<p><b>&yen;${product.price}</b></p>
								</div>
								<div class="num">${product.num}</div>
								<div class="coupon">
									
									
								</div>
								<div class="note"><p></p></div>
							</div>
							</c:forEach>
														
							<div class="my-order-list-info">
								<p>送达时间：${order.order_logistics.delivery_time} ${order.order_logistics.segment}<br />
									订货电话：${order.phonenum}<br />
									留言信息：<br />
									${order.message}</p>
									<ul class="clearfix">
									<li><label>收货电话：</label>${order.address.phonenum}</li>								
									</ul>
								<ul class="clearfix">
									<li>
										<label>收货地址：</label>
										${order.address.province}
										${order.address.city}
										${order.address.county}
										${order.address.details}
									</li>
								</ul>
							</div>
						</div>
						<div class="my-order-list-action">
							<ul class="clearfix">
								<li><label>商品总价：</label>&yen; ${order.count_price}</li>
								<li><label>+运费：</label>&yen; 0.00</li>
						
								<li><label>订单支付金额：</label><b>&yen; ${order.count_price}</b></li>
							</ul>
							<div class="but">
								<c:if test="${empty  order.status}">
									<p><a href="${pageContext.request.contextPath}/shop/payment/${order.id}" class="block">立即支付</a></p>							
									
								</c:if>	
								<c:if test="${order.status == 10 || order.status == 20}">
									<p><a href="${pageContext.request.contextPath}/shop/order/cancel/${order.id}" res="ajax">取消订单</a></p>										
								</c:if>
								
								<p><a href="${pageContext.request.contextPath}/shop/order/show/id/${order.id}/">查看订单</a></p>
						

							</div>
						</div>
					</div>
				

				
			</c:forEach>	
			</div>
		</div></div>
		<div class="clear"></div>
	</div>
	<jsp:include page="/WEB-INF/jsp/foot.jsp" flush="true" ></jsp:include>
	<input id="PageContext" hidden="hidden" value="${pageContext.request.contextPath}" >
</body>

<script type="text/javascript">
	$(function(){
		$('.panel-body a').click(function(){
			$('.panel-body a').removeClass('active');
			$(this).addClass('active');
			$(this).parent().parent().parent().find("dl").addClass('active');
		});
		$('.panel-heading a').click(function(){
			console.log(1);
			setTimeout(function (){$('.collapsed').parent().parent().removeClass('active');},100)
			
			$(this).parent().parent().addClass('active');
			
		});
		
		
	
		//$('.khzx-menu dl dd a[res=1003]').addClass('active').parent().parent().addClass('active');
	});
	
</script>

</html>
