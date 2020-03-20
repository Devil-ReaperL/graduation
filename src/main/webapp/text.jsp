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
    

<button type="button" onclick="xxxx()">1111</button>

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


   


</script>
</body>
</html>