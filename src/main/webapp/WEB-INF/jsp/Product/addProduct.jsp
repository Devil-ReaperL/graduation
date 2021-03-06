<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>管理员界面</title>
	<style type="text/css">
		
</style>
	
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

</head>
<body>
	
	<jsp:include page="/WEB-INF/jsp/product/headadmin.jsp" flush="true" ></jsp:include>
	<link href="${pageContext.request.contextPath}/CSS/bootstrap.css" rel="stylesheet">
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
			
			<c:if test="${not empty attrs}">
			
			<div class="form-group" style="width: 23%">
				<label for="attr" class="addlable form-inline">商品类别：</label>
				<select id="attr" name="attr" class="form-control" style="font-size: 20px;">
				<c:forEach items="${attrs}" var="attr">
					<option value="${attr.id}">${attr.name}</option>
				</c:forEach>
				</select>				
			</div>
			</c:if>
			
			<div class="form-group" style="width: 50%">
				<label for="spinner1" class="addlable">商品价格：</label>

			  	<input name="price" type="text" id="spinner1" class="spinner form-control" maxlength="10" value="5"  style="width: 100px;
    		text-align: -webkit-center;font-size: 20px;border-radius: 0px;" datestyle="float"/>
			  	

			</div>
			<div class="form-group" style="width: 50%">
				<label for="spinner" class="addlable">商品库存：</label>

			  	<input name="stock" type="text" id="spinner" class="spinner form-control" maxlength="10" value="5"  
			  			style="width: 100px;font-size:20px;
    					text-align: -webkit-center;border-radius: 0px;" datestyle="int" />
			  	

			</div>
			
			</div>
    		              
            <div class="container kv-main" style="width: 52%">
                 <div class="form-group">
                 <style TYPE="text/css">
                 	.btn{
                 		    font-weight: normal;
						    text-align: center;
						    white-space: nowrap;
						    height: auto;
                 	}
                 	.form-control {
                 			font-size: 16px;
							line-height: 1.42857143;
							color: #555555;
							background-color: #fff;
							background-image: none;
							border: 1px solid #ccc;
							border-radius: 4px;
							padding: 0px;
							}
							
                 </style>
                	  <label for="uploadImg" class="addlable">展示照片：</label>
                      <input name="files" id="uploadImg" type="file" multiple class="file " style="font-size: 16px;height: 32px" data-overwrite-initial="false" data-min-file-count="1">
                  </div>                       
            </div>
            
            <div style="width: 52%;margin: auto" >
            	<label for="summernote" class="addlable">详细信息：</label>
   			 	<textarea id="summernote" name="summernote"></textarea>
   			 	<button   id="BTN" class="btn btn-danger btn-lg" style="float: right;width: 120px;font-size: 20px;height: auto;">提交</button>
    		</div>  	
    		
           </form>
           <br> <br>
		<jsp:include page="/WEB-INF/jsp/foot.jsp" flush="true" ></jsp:include>
	
		
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
        maxFileCount: 4,
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
	    if(data==true)
	    	{
	    	alert('商品添加成功')
	    	window.location.href="${pageContext.request.contextPath}/admin/search";
	    	}
	    	
	   	else
	   		alert("添加商品的商品编号已经存在")
	}
	function modifySubmitData() {
		var files1=$(".file-preview-frame").length
		if(files1<1){
			alert("请选择上传文件！");
			return false;
		}
	if(files1>8){
		alert("最多上传4张图片");
		return false;
	}
		$('#spinner1').val(parseFloat($('#spinner1').val()))
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

		
		
	    return true;//如果return false，则校验不通过，表单不会提交

	} 
	var options = {
	    url: "${pageContext.request.contextPath}/product/addproduct", //提交地址：默认是form的action,如果申明,则会覆盖
	    type: "post",   //默认是form的method（get or post），如果申明，则会覆盖
	    beforeSubmit: beforeCheck, //提交前的回调函数
	    success: successfun,  //提交成功后的回调函数
	    beforeSerialize: modifySubmitData,
	    //target: "#output",  //把服务器返回的内容放入id为output的元素中
	    dataType: "json", //html(默认), xml, script, json...接受服务端返回的类型
	   	//clearForm: true,  //成功提交后，是否清除所有表单元素的值
	    //resetForm: true,  //成功提交后，是否重置所有表单元素的值
	    timeout: 6000     //限制请求的时间，当请求大于3秒后，跳出请求
	};
	$('#addproduct').ajaxForm(options)
	
	$('#BTN').click(function() {
		history.pushState("", "", "${pageContext.request.contextPath}/admin/search");
	})

	</script>

</html>