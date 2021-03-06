
<html>

<head>
    <title>input files的预览图||文件列表删除操作 -- By SlippersClown.黑皮</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <style>
        img {
            width: 100%;
            max-height: 150px;
        }
        
        div.pre-item {
            width: 200px;
            padding: 20px 0;
        }
        
        .pre-item {
            cursor: pointer;
            position: relative;
        }
        
        .pre-item:hover::after {
            content: '点击删除';
            padding: 10px 0px;
            border-radius: 5px;
            z-index: 1;
            position: absolute;
            top: 50%;
            left: 50%;
            cursor: pointer;
            width: 80%;
            text-align: center;
            background-color: rgba(0, 0, 0, .7);
            color: #FFF;
            transform: translate(-50%, -50%);
        }
        
        input[type="file"] {
            position: relative;
            width: 0;
            height: 0;
            margin-bottom: 40px;
        }
        
        input[type="file"]::after {
            content: '选择要上传的文件';
            background-color: rgb(12, 150, 229);
            border-radius: 5px;
            position: absolute;
            width: 200px;
            color: #FFF;
            line-height: 30px;
            font-size: 14px;
            cursor: pointer;
            top: 0;
            left: 0;
            text-align: center;
        }
    </style>
</head>

<body>
    <input type="file" id="upload" multiple>
    <div id="file-list-dom"></div>
    <script>
        /**********************************************
         *                                            *
         * @authors Hacker丶Wand (578112964@qq.com)   *
         * @link http://www.slippersclown.com         *
         * @date    2016-10-29 22:20:18               *
         *                                            *
         **********************************************/
        let upload = document.querySelector('#upload');
        let fileListDom = document.querySelector('#file-list-dom');

        let fileList = {};
        let formData = new FormData();
        upload.addEventListener('change', function() {
            for (let i = this.files.length - 1; i >= 0; i--) {
                let file = this.files[i];
                let key = file.name;
                let fileItem = {
                    'file': file,
                    'cover': ''
                }

                if (/(image\/)/.test(file.type)) {
                    let reader = new FileReader();
                    reader.readAsDataURL(file);
                    reader.onload = function() {
                        fileItem.cover = this.result;
                        fileList[key] = fileItem;
                        formData.append(key, file);
                        showFile(key, true);
                    }
                } else {
                    fileList[key] = fileItem;
                    formData.append(key, file);
                    showFile(key, false);
                }

            }
        });

        // 触发删除事件
        fileListDom.addEventListener('click', function(e) {
            let target = e.target || e.srcElement;
            if (target.classList.contains('pre-item')) {
                delFile(target.getAttribute('key'));
            }
        });

        // 显示图片
        function showFile(key, isImg) {
            let file = document.querySelector(`[key="${key}"]`);
            if (file === null) {
                if (isImg) {
                    fileListDom.innerHTML += '<div key="' + key + '" class="pre-item"><img src="' + fileList[key].cover + '"/></div>';
                } else {
                    fileListDom.innerHTML += '<div key="' + key + '" class="pre-item">' + key + '</div>';
                }
            } else {
                file.style.display = 'block';
            }
        }

        // 删除图片
        function delFile(key) {
            let file = document.querySelector(`[key="${key}"]`);
            if (file !== null) {
                delete fileList[key];
                formData.delete(key);
                file.style.display = 'none';
            }
        }
    </script>
</body>

</html>