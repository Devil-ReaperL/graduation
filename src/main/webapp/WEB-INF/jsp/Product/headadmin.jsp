<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/base.css" />
	<link href="${pageContext.request.contextPath}/CSS/showDialog.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/CSS/jqzoom.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/CSS/product-add.css" rel="stylesheet" type="text/css" />
	<!--  <link href="${pageContext.request.contextPath}/CSS/style2.css" rel="stylesheet" type="text/css"  />-->
	<link href="${pageContext.request.contextPath}/CSS/fileinput.min.css" media="all" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/CSS/jquery-ui.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/CSS/summernote.css" rel="stylesheet">    
	<link href="${pageContext.request.contextPath}/CSS/other/spinner.css" rel="stylesheet">	
	
	<script src="${pageContext.request.contextPath}/JS/jquery-3.4.1.js" type="text/javascript"></script>		
	<script src="${pageContext.request.contextPath}/JS/jquery-ui.js" type="text/javascript"></script>	

	<script src="${pageContext.request.contextPath}/JS/jquery.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/JS/fileinput.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/JS/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/JS/summernote.js"></script>
    <script src="${pageContext.request.contextPath}/JS/jquery.spinner.js"></script>	
	<script src="${pageContext.request.contextPath}/JS/jquery.form.js"></script>	
	<script type="text/javascript" src="${pageContext.request.contextPath}/JS/jquery.jqzoom.js"></script>	
	<script type="text/javascript" src="${pageContext.request.contextPath}/JS/jquery.lazyload.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/JS/jquery.showDialog.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/JS/app.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/JS/common.js"></script>
	
</head>
	
<body>
<div class="topper">
		<div class="wrap">
			<div class="left">
				<a onclick="app.tools.addFavorite();" href="javascript:;" title="收藏BTS网 ">收藏BTS网 </a>
				<!-- 
				<a href="javascript:;">
					关注微信
					<div class="topperpop">
						<div class="fqrcode">
							<p class="note">回复“礼物”有惊喜！" 活动多多，在BTS遇见幸福</p>
							<p class="img"><img src="//www.haohua.com/theme/haohua.com/default/static/img/qrcode.png" width="128" height="130" /></p>
							<p class="gzh">公众号</p>
						</div>
					</div>
				</a>
				 -->
			</div>
			<div class="right">
				<c:if test="${not empty root}">
				<a class="Mine.jsp" href="${pageContext.request.contextPath}/admin/search"  title="查看全部商品">
					查看全部商品
				</a> 
				<a class="Mine.jsp" href="${pageContext.request.contextPath}/admin/add"  title="添加商品">
					添加商品
				</a>
				 
				<a class="iconbounce" href="${pageContext.request.contextPath}/admin/order" title="订单管理">
					订单管理
				</a> 
				</c:if>
				<a class="iconbounce" href="${pageContext.request.contextPath}" title="返回主页">
					返回主页
				</a>
				 
				
			</div>
		</div>
	</div>

	<div class="header2brt">
		<div class="wrap header " style="height: 100px">
			<div class="logobanner clearfix">
				<div class="logo">
					<a href="#" title="【BTS网】专注鲜花电商，只做品质鲜花！"><img src="${pageContext.request.contextPath }/img/logo.png" width="248" height="41" alt="BTS网" /></a>
				</div>
							
		  </div>
		</div>
	</div>
	
		
</body>

</html>