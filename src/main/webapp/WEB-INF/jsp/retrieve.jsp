<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BTS网 | 会员中心 &gt; 找回密码</title>

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

	<script type="text/javascript" src="${pageContext.request.contextPath}/JS/jquery-1.12.4.min.js"></script>	
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/JS/app.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/other/register.css" />
	  <link href="${pageContext.request.contextPath}/CSS/showDialog.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/base.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/JS/jquery-1.12.4.min.js"></script>	
	<script type="text/javascript" src="${pageContext.request.contextPath}/JS/app.min.js"></script>

	<script type="text/javascript" src="${pageContext.request.contextPath}/JS/jquery-2.1.4.js"></script>
	<script src="${pageContext.request.contextPath}/JS/jquery.js"></script>
      	<script type="text/javascript" src="${pageContext.request.contextPath}/JS/jquery.showDialog.js"></script>   
    <script src="${pageContext.request.contextPath}/JS/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/JS/jquery.form.js"></script>
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
							<p class="img"><img src="${pageContext.request.contextPath}/img/wx.jpg" width="128" height="130" /></p>
							
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
					<a href="/graduation/" title="【BTS网】专注鲜花电商，只做品质鲜花！"><img src="/graduation/img/logo.png" width="248" height="41" alt="BTS网"></a>
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
							<li><a href="${pageContext.request.contextPath}/login/user_login" >登录</a></li>
							<li class="active"><a href="javascript:;">找回密码</a></li>
						</ul>
					</div>
					<div class="loginfrm mt30 regfrm">
						<form  content="multipart/form-data;"  action="${pageContext.request.contextPath}/login/register/user" method="post" id="register">
						<ul class="loginfrm-body">
							<li>
								<div class="loginfrm-group">
									<input type="hidden" name="method" value="register">
									<input type="text" class="input-big" id="phonenum"  name="phonenum"  maxlength="11" pattern="[1][3,4,5,7,8,9][0-9]{9}" value="" placeholder="请输入手机号码" id="phonenum" oninvalid="setCustomValidity('请输入正确的手机号')" oninput="setCustomValidity('')" autocomplete="off" required>
								</div>
							</li>
							<li>
								<div class="loginfrm-group">
									<input type="password" class="input-big"  name="password" value="" maxlength="20"  minlength="6" placeholder="请设置登录密码" autocomplete="off" oninvalid="setCustomValidity('请输入密码，长度大于6位')" oninput="setCustomValidity('')" required/>
								</div>
							</li>
							
							<li>
								<div class="loginfrm-group">
									<input type="text" class="input-big"  style=" width: 169px;"  maxlength="6" minlength="6" id="verif" name="verif" value="" placeholder="请正确输验证码" autocomplete="off" oninvalid="setCustomValidity('请输入验证码')" oninput="setCustomValidity('')" required/>
									<button type="button" id="verification" style="position: absolute;height: 50px;background-color: #dcddddb0; border: 0px;width: 122px;">发送验证码</button>
								</div>
							</li>
							<li>
								<div style="height: 50px;">
									<span id="error"></span>
								</div>
								
							</li>
							
							<li>
								<div class="loginfrm-group">					
									<input  class="button-big button-block mobile-submit" type="submit"  value="立即注册"/ >
								</div>
							</li>
						</ul>
						</form>
					</div>
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
var verif="";
var flag=false;
var options = {
	    url: "${pageContext.request.contextPath}/login/register/user", //提交地址：默认是form的action,如果申明,则会覆盖
	    type: "post",   //默认是form的method（get or post），如果申明，则会覆盖
	    success: successfun,  //提交成功后的回调函数
	    beforeSerialize: modifySubmitData
	};
function modifySubmitData() {
	var data=$("#verif").val()
	if(!flag){
		$("#error").text("请发送验证码")
		return false
		}
	if(data!=verif)
		{
			$("#error").text("验证码错误")
			console.log(data+"*"+verif)
			return false
		}
		
}
function successfun(data, status) {
    //data是提交成功后的返回数据，status是提交结果 比如success
    //返回数据的类型是通过options对象里面的dataType定义的，比如json、xml，默认是html

    //这里data.success是因为我后天返回的json数据的一个属性 String jsonText = "{'success':'提交成功'}";
    if(data==true)
    	{
    	showInfo("找回成功，跳转到主页",function() {
    		window.location.href="${pageContext.request.contextPath}/";
		},3)
    	
    	}
    	
   	else
   		showInfo("评价失败","",3)
    	   	
}
$('#register').ajaxForm(options)


	
$("#verification").click(function() {
	var phone = document.getElementById('phonenum').value;
    if(!(/^1[3456789]\d{9}$/.test(phone))){
        showInfo("手机号码有误，请重填","",3) 
        return false; 
    }
    $.ajax({
		type: "post",
       url: "${pageContext.request.contextPath}/login/register/user/verif",
       data:{"phone":phone},
       success: function(data){
    	   if(data!=null && data != '')
    		   {
		    		$("#verification").attr("disabled", true)
		    		$("#verif").attr("disabled", false)
		       		disable(60,$("#verification"))
    		   		verif=data
    		   		flag=true
    		   		console.log(verif+"xx")
    		   }
    	   else{
    		   console.log(2)
    	   }
    	   
       },
       error: function(XMLHttpRequest,textStatus){
      	 alert("请求失败")

       }
	 })
	
})


function disable(num,btn) {
	
	if(num<1){
		$(btn).attr("disabled", false)
		$(btn).text("重新发送验证")
	}
	else {
		$(btn).text(num+"秒后重新发送")
		setTimeout(function() {
			disable(num-1,btn)
		} , 1000)
	}
		
}
</script>
</body>
</html>