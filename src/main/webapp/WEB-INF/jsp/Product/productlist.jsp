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

	<jsp:include page="/WEB-INF/jsp/Product/headadmin.jsp" flush="true" ></jsp:include>
	
	<div>from</div>
	
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
			<tbody>
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
				<div class="pagination pagination-centered">
					<ul>
						
						<c:forEach var="page" items="${pages}">
							<li class="${page.cssClass}"><a
								href="${pageContext.request.contextPath}/admin/search/${page.index}">${page.content}</a></li>
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
								<a id="jumpToPage" href="${pageContext.request.contextPath}/admin/search/" class=""> JUMP
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
	if(confirm("确认删除商品+"+name+"吗"))
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

</html>