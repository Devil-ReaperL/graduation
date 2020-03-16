<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8"/>
        
        <link href="${pageContext.request.contextPath}/CSS/bootstrap.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/CSS/default.css" rel="stylesheet" type="text/css" >
        <link href="${pageContext.request.contextPath}/CSS/fileinput.css" media="all" rel="stylesheet" type="text/css" />
        
        <script src="${pageContext.request.contextPath}/JS/jquery.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/JS/fileinput.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/JS/bootstrap.js"></script>
    </head>
    <body>
            <div class="htmleaf-container">
                
                <div class="container kv-main">
                   
                    <form enctype="multipart/form-data">
                        
                        <div class="form-group">
                            <input name="uploadImg" id="uploadImg" type="file" multiple class="file" data-overwrite-initial="false" data-min-file-count="1">
                        </div>
                        
               </form>
               </div>
            </div>
    </body>
	<script>
    $("#uploadImg").fileinput({
        uploadUrl: '#', // you must set a valid URL here else you will get an error
        allowedFileExtensions : ['jpg', 'png','gif'],
        overwriteInitial: false,
        uploadAsync: false,
        showCancel:false,
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
            actionUpload:'',//去除上传预览缩略图中的上传图片；
           
        }, 
        slugCallback: function(filename) {
            return filename.replace('(', '_').replace(']', '_');
        }
    
	});
   
    
	</script>
</html>