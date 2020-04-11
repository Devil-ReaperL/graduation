function allOrder(id,url) {
	$.ajax({
		 type: "post",
      url: url,
      data:{"user":id
   	   },
      success: function(data){
    	  orderFormat(data)
     		$('html,body').animate({scrollTop: '0px'}, 800);
      },
      error: function(XMLHttpRequest,textStatus){
     	 alert("请求失败")

      }
	 })
	 return false;
}
function waitPayment(id,url) {
	$.ajax({
		 type: "post",
       url: url,
       data:{"user":id,
    	   	 "status":''
    	   },
       success: function(data){
    	   console.log(data)
    	   orderFormat(data)
      		$('html,body').animate({scrollTop: '0px'}, 800);
       },
       error: function(XMLHttpRequest,textStatus){
      	 alert("请求失败")

       }
	 })
	 return false;
}
function statusTran(status) {
	if(status==null)
	{
		return "待支付"
	}
	if(status==10)
	{
		return "等待发货"
	}
	if(status==0)
	{
		return "交易失败"
	}
	if(status==100)
	{
		return "交易完成"
	}
}
function orderFormat(data){
	console.log("1")
	$("#orderlist").empty();
   	var html=""
		if(data.length != 0)
			{
				console.log("2")
			   	
		   		for ( var i in data) {
		   			console.log(data[i])
		   			html=html+'<div class="my-order-list-head clearfix">'+
					'<div class="date" style="width: 200px;">'+data[i].addtime+'</div>'+
					'<div class="no">订单号：<a href="/shop/order/show/id/216160/" class="red">'+data[i].id+'</a>'+
					'</div>'+
					'<div class="info">	'+						
							'<span style="color:red;">'+
							statusTran(data[i].status)+
							'</span>'+			
					'</div>'+
				'</div>'+
				'<div class="my-order-list-body clearfix">'+
					'<div class="my-order-list-item">'
				for ( var k in data[i].pList) {
					html=html+'<div class="my-order-list-goods clearfix">'+					
					'<div class="img">'+
						'<a href="${pageContext.request.contextPath}/product/info/'+data[i].pList[k].product_id+'">'+
							'<img src="/image/'+data[i].pList[k].product_src+'" width="60" height="60" />'+
						'</a>'+
					'</div>'+
					'<div class="name">'+
						'<h3><a href="${pageContext.request.contextPath}/product/info/'+data[i].pList[k].product_id+'" target="_blank">'+data[i].pList[k].product_name+'</a></h3>'+
						'<ul class="clearfix">'+
							
						'</ul>'+
					'</div>'+
					'<div class="price">'+						
						'<p><b>&yen;'+data[i].pList[k].price+'</b></p>'+
					'</div>'+
					'<div class="num">'+data[i].pList[k].num+'</div>'+
					'<div class="coupon">'+				
					'</div>'+
					'<div class="note"><p></p></div>'+
				'</div>'
				}
		   			html=html+
						'<div class="my-order-list-info">'+
							'<p>送达时间：'+data[i].order_logistics.delivery_time+' '+data[i].order_logistics.segment+'<br />'+
								'订货电话：'+data[i].phonenum+'<br />'+
								'留言信息：<br />'+
								data[i].message+'</p>'+
								'<ul class="clearfix">'+
								'<li><label>收货电话：</label>'+data[i].address.phonenum+'</li>'+								
								'</ul>'+
							'<ul class="clearfix">'+
								'<li>'+
									'<label>收货地址：</label> '+
									data[i].address.province+' '+
									data[i].address.city+' '+
									data[i].address.county+' '+
									data[i].address.details+' '+
								'</li>'+
							'</ul>'+
						'</div>'+
					'</div>'+
					'<div class="my-order-list-action">'+
						'<ul class="clearfix">'+
							'<li><label>商品总价：</label>&yen; '+data[i].count_price+'</li>'+
							'<li><label>+运费：</label>&yen; 0.00</li>'+					
							'<li><label>订单支付金额：</label><b>&yen; '+data[i].count_price+'</b></li>'+
						'</ul>'+
						'<div class="but">'
						if(data[i].status == null)			
							{
								html=html+'<p><a href="${pageContext.request.contextPath}/shop/payment/'+data[i].id+'" class="block">立即支付</a></p>'
							}
						html=html+'	<p><a href="/shop/order/cancel/id/'+data[i].id+'" res="confirm">取消订单</a></p>'+				
							'<p><a href="/shop/order/show/id/216160/">查看订单</a></p>'+
						'</div>'+
					'</div>'+
				'</div>'			
				}
			}
		else{
			
			console.log("null")
			html=html+
			'<div class="error-box">'+
			'<div class="error-box box-info">对不起，当前没有任何订单！</div>'+
		'</div>'
		}
   	console.log(html)
	$("#orderlist").html(html)
}