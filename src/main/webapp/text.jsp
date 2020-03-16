<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Summernote</title>
    <link  href="${pageContext.request.contextPath}/CSS/summernote.css" rel="stylesheet">
    <link  href="${pageContext.request.contextPath}/CSS/bootstrap.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/JS/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/JS/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/JS/summernote.js"></script>
</head>

<body>
<form name="productTest" action="${pageContext.request.contextPath}/uploadImg/test"  method="post">
<div style="width: 50%;margin:20px auto" >
    <textarea id="summernote" name="summernote"></textarea>
    </div>
    <input type="submit">
</form>
    

<button onclick="xxxx()">1111</button>

</form>
<script>
    $(document).ready(function() {
        $('#summernote').summernote({
        	 height: 400,
             minHeight: 200,
             maxHeight: 400,
             lang: 'zh-CN',
            
         });
    
    });


    /**
     * 编辑器新增的ajax上传图片函数
     * @param files
     * @param editor
     * @param $editable
     * @returns {boolean}
   */
   function xxxx()
   {
	   alert( $('#summernote').summernote('code'))
	   return false;
   };
function uploadSummerPic(file, editor, $editable) {
    var fd = new FormData();
    fd.append("file", file);
    $.ajax({ 
        type:"POST",
        url:"/uploadImg/test",
        data: fd,
        cache: false,	
        contentType: false,
        processData: false,
        success: function (data) {
            editor.insertImage($editable, data.url);
        }
    });
}


</script>
</body>
</html>