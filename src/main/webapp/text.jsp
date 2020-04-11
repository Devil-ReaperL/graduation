<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<div class="my-order-list-head clearfix"><div class="date" style="width: 200px;">2020-04-11 13:44:15</div><div class="no">订单号：<a href="/shop/order/show/id/216160/" class="red">566136482000150528</a></div><div class="info">	<span style="color:red;">待支付</span></div></div><div class="my-order-list-body clearfix"><div class="my-order-list-item"><div class="my-order-list-goods clearfix"><div class="img"><a href="${pageContext.request.contextPath}/product/info/23423423423"><img src="/image/7d1fec8f-ba83-4658-96b1-0534a858e36a\b9ac407f-e0a0-44e1-944e-e0ee7d1aea99.jpg" width="60" height="60" /></a></div><div class="name"><h3><a href="${pageContext.request.contextPath}/product/info/23423423423" target="_blank">Cherish珍爱鲜花系列9枝戴安娜粉玫瑰+紫色勿忘我</a></h3><ul class="clearfix">+<div class="my-order-list-info"><p>送达时间：2020-04-14 00:00:00 不限时段<br />订货电话：111<br />留言信息：<br />有些人，因为新鲜感而爱你。而有些人，是因为看懂了你的灵魂。前者会在热情消退后离开，而后者可以陪你一辈子。所以爱的再热烈，也不如爱的有理由。七夕快乐！</p><ul class="clearfix"><li><label>收货电话：</label>15999999999</li></ul><ul class="clearfix"><li><label>收货地址：</label>北京<p><a href="${pageContext.request.contextPath}/shop/payment/566136482000150528" class="block">立即支付</a></p>	<p><a href="/shop/order/cancel/id/566136482000150528" res="confirm">取消订单</a></p><p><a href="/shop/order/show/id/216160/">查看订单</a></p></div></div></div><div class="my-order-list-head clearfix"><div class="date" style="width: 200px;">2020-04-10 20:33:42</div><div class="no">订单号：<a href="/shop/order/show/id/216160/" class="red">565877136972455936</a></div><div class="info">	<span style="color:red;">等待发货</span></div></div><div class="my-order-list-body clearfix"><div class="my-order-list-item"><div class="my-order-list-goods clearfix"><div class="img"><a href="${pageContext.request.contextPath}/product/info/1231232"><img src="/image/91515837-3322-4404-99de-320c7f071a82\d0ad33da-11bd-491b-a24e-f54c6d33ca10.jpg" width="60" height="60" /></a></div><div class="name"><h3><a href="${pageContext.request.contextPath}/product/info/1231232" target="_blank">Cherish珍爱鲜花系列9枝戴安娜576</a></h3><ul class="clearfix">+<div class="my-order-list-info"><p>送达时间：2020-04-13 00:00:00 不限时段<br />订货电话：111<br />留言信息：<br />有些人，因为新鲜感而爱你。而有些人，是因为看懂了你的灵魂。前者会在热情消退后离开，而后者可以陪你一辈子。所以爱的再热烈，也不如爱的有理由。七夕快乐！</p><ul class="clearfix"><li><label>收货电话：</label>15944444444</li></ul><ul class="clearfix"><li><label>收货地址：</label>江苏	<p><a href="/shop/order/cancel/id/565877136972455936" res="confirm">取消订单</a></p><p><a href="/shop/order/show/id/216160/">查看订单</a></p></div></div></div>

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