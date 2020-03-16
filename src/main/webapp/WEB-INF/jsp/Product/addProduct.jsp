<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<title>管理员界面</title>
	<style type="text/css">
		
</style>
	
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/base.css" />
	<link href="${pageContext.request.contextPath}/CSS/showDialog.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/CSS/jqzoom.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/CSS/product-add.css" rel="stylesheet" type="text/css" />
	
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/JS/jquery.jqzoom.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/JS/jquery-1.12.4.min.js"></script>	
	<script type="text/javascript" src="${pageContext.request.contextPath}/JS/jquery.lazyload.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/JS/jquery.showDialog.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/JS/app.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/JS/common.js"></script>
</head>
<body>
<div class="topper">
		<div class="wrap">
			<div class="left">
				<a onclick="app.tools.addFavorite();" href="javascript:;" title="收藏BTS网 ">收藏BTS网 (haohua.com)</a>
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
				<a class="Mine.jsp" href="${pageContext.request.contextPath}/admin/findlist"  title="查看全部商品">
					查看全部商品
				</a> 
				<a class="Mine.jsp" href="${pageContext.request.contextPath}/admin/add"  title="添加商品">
					添加商品
				</a>
				<a class="Mine.jsp" href="${pageContext.request.contextPath}/admin/modify"  title="修改商品">
					修改商品
				</a>  
				<a class="iconbounce" href="${pageContext.request.contextPath}/admin/remove" title="删除商品">
					删除商品
				</a> 
				<a class="iconbounce" href="common/service" title="联系客服">
					返回主页
				</a>
				 
				
			</div>
		</div>
	</div>

	<div class="header2brt">
		<div class="wrap header ">
			<div class="logobanner clearfix">
				<div class="logo">
					<a href="//www.haohua.com/" title="【BTS网】专注鲜花电商，只做品质鲜花！"><img src="${pageContext.request.contextPath }/img/logo.png" width="248" height="41" alt="BTS网" /></a>
				</div>
				
				
				
		  </div>
		</div>
	</div>

	
	<div class="Content-Main">
    <div class="Content-Main1">
        <h1>用户反馈</h1>
    </div>
    <form action="" method="post" class="form-report">
        <label>
            <span>Contact:</span>
            <select name="select2" class="select2">
                <option value="Email">Email</option>
                <option value="Phone">Phone</option>
                <option value="QQ">QQ</option>
            </select>
            <input type="text" placeholder="">
        </label>
        <label>
            <span>Message:</span>
            <textarea id="mesaage" name="message" placeholder="Your can tell me"></textarea>
        </label>
        <label>
            <span>Subject:</span>
            <select name="select1" class="select1">
                <option value="Job Inquiry">Job Inquiry</option>
                <option value="General Question">General Question</option>
            </select>
        </label>
        <label>
            <input type="button" class="button" value="Send">
        </label>
    </form>

	</div>

</body>
</html>