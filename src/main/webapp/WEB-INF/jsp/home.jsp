<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>鲜花速递网站-好花网!网上订鲜花,百株好花只取一朵精华</title>
    <meta name="keywords" content="鲜花，鲜花网，鲜花速递，网上订花，好花网" />
    <meta name="description" content="好花网, 百株好花只取一朵精华！好花网深知每一张订单都蕴含重大的意义，视口碑为生命，多年来专注鲜花速递行业，以感恩心态服务每一位客户。好花网赋予鲜花以文化、艺术的魅力，不断推出有故事的创新花束；好花网已经设计出超100多款花束，我们会持续引领花艺潮流，确保产品品质稳定如一！" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/slick.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/showDialog.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/base.css" />
	
</head>

<body>
<jsp:include page="/WEB-INF/jsp/homehead.jsp" flush="true" ></jsp:include>
	<script type="text/javascript" src="${pageContext.request.contextPath}/JS/slick.js"></script>
	
<div class="full-slider">
    <div class="banner">
        <a class="item" >
            <div class="img" style="background-image: url(${pageContext.request.contextPath}/img/lb1.jpg);" data-lazy="${pageContext.request.contextPath}/img/lb1.jpg"></div>
        </a>
        <a class="item" >
            <div class="img" style="background-image: url(${pageContext.request.contextPath}/img/lb2.jpg);" data-lazy="${pageContext.request.contextPath}/img/lb2.jpg"></div>
        </a>
        <a class="item">
            <div class="img" style="background-image: url(${pageContext.request.contextPath}/img/lb3.jpg);" data-lazy="${pageContext.request.contextPath}/img/lb3.jpg"></div>
        </a>
    </div>
    <div class="slider-nav">

        <div class="item">
            <img src="${pageContext.request.contextPath}/img/22.jpg" />
        </div>
        <div class="item">
            <img src="${pageContext.request.contextPath}/img/33.jpg" />
        </div>
        <div class="item">
            <img src="${pageContext.request.contextPath}/img/44.jpg" />
        </div>
    </div>
</div>

<c:forEach items="${products}" var="aa">
    <div>
        <div class="wrap indexblock">

            <div class="h50"></div>
            <c:forEach items="${attrs}" var="attr">
             <c:if test="${attr.id eq aa.key}">
            <div class="ibbar" >
                <h3><strong><font size="5">${attr.name}</font></strong> <span>${attr.describe}</span></h3>
                    

            </div>

            <div class="ibcon clearfix">
                <div class="left ib201">
                <a class="info" href="#">
                    <div class="img"><img src="${pageContext.request.contextPath}/${attr.path}" height="412" /></div>
                    <h5>${attr.name}专区</h5>
                    <p>进入专区</p>
                </a>
            </div>
             </c:if>
             	
                </c:forEach>
                <div class="left ib202">
                    <ul>
                          <c:forEach items="${aa.value}" var="aaa">
                                <li>
                                    <a class="info imghover" href="${pageContext.request.contextPath}/product/info/${aaa.id}">
                                  

                                        <div class="img"><img src="/image/${aaa.srcs[0]}" height="242" onclick="lds() "/></div>
                                        <h5>${aaa.name}</h5>
                                        <p class="price">¥
                                        <span>${aaa.price}</span>

                                        </p>
                                    </a>
                                </li>
                          </c:forEach>

                    </ul>
                </div>
            </div>
        </div>
</c:forEach>
<jsp:include page="/WEB-INF/jsp/foot.jsp" flush="true" ></jsp:include>
	
</body>
<script type="text/javascript">

</script>
</html>
