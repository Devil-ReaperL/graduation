<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>支付</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta   http-equiv="Expires"   CONTENT="0">     
	<meta   http-equiv="Cache-Control"   CONTENT="no-cache">     
	<meta   http-equiv="Pragma"   CONTENT="no-cache">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/base.css" />

    <script type="text/javascript" src="${pageContext.request.contextPath}/JS/jquery-2.1.4.js"></script>

</head>
<body>
<jsp:include page="/WEB-INF/jsp/head.jsp" flush="true" ></jsp:include>

	<div class="wrap">
		<div class="cart-order">
			<h2>立即支付</h2>
			<div class="cart-label">订单信息</div>
				<ul class="clearfix">
				
					<li style="float: left;"><label>订单号：</label>${order.id}</li>
				</ul>
				<div class="h20"></div>
				<ul class="clearfix">
					<li style="float: left;margin-left: 175px"><label>收货人：</label>${address.phonenum}</li>
				</ul>
				<div class="h20"></div>
				<ul class="clearfix">
					<li style="float: left;margin-left: 175px"><label>收货地址：
					</label>${address.province} - ${address.city}- ${address.county} - ${address.details}</li>
				</ul>
				<p class="mt10" style="line-height:25px;margin-left: 175px">送达时间：${time}<br />
					
					留言信息：${order.message}<br />
					</p>
				
			</div>
			<div class="h60"></div>
			<div class="cart-order">
				<div class="cart-label">商品列表</div>
				<div class="cart-body">		
				<c:forEach items="${carts}" var="cart">			
					<ul class="order-list-item clearfix">
						<li class="img">
							<a href="${pageContext.request.contextPath}/product/info/${cart.product_id}" target="_blank">
								<img src="/image/${cart.product_src}" width="70" height="70" />
							</a>
						</li>
						<li class="txt">
							<h5>
								${cart.product_name}
								<span></span>
							</h5>
						</li>
						<li class="price">¥<span>${cart.price}</span></li>
						<li class="num">${cart.num}</li>
					</ul>
					</c:forEach>
				</div>
				<div class="clear"></div>
			</div>
			<div class="h30"></div>
			<div class="cart-order">
				<div class="cart-label">选择支付方式</div>
				<div class="cart-body">

					<ul class="payment_list clearfix">
						
						<li data-id="9"
							data-name="微信支付"
							data-fee="0.00"
							data-price="426.00"
							data-url="${pageContext.request.contextPath}/shop/payment/${order.id}/9/">
							<img src="${pageContext.request.contextPath}/img/pay_wechat.gif" title="微信支付" width="126" height="41" />
							<i class="icon"></i>
						</li>
						<li data-id="6"
							data-name="支付宝"
							data-fee="0.00"
							data-price="${order.count_price}"
							data-url="${pageContext.request.contextPath}/shop/payment/${order.id}/6/">
							<img src="${pageContext.request.contextPath}/img/pay_alipay.gif" title="支付宝" width="126" height="41" />
							<i class="icon"></i>
						</li>			
					</ul>
					
				</div>
				<div class="clear"></div>
			</div>

			<div class="h10"></div>
			<div class="cart-order">
				<div class="cart-label">支付金额</div>
				<div class="cart-body order-submit">
					<p class="price tl"><b>¥<span>${order.count_price}</span></b></p>
					<p class="tl"><button type="button" class="pay-submit">立即支付</button></p>
				</div>
			</div>

			<div class="h60"></div>

		</div>

		<div class="h60"></div>
	</div>


	<script type="text/javascript">
	$(function(){
		
		
		$('.khzx-menu dl dt a').click(function(){
			$('.khzx-menu dl').removeClass('active');
			$(this).parent().parent().addClass('active');
		});
		//动态生成
		$('.khzx-menu dl dd a[res=1003]').addClass('active').parent().parent().addClass('active');

		$('ul.payment_list li').click(function(){
			$('ul.payment_list li').removeClass('active');
			$(this).addClass('active');
			$('#payment_name').text( $(this).data('name') );
			$('#payment_fee').text($(this).data('fee') );
			$('#payment_price').text($(this).data('price') );
			if( $(this).data('price')!= "426.00")
				$('.cart_list .fee').show();
			else
				$('.cart_list .hide').hide();
		});

		$('ul.payment_list li:first').click();


		$('.pay-submit').click(function(){
			if( $('ul.payment_list li.active').length==0 ){
				app.tools.info( '请选择支付方式！');
				return;
			}
			location.href = $('ul.payment_list li.active').data('url');
		});

	});
	
	</script>
	
</body>


</html>
