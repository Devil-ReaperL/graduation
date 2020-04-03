<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>好花网 | 购物中心 &gt; 购物车</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/base.css" />

    <script type="text/javascript" src="${pageContext.request.contextPath}/JS/jquery-2.1.4.js"></script>
    <script type="text/javascript">
        function myadd(x){
            $.get('${pageContext.request.contextPath}/StockServlet',{
                "cartid":""+x+""
            },function (data) {
            	
                var  s=$('input[cartid='+x+']');
                if (parseInt(s.val())<parseInt(data))
                {
                    $('input[cartid='+x+']').val(parseInt(s.val())+1)
                }
                else
                {
                    confirm("已经达库存上限")
                }

            },'json')
        }
    </script>
    
    <script type="text/javascript">
            function numberminus(x) {
                $.get('${pageContext.request.contextPath}/StockServlet2',{
                    "cartid":""+x+""
                },function (date) {
                	
                    var s = $('input[cartid='+x+']');
                    if (parseInt(s.val()) > 1) {
                        $('input[cartid='+x+']').val(parseInt(s.val()) - 1)
                    }
                    else {
                        alert("数量应大于0")
                    }
                },'json')
            };


    </script>
</head>
<body>


<jsp:include page="/WEB-INF/jsp/head.jsp" flush="true" ></jsp:include>

<div class="wrap">

	
	
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
						<li class="ipt"><label class="checkbox"><input type="checkbox"  name="chk" value="${cart.product_id}"  /><span></span></label></li>
						<li class="img"><a href="${pageContext.request.contextPath}/product/info/${cart.product_id}"><img src="/image/${cart.picture}" width="100" height="100" /></a></li>
						<li class="txt">
							<h5>${cart.product_name}</h5>
							<p></p>
						</li>
					</ul>
				</div>
				<div class="cart-shop-price">
					<p class="price" id="price_1474">¥<span>${cart.price}</span></p>
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
					<li class="num">已选商品<span id="count">0</span>件</li>
					<li class="total">总计：<label class="price">¥<span>0.00</span></label></li>
					<li class="active"><a href="/shop/cart/order/">结算</a></li>
				</ul>
			</div>
		</div>

	
		<div class="h60"></div>
	</div>
    <div class="h60"></div>

<script>
$(document).ready(function() {
    document.getElementById("check").onclick = function(){
        var checked = document.getElementById("check").checked;
        var checkson =$("[type='checkbox']")
        if(checked){
            for(var i = 0; i < checkson.length ;i++){
                checkson[i].checked = true;
            }
        }else{
            for(var i = 0; i < checkson.length ;i++){
                checkson[i].checked = false;
            }
        }
    }
    
    
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
	        	 "status":"1",	        
	        	 },
	        success: function(data){
	       		console.log(data)
	       		//	$('#price_' + product_id+' span').text(result.data.items[product_id].real_total);
				//	$('.num span').text(result.data.total);
				//	$('.total .price span').text(result.data.real_price);
	       		alert(data)
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
