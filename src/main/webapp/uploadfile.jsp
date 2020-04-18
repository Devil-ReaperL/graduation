<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8"/>
        <link href="${pageContext.request.contextPath}/CSS/summernote.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/CSS/bootstrap.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/CSS/default.css" rel="stylesheet" type="text/css" >
        <link href="${pageContext.request.contextPath}/CSS/fileinput.css" media="all" rel="stylesheet" type="text/css" />
      	<link href="${pageContext.request.contextPath}/CSS/jquery-ui.css" rel="stylesheet">
      	
        <script src="${pageContext.request.contextPath}/JS/jquery.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/JS/fileinput.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/JS/bootstrap.js"></script>
    	<script src="${pageContext.request.contextPath}/JS/summernote.js"></script>
    	<script src="${pageContext.request.contextPath}/JS/jquery.spinner.js"></script>
    </head>
    <body>
		<form enctype="multipart/form-data" action="${pageContext.request.contextPath}/uploadImg/file" method="post">
    		
    		<div class="form-group" style="width: 50%">
				<label for="name">商品名称</label>
				<input type="text" class="form-control" id="name" 
			  			 placeholder="请输入商品名称">
			</div>
			
			<div class="form-group" style="width: 50%">
				<label for="ID">商品编号</label>
				<input type="text" class="form-control" id="ID" 
			  			 placeholder="请输入商品编号">
			</div>
			
			<div class="form-group" style="width: 50%">
				<label for="ID">商品价格</label>

			  	<input type="text" id="spinner" class="spinner" maxlength="10" value="5"  style="width: 100px;
    text-align: -webkit-center;" datestyle="int"/>
			  	

			</div>
			<div class="form-group" style="width: 50%">
				<label for="ID">商品价格</label>

			  	<input type="text" id="spinner" class="spinner" maxlength="10" value="5"  style="width: 100px;
    text-align: -webkit-center;" datestyle="float"/>
			  	

			</div>
			
    		              
            <div class="container kv-main" style="width: 50%">
                 <div class="form-group">
                      <input name="files" id="uploadImg" type="file" multiple class="file" data-overwrite-initial="false" data-min-file-count="1">
                  </div>                       
            </div>
            
            <div style="width: 50%;margin:20px auto" >
   			 	<textarea id="summernote" name="summernote"></textarea>
    		</div>
    		
    		<button type="button" class="btn btn-danger btn-lg" >提交</button>
    		
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
        uploadAsync: false,
        showCancel:false,
        dropZoneEnabled: false,
        showUpload:false,
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
            actionUpload:''//去除上传预览缩略图中的上传图片；
       
        }, 
        slugCallback: function(filename) {
            return filename.replace('(', '_').replace(']', '_');
        }
    
	});
	
    
	</script>
</html>