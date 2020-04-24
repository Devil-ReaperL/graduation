<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>好花网 | 购物中心 &gt; 搜索</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/base.css" />

    <script type="text/javascript" src="${pageContext.request.contextPath}/JS/jquery-2.1.4.js"></script>

</head>
<body>
<jsp:include page="/WEB-INF/jsp/head.jsp" flush="true" ></jsp:include>

<div class="wrap">
		<div class="wl277">
			
			
			
<input hidden="hidden" name="key" id="key" value="${from.key}">
<input hidden="hidden" name="attr" id="attr"  value="${from.attr}">
<input hidden="hidden" name="sort" id="sort"  value="${from.sort}">
<input hidden="hidden" name="order" id="order"  value="${from.order}">			


			
			
			
			
			<div class="box box-rxxh">
				<div class="box-bar"><p class="box-bar-title">热销鲜花</p></div>
				<div class="box-con">
					<ul>
						
						<c:forEach items="${sales}" var="sale">																
						<li>
							<a class="imgbounce" href="${pageContext.request.contextPath}/product/info/${sale.id}" title="商品">
								<div class="img"><img src="/image/${sale.srcs[0]}" width="84" height="84" /></div>
								<div class="txt">
									<h5>${sale.name}</h5>
									<div class="price b"><span>¥</span>${sale.price}<label>人气${sale.sales}</label></div>
								</div>
								<div class="clear"></div>
							</a>
						</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			


			<div class="autofixed" fixed=".wr893" style="width: 277px; top: 0px; background-color: rgb(255, 255, 255); overflow: hidden; margin-top: 0px;">
			
			</div>
		</div>
		<div class="wr893">
			<div class="page-header">
				<ul class="clearfix">
					<li class="active"><a href="javascript:;" onclick="order('','')">综合排序</a></li>
					<li class=""><a href="javascript:;" onclick="order('sales','desc')">销量</a></li>
					<li class="">
						<a href="javascript:;">价格<i class="icon icon-desc"></i></a>
						<dl>
							<dd><a href="javascript:;" onclick="order('price','desc')">价格从高到低</a></dd>
							<dd><a href="javascript:;" onclick="order('price','')">价格从低到高</a></dd>
						</dl>
					</li>
					
				</ul>
				 
			</div>
			<div class="xuanhua-list">
			<c:if test="${empty products}">
    			<lable style="width: 96%;text-align: center;color: #7c7878">未查找到商品</lable>
    		</c:if>
				<ul class="clearfix" id="productlist">    				
    				<c:if test="${not empty products}">
					<c:forEach items="${products}" var="product">
    				<li>
			    		<a class="info imghover" href="${pageContext.request.contextPath}/product/info/${product.id}">
			    			
			    			<div class="img"><img src="/image/${product.srcs[0]}" height="244"></div>
			    			<h5>${product.name}</h5>
			    			<p class="price b">
			    				<span>¥</span>${product.price}
			    				
			    				<label>已售 ${product.sales}</label>
			    			</p>
			    		</a>
		    		</li>
    				</c:forEach></c:if>
    			</ul>
			</div>
			<div class="h25"></div>
			<div class="text-center ">
			<style TYPE="text/css">
						@import  url(${pageContext.request.contextPath}/CSS/bootstrap.css);
						.file-caption-main {
	    					width: auto; 
	    					float: left;
						}
						.input-group-btn{
							width: auto; 
						}
						.file-preview{
							width: 78.5%;
						    float: left;
						    margin-left: 60px;
						}
						.page-header {
						     padding-bottom:0px;
						     margin: 0px; 
						   border-bottom: 0px
						}
					</style>
			<c:if test="${pageCnt !=0}">
				<div class="pagination pagination-centered" id="page">
					<ul>
						
						<c:forEach var="page" items="${pages}">
							<li class="${page.cssClass}"><a
							onclick="PageAjax('${page.index}')"	>${page.content}</a></li>
						</c:forEach>
						<!-- ページ番号入力ボックス -->
						<li>
							<form action="${searchPageUrl}"
								cssClass="form-inline" style="float:left;margin-left: 20px;" method="post">
									Page:
									<input
									id="targetPage" name="targetPage" class="input-mini"
									type="text"  value="${curPage}" maxlength="3" oninput = "value=value.replace(/\D|^0/g,'');
									if(value > ${pageCnt})value=${pageCnt};" style="width: 60px ; text-align: center;"
									/> 
									/ <c:out value="${pageCnt}" />
								<a id="jumpToPage" onclick="PageAjax('jump')" class=""> JUMP
								</a>
							</form>
						</li>
					</ul>
				</div>
			</c:if>
		</div>
			
			<div class="changshi-min-list">
				<div class="changshi-min-list-bar"><span class="title">鲜花常识&amp;送花礼仪</span></div>
				<div class="changshi-min-body">
					<ul class="clearfix">
						<li><a href="/huayu/58931.html" title="送老婆什么十周年纪念日鲜花？">送老婆什么十周年纪念日鲜花？</a></li>
						<li><a href="/huayu/58930.html" title="送女性朋友什么七夕节礼物？">送女性朋友什么七夕节礼物？</a></li>
						<li><a href="/huayu/58929.html" title="送什么七夕礼物能传递情意？">送什么七夕礼物能传递情意？</a></li>
						<li><a href="/huayu/58928.html" title="送女孩子紫玫瑰有哪些含义？">送女孩子紫玫瑰有哪些含义？</a></li>
						<li><a href="/huayu/58927.html" title="送女友几朵情人节玫瑰好？">送女友几朵情人节玫瑰好？</a></li>
						<li><a href="/huayu/58926.html" title="送几朵情人节玫瑰花合适？">送几朵情人节玫瑰花合适？</a></li>
						<li><a href="/huayu/58925.html" title="送女朋友什么七夕节鲜花、礼物好？">送女朋友什么七夕节鲜花、礼物好？</a></li>
						<li><a href="/huayu/58924.html" title="送哪些情人节创意礼物好？">送哪些情人节创意礼物好？</a></li>
						<li><a href="/huayu/58923.html" title="送情侣什么异地礼物好？">送情侣什么异地礼物好？</a></li>
						<li><a href="/huayu/58922.html" title="情人节花束颜色该如何搭配？">情人节花束颜色该如何搭配？</a></li>
						<li><a href="/huayu/58921.html" title="送朋友万寿菊有什么含义？">送朋友万寿菊有什么含义？</a></li>
						<li><a href="/huayu/58920.html" title="不同场合送花有哪些讲究？">不同场合送花有哪些讲究？</a></li>
						<li><a href="/huayu/58919.html" title="送哪些生日礼物给男朋友好？">送哪些生日礼物给男朋友好？</a></li>
						<li><a href="/huayu/58918.html" title="适合送摩羯男的生日礼物有哪些？">适合送摩羯男的生日礼物有哪些？</a></li>
						<li><a href="/huayu/58917.html" title="朋友乔迁新居送什么礼物好?">朋友乔迁新居送什么礼物好?</a></li>
					</ul>
				</div>
			</div>

		</div>
		<div class="clear"></div>
	</div>
	<jsp:include page="/WEB-INF/jsp/foot.jsp" flush="true" ></jsp:include>
<script type="text/javascript">

function PageAjax(url) {
	if(url=="jump")
	url=$("#targetPage").val()
	var key=$("#key").val()
	var attr=$("#attr").val()
	var sort=$("#sort").val()
	var order=$("#order").val()
	$.ajax({
		 type: "GET",
        url: "${pageContext.request.contextPath}/product/search/ajax",
        data:{"key":key,
        	"attr":attr,
        	"sort":sort,
        	"page":url,
        	"order":order
        },
        success: function(data){
        	formatInfo(data)
       		$('html,body').animate({scrollTop: '0px'}, 800);
        },
        error: function(XMLHttpRequest,textStatus){
       	 alert("请求失败")
 
        }
	 })
	 return false;
}
function formatInfo(data) {
	 $("#productlist").empty();
	   	var html=""
	 for ( var i in data.products) {
		html=html+'<li>'+
		'<a class="info imghover" href="${pageContext.request.contextPath}/product/info/'+data.products[i].id+'">'+
		'<div class="img"><img src="/image/'+data.products[i].srcs[0]+'" height="244"></div>'+
		'<h5>'+data.products[i].name+'</h5>'+
		'<p class="price b">'+
			'<span>¥</span>'+data.products[i].price+
			'<label>已售 '+data.products[i].sales+'</label>'+
		'</p>'+
	'</a>'+
	'</li>'
	}
	   	$("#productlist").html(html)
	   	var page=""
	      	 $("#page").empty();
	      	page+="<ul>"
	   		for ( var p in data.pages) {
	   			page+='<li class="'+data.pages[p].cssClass+'">'+
	   			'<a onclick="PageAjax('+data.pages[p].index+')" >'+data.pages[p].content+'</a></li>'
	   		}
	      	page+=
	   		'<li><form cssClass="form-inline" style="float:left;margin-left: 20px;" method="post">'+
	   					'Page:'+
	   					'<input '+
	   					'id="targetPage" name="targetPage" class="input-mini"'+
	   					'type="text"  value="'+data.curPage+'" maxlength="3" oninput = "value=value.replace(/\D|^0/g,'+"''"+');'+
	   					'if(value > '+data.pageCnt+')value='+data.pageCnt+';"  style="width: 60px ; text-align: center;" /> '+
	   					'/ '+data.pageCnt+
	   				'<a id="jumpToPage" onclick="PageAjax(\'jump\')"  class=""> JUMP'+
	   				'</a>'+
	   			'</form>'+
	   		'</li>'+
	   	'</ul>'
	   		$("#page").html(page)
	   		
}
function order(sort,order) {
	$("#sort").val(sort)
	$("#order").val(order)
	PageAjax(1)
}
</script>
</body>


</html>
