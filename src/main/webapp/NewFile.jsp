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

  <script type="text/javascript">
    $('#summernote').each(function() {
		var $this = $(this);
		var placeholder = $this.attr("placeholder") || '';
		var url = $this.attr("action") || '';
		$this.summernote({
			lang : 'zh-CN',
			placeholder : placeholder,
			minHeight : 300,
			dialogsFade : true,// Add fade effect on dialogs
			dialogsInBody : true,// Dialogs can be placed in body, not in
			// summernote.
			disableDragAndDrop : false,// default false You can disable drag
			// and drop
			callbacks : {
				onImageUpload : function(files) {
					var $files = $(files);
					$files.each(function() {
						var file = this;
						var data = new FormData();
						data.append("file", file);

						$.ajax({
							data : data,
							type : "POST",
							url : url,
							cache : false,
							contentType : false,
							processData : false,
							success : function(response) {
								var json = YUNM.jsonEval(response);
								YUNM.debug(json);
								YUNM.ajaxDone(json);

								if (json[YUNM.keys.statusCode] == YUNM.statusCode.ok) {
									// 文件不为空
									if (json[YUNM.keys.result]) {
										var imageUrl = json[YUNM.keys.result].completeSavePath;
										$this.summernote('insertImage', imageUrl, function($image) {

										});
									}
								}

							},
							error : YUNM.ajaxError
						});
					});
				}
			}
		});
	});
  </script>
</head>
<body>
<div class="container">
	<form class="form-horizontal required-validate" action="#" enctype="multipart/form-data" method="post" οnsubmit="return iframeCallback(this, pageAjaxDone)">
	<div class="form-group">
		<label for="" class="col-md-2 control-label">0000</label>
		<div class="col-md-8 tl th">
			<input type="file" name="image" class="projectfile" value="${deal.image}"/>
			<p class="help-block">not 2.0M</p>
		</div>
	</div>
	
	  <div class="form-group">
		<label for="" class="col-md-2 control-label">xiang</label>
		<div class="col-md-8">
			<div id="summernote" class="summernote" name="description" placeholder="111111111" action="/file">22222</div>
		</div>
	</div>
	</form>
</div>
</body>
</html>