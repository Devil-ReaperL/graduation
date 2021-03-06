<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<link href="${pageContext.request.contextPath}/CSS/head.css"  rel="stylesheet" type="text/css" />   
    <link href="${pageContext.request.contextPath}/CSS/base.css"  rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/CSS/showDialog.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/JS/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/JS/jquery.showDialog.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/JS/jquery.lazyload.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/JS/app.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/JS/common.js"></script>
	
</head>
<body>
<div class="topper">
    <div class="right">
		<c:choose>
					
			<c:when test="${not empty user}">
			<div class="dropdown">
				<a class="iconbounce login "  href="javascript:;"  title="登录 / 注册"><i class="icon icon-login"></i>欢迎 <c:if test="${not empty user.phonenum }">(${user.phonenum})</c:if>
				 </a> 
				 <div class="dropdown-content" >
				    
					  <a onclick="outUser()">登出</a>
				  </div>
			</div>	 
			
			</c:when>
			
			<c:otherwise>
				<a class="iconbounce login"  href="${pageContext.request.contextPath}/login/user_login" onclick="login();" title="登录 / 注册"><i class="icon icon-login"></i>登录 / 注册</a>	  						
			</c:otherwise>	
					   				  
		</c:choose>
    	
        <a class="iconbounce"  title="我的好花" href="${pageContext.request.contextPath}/shop/management"><i class="icon icon-my" ></i>我的好花</a>
        <a class="iconbounce" href="${pageContext.request.contextPath}/common/service"  title="联系客服"><i class="icon icon-service"></i>联系客服</a>
        <a class="iconbounce cart2" href="${pageContext.request.contextPath}/user/intocart/" title="购物车"><i class="icon icon-cart"></i>购物车<span></span></a>
    </div>
</div>
</div>

<div class="header2brt">
    <div class="wrap header index-header">
        <div class="logobanner clearfix">
            <div class="logo">
                <img src="${pageContext.request.contextPath}/img/logo.png" width="248" height="41" alt="好花网" />
            </div>
            <div class="search">
                <form action="${pageContext.request.contextPath}/product/search" >
                    <div class="search-frame">
                        <input type="text" class="q" name="key" placeholder="请输入关键词搜索" autocomplete="off" value="" />
                        <button type="submit" class="s" ><i class="icon icon-search"></i></button>
                    </div>
                </form>

            </div>
            <div class="tele400 clearfix">
                <div class="left">

                    <i class="icon icon-tel"></i>
                </div>
                <div class="left">
                    <label>111111111</label>
                    <p>咨询热线</p>
                </div>
            </div>
            <a class="service iconbounce" href="${pageContext.request.contextPath}/common/service"><i class="icon icon-service2"></i>在线客服</a>
        </div>
        <div class="main-nav clearfix">
            <dl>
                <dt class="active">
                    <div class="dt" ><a ><strong><font size="6px"> &nbsp;&nbsp;&nbsp;&nbsp;花&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;语</font></strong></a></div>

                    <div class="menu">
                        <img src="${pageContext.request.contextPath}/img/qaz.jpg" width="307px" height="450px" ;>
                    </div>
                    <div class="menu-item">
                    </div>

                </dt>
                <dd><a href="${pageContext.request.contextPath}/">首页</a></dd>
                <dd><a href="#attr1" >爱情鲜花</a></dd>
                <dd><a href="#attr2" >永生花</a></dd>
                <dd><a href="#attr3" >问候长辈</a></dd>
                <dd><a href="#attr4" >礼盒鲜花</a></dd>
                <dd><a href="#attr5" >商务鲜花</a></dd>


            </dl>
        </div>
    </div>
</div>
<script type="text/javascript">
function outUser() {
	showConfirm( '确信要 注销 吗？', function(){
		$.ajax({
			 type: "GET",
	       url: "${pageContext.request.contextPath}/common/exit",
	       success: function(data){
	      		if(data)
	      			history.pushState("", "", "${pageContext.request.contextPath}/login/index");
	      			window.location.replace('${pageContext.request.contextPath}/login/index')
	       },
	       error: function(XMLHttpRequest,textStatus){
	      	 alert("请求失败"+textStatus)

	       }
		 })
	});
	
}
</script>
	
</body>
</html>