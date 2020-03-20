<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
  <title>summernote - bs3fa4</title>

 
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>

</head>
<body>

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