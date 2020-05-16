<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>好花网 | 购物中心 &gt; 购物车</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/base.css" />

    <script type="text/javascript" src="${pageContext.request.contextPath}/JS/jquery-2.1.4.js"></script>

</head>
<body>


<jsp:include page="/WEB-INF/jsp/head.jsp" flush="true" ></jsp:include>

<div class="wrap" style="min-height: 300px">

	<c:if test="${not empty carts}">
	
		<div class="cart-list">

			<div class="cart-list-bar">
				<ul class="clearfix">
					<li class="cart-shop-name">商品名称</li>
					<li class="cart-shop-price">单价</li>
					<li class="cart-shop-num">数量</li>
					<li class="cart-shop-active">操作</li>
				</ul>
			</div>

			<c:forEach items="${carts}" var="cart">
			<div class="cart-list-item">
				<div class="cart-shop-name">
					<ul class="clearfix">
						<li class="ipt"><label class="checkbox"><input type="checkbox"  ${cart.status}  name="chk" value="${cart.product_id}"  /><span></span></label></li>
						<li class="img"><a href="${pageContext.request.contextPath}/product/info/${cart.product_id}"><img src="/image/${cart.picture}" width="100" height="100" /></a></li>
						<li class="txt">
							<h5>${cart.product_name}</h5>
							<p></p>
						</li>
					</ul>
				</div>
				<div class="cart-shop-price">
					<p class="price" id="price_${cart.product_id}">¥<span>${cart.price}</span></p>
				</div>
				<div class="cart-shop-num clearfix">
					<a href="javascript:;">-</a><input type="text" name="goods_num" value="${cart.num}" readonly="true" data-max=${cart.stock} data-uid="${user.phonenum}" data-pid="${cart.product_id}"  data-price="${cart.price}"/><a href="javascript:;">+</a>
					
				</div>
				<div class="cart-shop-active" style="text-align: center;"><span>
					<a href="javascript:;" data-url="${pageContext.request.contextPath}/user/cartdelete/${user.phonenum}/${cart.product_id}" res="ajax">删除</a><br />			
				</span>
				</div>
				<div class="clear"></div>
			</div>
			</c:forEach>

		</div>
	
		<div class="cart-list">
			<div class="cart-list-footer">
				<ul class="clearfix">
					<li class="ipt"><label class="checkbox"><input id="check" type="checkbox" name="chkall" value="1" /><span></span>全选</label></li>
					<li class="num">已选商品<span id="count">${cart_info.checked}</span>件</li>
					<li class="total">总计：<label class="price">¥<span>${cart_info.sum}</span></label></li>
					<li class="active"><a href="${pageContext.request.contextPath}/shop/into_order">结算</a></li>
				</ul>
			</div>
		</div>

	</c:if>
	<c:if test="${empty carts}">
	<div class="error-box">
			<div class="error-box box-info">对不起，当前购物车里没有任何商品！</div>
			<div class="error-box box-but">
				<a href="javascript:history.back();">继续购物</a>
			</div>
		</div>
	</c:if>
		<div class="h60"></div>
	</div>
	
    <div class="h60"></div>
<jsp:include page="/WEB-INF/jsp/foot.jsp" flush="true" ></jsp:include>
<script>
$(document).ready(function() {
	$("input[type=checkbox][name=chkall]").click(function(){
		$("input[type=checkbox][name=chk]").prop('checked', $(this).prop('checked'));
		$.ajax({
			 type: "post",
	        url: "${pageContext.request.contextPath}/shop/cartcheck",
	        data:{
	        	// "product_id": $(input).data('pid'),
	        	 "status": $(this).prop('checked') ? "checked" : 0,	        
	        	 },
	        success: function(data){
	       		console.log(data)
	       	
	        },
	        error: function(XMLHttpRequest,textStatus){
	       	 alert("请求失败"+textStatus)
	 
	        }
		 })
	});
	$("input[type=checkbox][name=chk]").click(function(){
		var input = $(this).parent().parent().parent().parent().parent().find('input[name=goods_num]');
		update_goods(input, $(input).val(), $(this).prop('checked') ? "checked" : 0);
	});
    
    $("[type='checkbox']").click(function(){
    	var checkson=$("[name='chk']:checked")
    	$("#count").text(checkson.length)
    });
   
	$(".cart-shop-num a").click(function(){
		var v = $(this).text()=='-' ? -1 : 1;
		$(this).parent().find("input[name=goods_num]").val(function(index,val){
			val = parseInt(val) + v;
			var max = parseInt($(this).data('max'));
			if( val<1 ) val = 1;
			if( val>max ) val = max;
			update_goods(this, val, '');
			return val;
		});
	});
	function update_goods( input, num, selected ){
		$.ajax({
			 type: "post",
	        url: "${pageContext.request.contextPath}/user/cartupdata",
	        data:{"phonenum": $(input).data('uid'),
	        	 "product_id": $(input).data('pid'),
	        	 "num":num,
	        	 "price":$(input).data('price'),
	        	 "status":selected,	        
	        	 },
	        success: function(data){
	       		console.log(data)
	       		console.log(data.cart_info.sum)
	       		//	$('#price_' + product_id+' span').text(result.data.items[product_id].real_total);
				//	$('.num span').text(result.data.total);
					$('.total .price span').text(data.cart_info.sum);
				var product_id = $(input).data('pid');
				$('#price_' + product_id+' span').text(data.cart.price)
	        },
	        error: function(XMLHttpRequest,textStatus){
	       	 alert("请求失败"+textStatus)
	 
	        }
		 })
	}
});

</script>
</body>


</html>
