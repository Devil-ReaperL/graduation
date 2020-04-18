<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Summernote</title>
           <link href="${pageContext.request.contextPath}/CSS/fileinput.css" media="all" rel="stylesheet" type="text/css" />
           <link href="${pageContext.request.contextPath}/CSS/bootstrap.css" rel="stylesheet">
   
    <link  href="${pageContext.request.contextPath}/CSS/other/remark.css" rel="stylesheet">
   <script src="${pageContext.request.contextPath}/JS/jquery.js"></script>
   <script src="${pageContext.request.contextPath}/JS/fileinput.js" type="text/javascript"></script>   
    
    <script src="${pageContext.request.contextPath}/JS/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/JS/summernote.js"></script>
    <style type="text/css">
.divX
{
    z-index:200;
    -moz-border-radius:20px;
    -webkit-border-radius:20px;
    line-height:10px;
    text-align:center;
    font-weight:bold;
    cursor:pointer;
    font-size:10px;
	display: none;
}
</style>

</head>

<body>
<div class="starts">
			<ul id = "pingStar">
				<li rel = "1" title = "1分"></li>
				<li rel = "2" title = "2分"></li>
				<li rel = "3" title = "3分"></li>
				<li rel = "4" title = "4分"></li>
				<li rel = "5" title = "5分"></li>
				<span id="dir"></span>
			</ul>
			<input type="hidden" value="" id = "startP" />
			
</div>
<br><br>
<div class="container kv-main" style="width: 50%">
<div class="form-group" style="min-height: 400px;">
     <input name="files" id="uploadImg" type="file" multiple class="file" data-overwrite-initial="false" data-min-file-count="1">
 </div> 
   <button>111</button>                        
</div>

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
    maxFileCount: 5,
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

</script>
</body>
</html>