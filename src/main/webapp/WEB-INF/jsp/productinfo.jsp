<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<html>
<head>
    <title>鲜花速递网站-好花网!网上订鲜花,百株好花只取一朵精华</title>
    <meta name="keywords" content="鲜花，鲜花网，鲜花速递，网上订花，好花网" />
    <meta name="description" content="好花网, 百株好花只取一朵精华！好花网深知每一张订单都蕴含重大的意义，视口碑为生命，多年来专注鲜花速递行业，以感恩心态服务每一位客户。好花网赋予鲜花以文化、艺术的魅力，不断推出有故事的创新花束；好花网已经设计出超100多款花束，我们会持续引领花艺潮流，确保产品品质稳定如一！" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/base.css" />
	<link href="${pageContext.request.contextPath}/CSS/showDialog.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/CSS/jqzoom.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/CSS/other/nav.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/CSS/other/spinner.css" rel="stylesheet">

   
</head>
<body>
<jsp:include page="/WEB-INF/jsp/head.jsp" flush="true" ></jsp:include>
<br><br>
    <script type="text/javascript" src="${pageContext.request.contextPath}/JS/jquery.jqzoom.js"></script>
	 <script src="${pageContext.request.contextPath}/JS/jquery.spinner.js"></script>	
	 
<div class="wrap goods-box">
		<div class="wl470">
			<div class="shop-video-pic">
				<!---->
				<div class="shop-preview">
					<!---->
					<img src="/image/${product.srcs[0]}" jqimg="/image/${product.srcs[0]}" width="468" height="468" />
				</div>
			</div>
			<div class="shop-preview-item">
				<ul class="clearfix">
					<c:forEach items="${product.srcs}" var="src">
						<c:choose>
						   <c:when test="src eq product.srcs[0]">
						   		<li class="active"><img src="/image/${src}" jqimg="/image/${src}" width="100" height="100" /></li>					   
						   </c:when>
					   
						   <c:otherwise>
						   		<li ><img src="/image/${src}" jqimg="/image/${src}" width="100" height="100" /></li>					   
						   </c:otherwise>	
					   				  
						</c:choose>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="wr690">
			<h3 class="shop-title">${product.name}</h3>
			
			<div class="shop-price-block">
				<div class="left showbq">
					
					<p class="price1 clearfix"><span class="label">促销价</span><span class="y">¥</span><span class="price sell-val">${product.price}</span></p>
				</div>
				
			</div>

			<div class="shop-sellinfo">
				<ul class="clearfix">
					<li>访问：<span>${product.sales * 7 +3}</span></li>
					
				</ul>
			</div>

			<div class="shop-sellinfo">
				<ul class="clearfix">
					
					<li>销量：<span>${product.sales}</span></li>
					
				</ul>
			</div>
			<div class="shop-sellinfo">
				<ul class="clearfix">
					
					<li>评价：<span>${product.remark_count}</span></li>
					
				</ul>
			</div>
			


		
			<div class="h40"></div>
		
			<div class="shop-num">
				<dl class="clearfix">
					<dt>数量</dt>
					<dd><input name="stock" type="text" id="spinner" class="spinner form-control" maxlength="10" value="1"  
			  			style="width: 100px;font-size:20px;height:40px;
    					text-align: -webkit-center;" datestyle="int" data_max="${product.stock}"/></dd>
					<dd><span>（库存${product.stock}件）</span></dd>
				</dl>
			</div>
			<div class="h40"></div>
			<input name="goods_id" type="hidden" value="492" />
			<input name="product_id" type="hidden" value="" />
			<input name="product_key" type="hidden" value="" />
			<div class="shop-but">
				
				<a class="buy cartBuy" href="javascript:;" onclick="buyNow('${product.id}')">立即抢购</a>

			
				<a class="cart cartAdd" href="javascript:;" onclick="cartAdd('${product.id}')">加入购物车</a>
				

				<label class="bdsharebuttonbox">
					<a href="javascript:;" class="share bds_more" data-cmd="more"><i class="icon icon-share"></i>分享</a>
				</label>
				
			</div>
			<div class="shop-service">
				<dl class="clearfix">
					<dt><b>服务承诺</b>：</dt>
					<dd><a href="javascript:;" ><i class="icon icon-fs6"></i>1小时全国送达</a></dd>
					
					<dd><a href="javascript:;" ><i class="icon icon-fs3"></i>新鲜花材</a></dd>
					
					<dd><a href="javascript:;" ><i class="icon icon-fs7"></i>及时售后服务</a></dd>
				</dl>
			</div>
		</div>
		<div class="clear"></div>
	</div>

    <br/>
    <br/>
    
    
   
	<div class="wrap">
		<div class="wl277 ">
		
			<div class="box box-rxxh ">
				<div class="box-bar"><p class="box-bar-title">热销鲜花</p></div>
				<div class="box-con">
					<ul>
						<c:forEach items="${sales}" var="sale">																
						<li>
							<a class="imgbounce" href="/xianhua/46431.html" title="商品">
								<div class="img"><img src="/image/${sale.srcs[0]}" width="84" height="84" /></div>
								<div class="txt">
									<h5>${sale.name}</h5>
									<div class="price b"><span>¥</span>${sale.price}<label>人气${sale.sales}</label></div>
								</div>
								<div class="clear"></div>
							</a>
						</li>
						</c:forEach>
						<li>
							<a class="imgbounce" href="/xianhua/46064.html" title="商品">
								<div class="img"><img src="//www.haohua.com/upload/image/2019-06/13/19869_ef1a.jpg" width="84" height="84" /></div>
								<div class="txt">
									<h5>Full love浓情鲜花系列99枝黑纱红玫瑰+尤加利叶满天星</h5>
									<div class="price b"><span>¥</span>628.00<label>人气667</label></div>
								</div>
								<div class="clear"></div>
							</a>
						</li>
						
					</ul>
				</div>
			</div>
			<div class="h25"></div>


			<div class="autofixed" fixed=".wr893" style="width:277px;top:0;background-color:#fff;">
		
			
			</div>
		</div>
		<div class="wr893">

			<div class="shop-header autofixed">
				<ul id="myTab" class="nav nav-tabs clearfix">
					<li class="active">
						<a style="font-size: 18px" href="#home" data-toggle="tab">
							 商品详情
						</a>
					</li>
					<li><a style="font-size: 18px" href="#reward" data-toggle="tab">用户评价(<span>${product.remark_count}</span>)</a></li>
				</ul>
			</div>

			
			<div id="myTabContent" class="tab-content">
				<div class="tab-pane fade in active" id="home">
					<div class="h20"></div>
					<c:if test="${not empty product.summernote}">
						${product.summernote}
					</c:if>		
     		 	</div>
			
				<div class="tab-pane fade" id="reward">
				<div class="h60"></div>
				
				<div class="body-box yhpj">
				<c:if test="${product.remark_count==0}">
					<div style=" width: 100%;text-align: center;">
					<label>暂无评价</label>
					</div>
				</c:if>
				<c:if test="${product.remark_count>0}">
				
				<div class="body-haoping">
					
					<div class="left">
						<p>好评率</p>
						<div class="haoping-score">${product.ratio}%</div>
						<span class="star"><span class="star-score star-${product.star}"></span></span>
					</div>					
					<div class="right">
						<dl class="clearfix">
							<dt>大家都在说：</dt>
							
							<dd>送货速度<span>(199)</span></dd>
							<dd>花质量不错<span>(181)</span></dd>
							<dd>包装很好<span>(217)</span></dd>
							<dd>送花速度快<span>(217)</span></dd>
							<dd>性价比高<span>(217)</span></dd>
							<dd>值得推荐<span>(181)</span></dd>
							<dd>花很漂亮<span>(217)</span></dd>
							<dd>服务态度好<span>(202)</span></dd>
						</dl>
					</div>
					<div class="clear"></div>
				</div>

				<div class="bbs-ajax">
					
				<div class="bbs-list">
					<ul>
						<c:forEach items="${remarks}" var="remark"> 
						<li class="bbs-list-item">
							<div class="bbs-con">
								<div class="bbs-user clearfix">
									<span class="bbs-user-name">135****2310 </span>
									<span class="star"><span class="star-score star-${remark.rank}"></span></span>
								</div>
								<div class="bbs-body">
									<p>${remark.text}</p>
								</div>
								
								<div class="bbs-img">
									<ul class="clearfix">
										<c:if test="${not empty remark.srcs and fn:length(remark.srcs) >0}">
										<c:forEach items="${remark.srcs}" var="src">
											<li><img src="/remark/${src}" jqimg="/remark/${src}" style="max-width: 200px;max-height: 200px"  /></li>										
										</c:forEach></c:if>
									</ul>
									<div class="bbs-img-preivew"></div>
								</div>
								<div class="bbs-post">
									<img src="//www.haohua.com/theme/haohua.com/default/static/img/pos.png" style="width:auto;" />
									<span class="bbs-post-ip">${remark.address}</span>
									<span style="color: #b4babf; font-size: 12px;">${remark.time}</span>
								</div>
							</div>
							<div class="clear"></div>
						</li>
						</c:forEach>					
					</ul>
				</div>
				</c:if>
				</div>
			
			</div>
			
			</div></div></div></div>
		<!--  
<div class="wrap">
    <div class="h60"></div>
    <div class="body-box yhpj">
        <div class="body-box-bar"><span class="title">用户评价(840)</span></div>

        <div class="body-haoping">

            <div class="left">
                <p>好评率</p>
                <div class="haoping-score">${percent}</div>

                <span class="star"><span class="star-score star-${percent1}"></span></span>
            </div>
            <div class="right">
                <dl class="clearfix">
                    <dt>大家都在说：</dt>

                    <dd>送货速度<span>(84)</span></dd>
                    <dd>花质量不错<span>(92)</span></dd>
                    <dd>包装很好<span>(92)</span></dd>
                    <dd>送花速度快<span>(92)</span></dd>
                    <dd>性价比高<span>(92)</span></dd>
                    <dd>值得推荐<span>(84)</span></dd>
                    <dd>花很漂亮<span>(84)</span></dd>
                    <dd>服务态度好<span>(128)</span></dd>
                </dl>
            </div>
            <div class="clear"></div>
        </div>

        <div class="bbs-ajax">

            <div class="bbs-list">
                <ul>
                    <c:forEach items="${remarks}" var="remark">
                    <li class="bbs-list-item">
                        <div class="bbs-user-photo"></div><div class="bbs-user-photo"></div>
                        <div class="bbs-con">
                            <div class="bbs-user clearfix">
                                <span class="bbs-user-name">${remark.phonenum}</span>
                                <span class="star"><span class="star-score star-${remark.rank}"></span></span>
                            </div>
                            <div class="bbs-body">
                                <p>${remark.text}</p>
                            </div>

                            <div class="bbs-img">
                                <ul class="clearfix">
                                    <c:if test="${remark.remark_src ne null}">
                                    <li><img src="${remark.remark_src}" jqimg="#" width="200" /></li>
                                    </c:if>
                                </ul>
                                <div class="bbs-img-preivew"></div>
                            </div>
                            <div class="bbs-post">
                                <span class="bbs-post-date">${remark.time}</span>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </li>

                    </c:forEach>

                </ul>
            </div>
        </div>
    </div>
</div>
-->
<jsp:include page="/WEB-INF/jsp/foot.jsp" flush="true" ></jsp:include>
</body>
<script type="text/javascript">


$(document).ready(function() {
	$('.spinner').spinner({ 
	    max:999, 
	    min:1, 
	    step:1 
	});
	$('#spinner').val("1");
});
function buyNow(id) {
	var num=$('#spinner').val()
	$.ajax({
		 type: "GET",
        url: "${pageContext.request.contextPath}/user/cartAdd",
        data:{"id":id,"num":num},
        success: function(data){
        	window.location.href="${pageContext.request.contextPath}/user/intocart"
        },
        error: function(XMLHttpRequest,textStatus){
       	 alert("请求失败"+textStatus)
 
        }
	 })
}
function cartAdd(id) {
	
	var num=$('#spinner').val()
	$.ajax({
		 type: "GET",
        url: "${pageContext.request.contextPath}/user/cartAdd",
        data:{"id":id,"num":num},
        success: function(data){
       		console.log(data)
       		alert(data)
        },
        error: function(XMLHttpRequest,textStatus){
       	 alert("请求失败"+textStatus)
 
        }
	 })
}

</script>
</html>
