<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>好花网 | 购物中心 &gt; 购物车</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<META HTTP-EQUIV="pragma" CONTENT="no-cache"> 
	<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"> 
	<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/base.css" />
	  
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/other/panel.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/other/orderinfo.css" />

    <script type="text/javascript" src="${pageContext.request.contextPath}/JS/jquery-2.1.4.js"></script>
    
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
						<dt>
					</dl>
				</div>
				<div id="collapseOne" class="panel-collapse collapse in">
					<div class="panel-body">
						<a  class="active" href="javascript:;" onclick="allOrder('${user.phonenum}','${pageContext.request.contextPath}/shop/findorder')">全部订单</a>
						<a  href="javascript:;" onclick="waitPayment('${user.phonenum}','${pageContext.request.contextPath}/shop/findorder')">&nbsp待付款</a>
						<a  href="javascript:;" onclick="waitRemark('${user.phonenum}','${pageContext.request.contextPath}/shop/findorder')">&nbsp待评价</a>
					</div>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
						<dl ><dt>
						<a data-toggle="collapse" data-parent="#accordion" 
						   href="#collapseTwo" style="height:100%">
							<i class="icon km02"></i>订单信息<i class="icon km"></i>
						</a>
						<dt>
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
					<dt><a res="1023" href="#" onclick="outUser()"><i class="icon km06"></i><span class="red">注销</span></a></dt>
				</dl>
				</div>
			</div>
			</div>
		</div>
		<div class="wr935 bgfff">		
					
			<div style="padding: 30px;" id="orderlist">
							
				<div class="my-order-show">					
					<dl>
						<dt>订单信息</dt>
						<dd><label>订单编号：</label>${order.id}</dd>
						<dd><label>订单金额：</label><b>&yen; ${order.count_price}</b></dd>
						<dd><label>下单日期：</label>${order.addtime}</dd>
						<dd><label>更新日期：</label>2020-04-11 17:18:34</dd>
						<dd>
							<label>状态：</label>	
									<c:if test="${empty  order.status}">												
									<a href="/shop/order/payment/order/216165/" class="block">立即支付</a>
									<a href="/shop/order/cancel/id/216165/" res="confirm">取消订单</a>
									</c:if>	
									<c:if test="${not empty  order.status}">
									<a href="/shop/order/cancel/id/216165/" res="confirm">删除订单</a>
									</c:if>
									<span style="color:red;">									
										<c:if test="${empty  order.status}">待支付</c:if>
										<c:if test="${order.status ==10}">等待发货</c:if>
										<c:if test="${order.status ==0}">交易失败</c:if>
										<c:if test="${order.status ==100}">交易完成</c:if>
									</span>			
						</dd>
						
					</dl>

				</div>

				<div class="my-order-show-goods">
					<div class="my-order-show-goods-head clearfix">
						<div class="img">&nbsp;</div>
						<div class="name">商品名称</div>
						<div class="price">售价</div>
						<div class="num">数量</div>
						<div class="coupon">优惠</div>
						<div class="note">备注</div>
					</div>
					<div class="my-order-show-goods-body">
						<c:forEach items="${order.pList}" var="product">
						<div class="my-order-show-goods-item clearfix">
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
					</div>
					<!--<div class="my-order-show-goods-info"></div>-->
				</div>

				<div class="my-order-show">

					<dl>
						<dt>收件人信息</dt>
						<dd><label>收件人：</label>${order.address.phonenum}</dd>
						<dd><label>地址：</label>${order.address.province} - ${order.address.city}- ${order.address.county} - ${order.address.details}</dd>												
					</dl>				
					<dl>
						<dt>会员备注</dt>
						<dd>送达时间：${order.order_logistics.delivery_time} ${order.order_logistics.segment}<br />
						订货电话：${order.phonenum}<br />
						留言信息：<br />
						${order.message}
						</dd>
					</dl>
					<dl>
						<dt>结算信息</dt>
						<dd><label>商品总价：</label>&yen; ${order.count_price}</dd>
						<dd><label>+运费：</label>&yen; 0.00</dd>																							
						<dd><label>订单支付金额：</label><b>&yen; ${order.count_price}</b></dd>
					</dl>
				</div>
			</div>
		</div>
		<div class="clear"></div>
	</div>
	
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
<script type="text/javascript" src="${pageContext.request.contextPath}/JS/order/order.js"></script>
	
</html>
