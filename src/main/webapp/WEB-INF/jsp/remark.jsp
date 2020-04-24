<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>好花网 | 购物中心 &gt; 购物车</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/base.css" />
    <link href="${pageContext.request.contextPath}/CSS/fileinput.css" media="all" rel="stylesheet" type="text/css" />
	<link  href="${pageContext.request.contextPath}/CSS/other/remark.css" rel="stylesheet">
	
    <script type="text/javascript" src="${pageContext.request.contextPath}/JS/jquery-2.1.4.js"></script>
	 <script src="${pageContext.request.contextPath}/JS/jquery.js"></script>
   	<script type="text/javascript" src="${pageContext.request.contextPath}/JS/jquery.showDialog.js"></script>   
    <script src="${pageContext.request.contextPath}/JS/bootstrap.js"></script>
  
   
</head>
<body>

<jsp:include page="/WEB-INF/jsp/head.jsp" flush="true" ></jsp:include>
     <script src="${pageContext.request.contextPath}/JS/fileinput.js" type="text/javascript"></script> 
<script src="${pageContext.request.contextPath}/JS/jquery.form.js"></script>

<form action="${pageContext.request.contextPath}/shop/remark" enctype="multipart/form-data" id="remark" method="post" >
	<input hidden="hidden" name="orderid" value="${order.id}">
	<input hidden="hidden" name="product_id" value="${product.id}">
<div id="container">
	<div class="wrap" >
		<div class="orderinfo">
			<h3 class="o-title">评价订单</h3>
			<div class="o-info">
				<span class="mr20">订单号：<a href="${pageContext.request.contextPath}/shop/order/show/id/${order.id}/" target="_blank" class="gray1">${order.id}</a></span>
				<span>${order.addtime}</span>
			</div>
		</div>
	</div>
	<div class="wrap" >
		<div class="productinfo">
			<div class="fi-info">
			<div class="comment-goods">
					<div class="p-img"><a  href="${pageContext.request.contextPath}/product/info/${product.id}" target="_blank">
					<img src="/image/${product.srcs[0]}" alt="" style="max-width: 100px;max-height: 100px">
					</a></div>
					<div class="p-name"><a  href="${pageContext.request.contextPath}/product/info/${product.id}" target="_blank">${product.name}</a></div>
					<div class="p-price"><strong>¥${product.price}</strong></div>
					<div class="p-attr">${product.attr} </div>
				</div>
			</div>
			<div class="fi-operate">
				<div class="fop-item fop-star   z-tip-warn">
					<div class="fop-label">商品评分</div>
					<div class="starts">
						<ul id = "pingStar">
							<li rel = "1" title = "1分"></li>
							<li rel = "2" title = "2分"></li>
							<li rel = "3" title = "3分"></li>
							<li rel = "4" title = "4分"></li>
							<li rel = "5" title = "5分"></li>
							<span id="dir"></span>
						</ul>
						<input type="hidden" value="" id = "startP" name="rank"/>								
					</div>
					<div class="fop-tip"><i class="tip-icon"></i><em class="tip-text"></em></div>
				</div>
				<div class="fop-item ">
					<div class="fop-label">评价晒单</div>
					<div class="fop-main">
							<div class="f-textarea">
								<textarea name="text" id="message" placeholder="分享体验心得，给万千想买的人一个参考~"></textarea>
							</div>
							
					</div>
					<div class="form-group" style="min-height: 330px;">
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
					</style>
					     <input name="files" id="uploadImg" type="file" multiple="multiple" class="file" data-overwrite-initial="false" >
					 </div>
				</div>
		</div>
	</div></div>
	<div class="wrap" >
		<div class="f-btnbox">
			
			<a href="javascript:;"  class="btn-submit" onclick="publish()"><label style="color: white; cursor: pointer;">发表</label></a>
		</div>
	</div>
</div>

</form>

<script>

window.onload = function(){
	var s = document.getElementById("pingStar");
	    m = document.getElementById("dir"),
	    n = s.getElementsByTagName("li"),
	    input = document.getElementById("startP");//保存所选值
	clearAll = function(){
		for(var i = 0;i < n.length;i++){
			n[i].className = "";
		}
	}
	for(var i = 0;i < n.length;i++){
		n[i].onclick = function(){
			var q = this.getAttribute("rel");
			clearAll();
			input.value = q;
			for(var i = 0;i < q;i++){
				n[i].className = "on";
			}
			m.innerHTML = this.getAttribute("title");
		}
		n[i].onmouseover = function(){
			var q = this.getAttribute("rel");
			clearAll();
			input.value = q;
			for(var i = 0;i < q;i++){
				n[i].className = "on";
			}
			m.innerHTML = this.getAttribute("title");
		}
		n[i].onmouseout = function(){			
			for(var i = 0;i < input.value;i++){
				n[i].className = "on";
			}
			
		}
	}
}   

$("#uploadImg").fileinput({
    uploadUrl: '#', // you must set a valid URL here else you will get an error
    allowedFileExtensions : ['jpg', 'png','gif'],
    overwriteInitial: false,
    uploadAsync: false,
    showCancel:false,
    showRemove:false,
    showUpload:false,
    dropZoneEnabled: false,
    browseOnZoneClick: false,
    showClose: false,
    maxFileSize: 1024*10242*2,
    maxFileCount: 4,
    minFileCount:-1,
    layoutTemplates :{
    	main1: 
        '<div class="kv-upload-progress hide"></div>\n' +
        '<div class="input-group {class}">\n' +
        '   {caption}\n' +
        '   <div class="input-group-btn">\n' +
        '       {remove}\n' +
        '       {cancel}\n' +
        '       {upload}\n' +
        '       {browse}\n' +
        '   </div>\n' +
        '</div>'+
        '{preview}\n' ,
        caption:'',
        btnBrowse: '<div tabindex="500" index="1" class="btn-file upload"{status}></div>',
        actions: '<div class="file-actions">\n' +
    '    <div class="file-footer-buttons">\n' +
    '        {upload} {delete} {zoom} {other}' +
    '    </div>\n' +
    '    {drag}\n' +
    '    <div class="clearfix"></div>\n' +
    '</div>',
        actionUpload:'',//去除上传预览缩略图中的上传图片；
        
    }, 
    slugCallback: function(filename) {
        return filename.replace('(', '_').replace(']', '_');
    }

});
function publish() {
	var rank=$("#startP").val()
	var text=$("#message").val()
	if(rank != null && rank != '')
		{
			if(text != null && text != ''){
				console.log(1)
				history.pushState("", "", "${pageContext.request.contextPath}/shop/management");
				$("#remark").ajaxSubmit(options);
				 return false;
			}
			else {
				$("#message").focus();
				showInfo("尚未对商品进行评价",'$("#message").focus();',3)
				
			}
			
			
		}
	else
		showInfo("尚未对商品进行评分","",3)
}

function successfun(data, status) {
    //data是提交成功后的返回数据，status是提交结果 比如success
    //返回数据的类型是通过options对象里面的dataType定义的，比如json、xml，默认是html

    //这里data.success是因为我后天返回的json数据的一个属性 String jsonText = "{'success':'提交成功'}";
    if(data==true)
    	{
    	showInfo("感谢您的评价",function() {
    		window.location.href="${pageContext.request.contextPath}/shop/management";
    		},3)
    	
    	}
    	
   	else
   		showInfo("评价失败",function() {
    		window.location.href="${pageContext.request.contextPath}/";
    		},3)
    	   	
}
 
var options = {
	    url: "${pageContext.request.contextPath}/shop/remark", //提交地址：默认是form的action,如果申明,则会覆盖
	    type: "post",   //默认是form的method（get or post），如果申明，则会覆盖
	    success: successfun,  //提交成功后的回调函数
	};
history.pushState("", "", "${pageContext.request.contextPath}/shop/management");
</script>
</body>


</html>
