<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>商品信息列表</title>

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/gm/gm.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/gm/common.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/JS/gm/gm.js"></script>
	
	
</head>
<body>

	<jsp:include page="/WEB-INF/jsp/product/headadmin.jsp" flush="true" ></jsp:include>
	<link href="${pageContext.request.contextPath}/CSS/bootstrap.css" rel="stylesheet">
	<form id="addproduct"  class="form-inline" role="form"  method="post">
    		<div class="container kv-main" style="width:100%; ">
    		<div class="form-group " style="width: 100%;text-align: center;">
				<br>
				<input value="${product.name}" name="find" type="text" class=" form-control " id="find" 
			  			 placeholder="请输入搜索内容" style="font-size: 20px;">
			  			<button  class="btn btn-default btn-sm" style="font-size: 20px;height: 40px">
				          <span class="glyphicon glyphicon-search"></span>
				        </button>
			</div></div></form>
	
	<hr>
	
	<div align="center">
		<table class="table-hover table " style="text-align:center;width: 90%">
			<thead>
				<tr>
					<th>编号</th>
					<th style="width: 200px">图片</th>
					<th style="width: 30%">名称</th>
					<th>类别</th>
					<th>价格</th>
					<th>库存</th>
					<th style="width: 20%">上架时间</th>
					<th>操作</th>
				</tr>				
			</thead>
			<tbody id="tbody">
			<c:if test="${not empty products}">
				<c:forEach items="${products}" var="product">
					<tr >
						<td >${product.id}</td>
						<td >
							<img style="width: 200px;height: 200px" alt="${product.name}" src="/image/${product.srcs[0]}">						
						</td>
						<td>${product.name}</td>
						<td>${product.attr}</td>
						<td>${product.price}</td>
						<td>${product.stock}</td>
						<td>${product.addtime}</td>
						<td>
							<a href="${pageContext.request.contextPath}/product/update/${product.id}">修改</a><br><br>
							<a onclick="deleteProdect('${product.id}','${product.name}')">删除</a>
						</td>
					</tr>
				</c:forEach>
				<tr></tr>
			
			</c:if>
			
			</tbody>
		
		</table>
	
	</div>
	

	<br>
	
	
		<!--  pagination -->
		<div class="text-center ">
			<c:if test="${not empty pages}">
				<div class="pagination pagination-centered" id="page">
					<ul>
						
						<c:forEach var="page" items="${pages}">
							<li class="${page.cssClass}"><a
							onclick="PageAjax('${page.index}','${key}')"	>${page.content}</a></li>
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
								<a id="jumpToPage" onclick="PageAjax('jump','${key}')" class=""> JUMP
								</a>
							</form>
						</li>
					</ul>
				</div>
			</c:if>
		</div>
	<!-- 
	<br> <br>
		<jsp:include page="/WEB-INF/jsp/foot.jsp" flush="true" />-->
	 
 
</body>
<script type="text/javascript">
function deleteProdect(id,name) {
	if(confirm("确认删除商品   "+name+" 吗"))
		{
		 $.ajax({
			 type: "GET",
             url: "${pageContext.request.contextPath}/product/delete/"+id,
             success: function(data){
            	 alert("删除成功")
            	 window.location.href="${pageContext.request.contextPath}/admin/search";
             },
             error: function(XMLHttpRequest,textStatus){
            	 alert("删除失败")
            	 reload()
             }
		 })
		}
}

</script>
<script type="text/javascript">
var options = {
	    url: "${pageContext.request.contextPath}/product/findProduct/1", //提交地址：默认是form的action,如果申明,则会覆盖
	    type: "post",   //默认是form的method（get or post），如果申明，则会覆盖
	    success: successfun,  //提交成功后的回调函数
	    dataType: "json", //html(默认), xml, script, json...接受服务端返回的类型

	    timeout: 6000     //限制请求的时间，当请求大于3秒后，跳出请求
	};
	$('#addproduct').ajaxForm(options)
function successfun(data, status) {
	    //data是提交成功后的返回数据，status是提交结果 比如success
	    //返回数据的类型是通过options对象里面的dataType定义的，比如json、xml，默认是html
	
	    //这里data.success是因为我后天返回的json数据的一个属性 String jsonText = "{'success':'提交成功'}";
	    if(status)
	    	{
	    	successinfo(data)
	    	}

}
function successinfo(data) {
	if(data)
		{
		console.log(data)
   	 $("#tbody").empty();
   	var html=""
   	for (var k in data.products) {
   		
   		html+="<tr >"+
			"<td >"+data.products[k].id+"</td>"+
			"<td >"+
				'<img style="width: 200px;height: 200px" alt="'+data.products[k].name+'" src="/image/'+data.products[k].srcs[0]+'">'	+				
			"</td>"+
			"<td> "+data.products[k].name+'</td>'+
			"<td> "+data.products[k].attr+'</td>'+
			"<td> "+data.products[k].price+'</td>'+
			"<td> "+data.products[k].stock+'</td>'+
			"<td>"+data.products[k].addtime+'</td>'+
			"<td>"+
				'<a href="${pageContext.request.contextPath}/product/update/'+data.products[k].id+'">修改</a><br><br>'+
				'<a onclick="deleteProdect('+data.products[k].id+',\''+data.products[k].name+'\')">删除</a>'+
			"</td>"+
		"</tr>"
		}
   	
   	
   	 $("#tbody").html(html)
   	var page=""
   	 $("#page").empty();
   	page+="<ul>"
		for ( var p in data.pages) {
			page+='<li class="'+data.pages[p].cssClass+'">'+
			'<a onclick="PageAjax('+data.pages[p].index+",'"+data.key+"'"+')" >'+data.pages[p].content+'</a></li>'
		}
   	page+=
		'<li><form cssClass="form-inline" style="float:left;margin-left: 20px;" method="post">'+
					'Page:'+
					'<input '+
					'id="targetPage" name="targetPage" class="input-mini"'+
					'type="text"  value="'+data.curPage+'" maxlength="3" oninput = "value=value.replace(/\D|^0/g,'+"''"+');'+
					'if(value > '+data.pageCnt+')value='+data.pageCnt+';"  style="width: 60px ; text-align: center;" /> '+
					'/ '+data.pageCnt+
				'<a id="jumpToPage" onclick="PageAjax('+"'jump','"+data.key+"'"+')"  class=""> JUMP'+
				'</a>'+
			'</form>'+
		'</li>'+
	'</ul>'
	console.log(page)
		$("#page").html(page)
		}
}

function PageAjax(url,key) {
	if(url=="jump")
	url=$("#targetPage").val()
	console.log(url)
	console.log("1"+key)
	$.ajax({
		 type: "GET",
        url: "${pageContext.request.contextPath}/product/findProduct/"+url,
        data:{"find":key},
        success: function(data){
       		successinfo(data)
       		$('html,body').animate({scrollTop: '0px'}, 800);
        },
        error: function(XMLHttpRequest,textStatus){
       	 alert("请求失败")
 
        }
	 })
	 return false;
}
 
</script>
</html>