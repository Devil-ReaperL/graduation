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
	<!--  <link href="${pageContext.request.contextPath}/CSS/style2.css" rel="stylesheet" type="text/css"  />-->
	<link href="${pageContext.request.contextPath}/CSS/fileinput.css" media="all" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/CSS/jquery-ui.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/CSS/summernote.css" rel="stylesheet">    
	<link href="${pageContext.request.contextPath}/CSS/bootstrap.css" rel="stylesheet">
	
	<script src="${pageContext.request.contextPath}/JS/jquery-3.4.1.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/JS/1.js"  type="text/javascript"></script>
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
					<a href="#" title="【BTS网】专注鲜花电商，只做品质鲜花！"><img src="${pageContext.request.contextPath }/img/logo.png" width="248" height="41" alt="BTS网" /></a>
				</div>
							
		  </div>
		</div>
	</div>

	
	
    <div class="container kv-main" style="width:100%;text-align:center">
        <h1>添加商品</h1>
    </div>
   <hr>
	</div>
	
	 <form id="addproduct" enctype="multipart/form-data"   method="post">
    		<div class="container kv-main" style="width: 52% ">
    		<div class="form-group " style="width: 70%">
				<label for="name" class="addlable form-inline">商品名称：</label>
				<input name="name" type="text" class=" form-control " id="name" 
			  			 placeholder="请输入商品名称" style="font-size: 20px;">
			</div>
			
			<div class="form-group" style="width: 70%">
				<label for="ID" class="addlable">商品编号：</label>
				<input name="id" type="text" class="form-control" id="ID" 
			  			 placeholder="请输入商品编号" style="font-size: 20px;">
			</div>
			
			<div class="form-group" style="width: 23%">
				<label for="attr" class="addlable form-inline">商品类别：</label>
				<select id="attr" name="attr" class="form-control" style="font-size: 20px;">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
				</select>				
			</div>
			
			<div class="form-group" style="width: 50%">
				<label for="spinner1" class="addlable">商品价格：</label>

			  	<input name="price" type="text" id="spinner1" class="spinner form-control" maxlength="10" value="5"  style="width: 100px;
    		text-align: -webkit-center;font-size: 20px;" datestyle="float"/>
			  	

			</div>
			<div class="form-group" style="width: 50%">
				<label for="spinner" class="addlable">商品库存：</label>

			  	<input name="stock" type="text" id="spinner" class="spinner form-control" maxlength="10" value="5"  
			  			style="width: 100px;font-size:20px;
    					text-align: -webkit-center;" datestyle="int" />
			  	

			</div>
			
			</div>
    		              
            <div class="container kv-main" style="width: 52%">
                 <div class="form-group">
                	  <label for="uploadImg" class="addlable">展示照片：</label>
                      <input name="files" id="uploadImg" type="file" multiple class="file " style="font-size: 16px;" data-overwrite-initial="false" data-min-file-count="1">
                  </div>                       
            </div>
            
            <div style="width: 50%;margin:20px auto" >
            	<label for="summernote" class="addlable">详细信息：</label>
   			 	<textarea id="summernote" name="summernote"></textarea>
   			 	<button   id="BTN" class="btn btn-danger btn-lg" style="float: right;width: 120px;font-size: 20px;height: auto;">提交</button>
    		</div>  	
    		
           </form>
	
		
</body>
<script>
	$('.spinner').spinner({ 
	    max:999, 
	    min:0, 
	    step:1 
	});

	$(document).ready(function() {
        $('#summernote').summernote({
        	 height: 400,
             minHeight: 200,
             maxHeight: 400,
             lang: 'zh-CN',
            
         });
	});
    
    $("#uploadImg").fileinput({
        uploadUrl: '#', // you must set a valid URL here else you will get an error
        allowedFileExtensions : ['jpg', 'png','gif'],
        overwriteInitial: false,
        uploadAsync: true, 
        showCancel:false,
        showUpload:false,
        minFileCount: 1,
        browseOnZoneClick: true,
        maxFileSize: 1024*10242*2,
        maxFileCount: 5,
        layoutTemplates :{
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
	
    
	</script>
	<script type="text/javascript">
	function successfun(data, status) {
	    //data是提交成功后的返回数据，status是提交结果 比如success
	    //返回数据的类型是通过options对象里面的dataType定义的，比如json、xml，默认是html
	
	    //这里data.success是因为我后天返回的json数据的一个属性 String jsonText = "{'success':'提交成功'}";
	    if(data)
	    	alert('商品添加成功')
	   	else
	   		alert('商品添加失败')
	}
	function beforeCheck(formData, form, options) {
		
	    //利用form校验
	    var formDom = form[0];

	    //formDom是jQuery表单对象，感觉类似数组，可以通过下标访问元素
	    //比如：formDom[0].targetName 表示元素标签名，INPUT
	    var name = formDom["name"].value;//这里寻找name为name或者id为name的元素的值
	    var id = formDom["id"].value;
	    var price = formDom["price"].value;
	    var stock = formDom["stock"].value;    
	    var fileInput = $('#uploadImg').get(0).files[0];
	    var summernote = $('#summernote').summernote('code');	

		
	    if (!name) {
	        alert("商品名称不能为空")
	        return false;
	    }
	    if (!id) {
	        alert("商品ID不能为空")
	        return false;
	    }
	    if (price<=0) {
	        alert("价格错误")
	        return false;
	    }
	    if (stock<1) {
	        alert("库存错误")
	        return false;
	    }
	    
	    if(!fileInput){
			alert("请选择上传文件！");
			return false;
		}
		if (summernote<10) {
      	  	alert("商品详细信息字符需大于10");
    	    return false;
  		  }


		alert(summernote.length);
	    return true;//如果return false，则校验不通过，表单不会提交

	} 
	var options = {
	    url: "${pageContext.request.contextPath}/product/addproduct", //提交地址：默认是form的action,如果申明,则会覆盖
	    type: "post",   //默认是form的method（get or post），如果申明，则会覆盖
	    beforeSubmit: beforeCheck, //提交前的回调函数
	    success: successfun,  //提交成功后的回调函数
	    //target: "#output",  //把服务器返回的内容放入id为output的元素中
	    dataType: "json", //html(默认), xml, script, json...接受服务端返回的类型
	   	//clearForm: true,  //成功提交后，是否清除所有表单元素的值
	    //resetForm: true,  //成功提交后，是否重置所有表单元素的值
	    timeout: 6000     //限制请求的时间，当请求大于3秒后，跳出请求
	};
	$('#addproduct').ajaxForm(options)
	
	

	</script>

</html>