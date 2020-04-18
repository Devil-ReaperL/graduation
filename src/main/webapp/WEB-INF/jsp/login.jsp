<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>BTSgifts | 会员中心 &gt; 会员登录</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/base.css" />

	<script type="text/javascript" src="${pageContext.request.contextPath}/JS/jquery-1.12.4.min.js"></script>	
	

	<script type="text/javascript" src="${pageContext.request.contextPath}/JS/app.min.js"></script>
	
	
</head>	
<body>
	<div class="topper">
		<div class="wrap">
			<div class="left">
				<a onclick="app.tools.addFavorite();" href="javascript:;" title="收藏BTS网 (haohua.com)">收藏BTS网 (BTSgifts.com)</a>
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
			</div>
			<div class="right">
				<a class="iconbounce" href="${pageContext.request.contextPath}/common/service" title="联系客服"><i class="icon icon-service"></i>联系客服</a>
			</div>
		</div>
	</div>

	<div class="header2brt">
		<div class="wrap header " style="height: 100px">
			<div class="logobanner clearfix">
				<div class="logo">
					<a href="${pageContext.request.contextPath}/" title="【BTS网】专注鲜花电商，只做品质鲜花！"><img src="${pageContext.request.contextPath}/img/logo.png" width="248" height="41" alt="BTS网" /></a>
				</div>
			</div>
		</div>
	</div>

	<div class="full-login">
		<div class="wrap pos-rel">
			<div class="login-box-outer">
				<div class="login-box">
					<div class="box-bar">
						<ul class="clearfix">
							<li class="active"><a href="javascript:;">登录</a></li>
							<li><a href="${pageContext.request.contextPath}/login/register">注册</a></li>
						</ul>
					</div>
					
						<form action="${pageContext.request.contextPath}/login/user_login" method="post">
						<ul class="loginfrm-body">
							<li>&nbsp;</li>
							<li>&nbsp;</li>
							<li>
								<div class="loginfrm-group">
									<input type="hidden" name="method" value="login">
									<input type="text" class="input-big"  name="phonenum"  placeholder="请使用手机登录" autocomplete="off" />
								</div>
							</li>
							<li>
								<div class="loginfrm-group">
									<input type="password" class="input-big"   name="password"  placeholder="请输入登录密码" autocomplete="off"/>
								</div>
							</li>
						
							
							<li>
								<div class="loginfrm-group">
									<p class="loginfrm-loading">${error}</p>								
									<button class="button-big button-block login-submit" onclick="userlogin()">登录</button>
								</div>
							</li>
							<li>
								<div class="a-oauth">
								 <a href="${pageContext.request.contextPath}/JSP/repassword.jsp"><font color="red">找回密码</font></a>
								</div>
							</li>
						</ul>
						</form>
					</div>
			</div>
		</div>
	</div>

	<div class="wrap tc">
		<img src="${pageContext.request.contextPath}/img/sbj.jpg" width="1069" height="116" />
		<div class="fcopyright">
			<p class="note">网站声明：毕业设计/p>
		</div>
		<div class="h30"></div>
    </div>
	<script type="text/javascript">
	$(function(){
	
		console.log("%c admin：http://localhost:8090/${pageContext.request.contextPath}/admin/into","color:red")
		}); 
	function userlogin() {
		history.pushState("", "", "${pageContext.request.contextPath}/login/user_login");
	}
	</script>
</body>
</html>

