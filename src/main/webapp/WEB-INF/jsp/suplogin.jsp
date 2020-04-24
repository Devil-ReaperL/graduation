<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>管理员登录</title>
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/gm/common.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/JS/gm/gm.js"></script>
	
	
</head>
<body>

	<jsp:include page="/WEB-INF/jsp/product/headadmin.jsp" flush="true" ></jsp:include>
	<link href="${pageContext.request.contextPath}/CSS/bootstrap.css" rel="stylesheet">
	<br>
	
	<div class="wrap" style="text-align: center;">
			<div class="20" ></div>
			<div style="width: 50%;margin: 0 auto;">
				<h2>登录</h2>
			<br>
			<br>
			<form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/admin/login" method="post">
				<div class="form-group" style="width: 80%;margin: 0 auto;">
				    <label for="firstname" class="col-sm-2 " style="line-height: 40px;margin-right: -25px">账号</label>
				    <div class="col-sm-10">
				      <input type="text" name="rootId" class="form-control" id="firstname" placeholder="请输入账号">
				    </div>
			  	</div>
		  	<br>
				<div class="form-group" style="width: 80%;margin: 0 auto;">
				   <label for="firstpassword" class="col-sm-2 " style="line-height: 40px;margin-right: -25px">密码</label>
				   <div class="col-sm-10">
				     <input type="password"  name="password" class="form-control" id="firstpassword" placeholder="请输入密码">
				   </div>
				</div>
				
				<div class="form-group" style="width: 80%;margin: 0 auto;height: 30px">
				  <label style="color: red; font-size: 13px; float: right;margin-right: 40px;">${error}</label>
			   </div>
				<div class="form-group" style="width: 80%;margin: 0 auto;">
				  <div class="col-sm-offset-2 col-sm-10" >
				      <button onclick="adminlogin()" class="btn btn-default btn-lg" style="float: right;margin-right: 25px;height: 42px">登录</button>
				  </div>
			   </div>
			</form>
		</div>
	</div>
<script type="text/javascript">
function adminlogin() {
	history.pushState("", "", "${pageContext.request.contextPath}/admin/into");
}
</script>
</body>
</html>