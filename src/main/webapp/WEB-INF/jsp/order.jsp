<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>好花网 | 购物中心 &gt; 购物车</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	
	<meta   http-equiv="Expires"   CONTENT="0">     
	<meta   http-equiv="Cache-Control"   CONTENT="no-cache">     
	<meta   http-equiv="Pragma"   CONTENT="no-cache">  
 
</head>
<body>


<jsp:include page="/WEB-INF/jsp/head.jsp" flush="true" ></jsp:include>
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/base.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/flatpickr/flatpickr.min.css" />

    <script type="text/javascript" src="${pageContext.request.contextPath}/JS/jquery-2.1.4.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/JS/flatpickr/flatpickr.min.js"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/JS/flatpickr/zh.js"></script>

	<div class="wrap">

		<div class="cart-order">
		 
		<form id="from1" class="form-horizontal" role="form" action="${pageContext.request.contextPath}/shop/order" method="post" onsubmit="return toVaild()">
			<h2 style="margin-left: 95px">订单信息</h2>
			<div class="cart-address">
				<ul class="clearfix"><div class="cart-demo address-frm"><div class="cart-body frm-row" style="margin:0;">
				
					<li class="address-name" style="width: 300px;margin-left: 95px"><label>收货人： &nbsp &nbsp</label>
					
					
					<input type="text" class="row-input" name="phonenum" maxlength="11" pattern="[1][3,4,5,7,8,9][0-9]{9}" style="width:180px;" placeholder="请输入订货人手机" autocomplete="off"  required />
								
				</li></div></div>
					<li class="address-date"><label style="float:left;">送达时间：</label>
						<div style="float: left;" class="address-frm">
							<div class="frm-row">
								<input type="text" class="row-input flatpickr-input" name="arrive"   style="width:110px;text-align-last:center" placeholder="送达日期" autocomplete="off" readonly="readonly" required>
								<select class="row-input" name="segment" value="不限时段" style="width:110px;text-align-last:center ;padding-bottom: 10px; padding-top: 5px" required>
								<option value="不限时段">不限时段</option>
			
								<option value="08-10点">08-10点</option>
								<option value="10-12点">10-12点</option>
								<option value="12-14点">12-14点</option>
								<option value="14-16点">14-16点</option>
								<option value="16-18点">16-18点</option>
								<option value="18-20点">18-20点</option>
								<option value="20-22点">20-22点</option>
			
								<option value="上午">上午</option>
								<option value="下午">下午</option>
								<option value="晚上">晚上</option>
							</select>
							</div>
						</div>						
					</li>	
				</ul>
			</div>
			<div class="h40"></div>
			<div class="cart-demo address-frm">
				<div class="cart-label" style="width: 90px;font-size: 16px;line-height: 35px;margin-left: 95px">收货地址：</div>
				<div class="cart-body frm-row" style="margin:0;">
					<select name="province" id="address_province" class="row-input" style="width:121px;margin-right:3px;float: left;text-align-last:center" required>
						<option value="" selected="selected">请选择</option>
						<c:forEach items="${listDept}" var="dept">
							<option value="${dept.base_areaid}" >${dept.name}</option>
						</c:forEach>
					</select>				
					<div class="cart-label" style="width:20px;font-size: 16px;line-height: 35px;font-weight: 500;">省</div>					
					<select name="city" id="address_city" class="row-input" style="width:121px;margin-right:3px;float: left;text-align-last:center" required>
						<option value="" selected >请选择</option>
					</select>
					<div class="cart-label" style="width:20px;font-size: 16px;line-height: 35px;font-weight: 500">市</div>					
					<select name="county" id="address_county" class="row-input" style="width:121px;margin-right:3px;float: left;text-align-last:center" required>
						<option value="" selected >请选择</option>
					</select>
					<div class="cart-label" style="width:20px;font-size: 16px;line-height: 35px;font-weight: 500">县</div>					
				</div>
				<div class="clear"></div>
			</div> 
			<div class="h40"></div>
			<div class="cart-demo address-frm">
				<div class="cart-label" style="width: 90px;font-size: 16px;line-height: 35px;margin-left: 95px">详细地址：</div>
				<div class="cart-body frm-row" style="margin:0;">
					<input type="text" class="row-input" name="details"  style="width:1000px;" placeholder="请输入详细地址"  required/>
				</div>
				<div class="clear"></div>
			</div> 
			<div class="h40"></div>
			<div class="cart-demo">
				<div class="cart-label" style="width: 90px;font-size: 16px;margin-left: 95px">贺卡留言:</div>
				<div class="cart-body" style="width:550px;">
					<textarea style="width: 500px" class="cart-demo-input" name="message" __pattern="/.*$/"></textarea>
				</div>
				<div class="cart-body" style="width:465px;">
	<style>
		.tab-card {
		  height: 24px;
		  margin: 0 0 6px;
		  padding: 0;
		  list-style: none;
		}
		.tab-card:before, .tab-card:after {
		  content: " ";
		  display: table;
		}
		.tab-card:after {
		  clear: both;
		}
		.tab-card li {
		  line-height: 24px;
		  padding: 0 10px;
		  background-color: #eee;
		  float: left;
		  margin-right: 2px;
		  cursor: pointer;
		}
		.tab-card li:hover {
		  color: #ff2f2f;
		}
		.tab-card li.active{
		  color: #fff;
		  background-color: #ff6a00;
		}
		.card-content {
		  overflow-y: auto;
		  height: 190px;
		  padding: 0 10px;
		  border: 1px solid #ccc;
		}
		.card-content ul {
		  margin: 0;
		  padding: 0;
		  list-style: none;
		  display: none;
		}
		.card-content ul li:hover{
			color: #ff2f2f;
		}
		.card-content ul.active{
			display: block;
		}
		.card-content ul li {
		  line-height: 20px;
		  display: block;
		  max-width: 390px;
		  margin: 6px 0;
		  cursor: pointer;
		  overflow: hidden;
		  text-overflow: ellipsis;
		  white-space: nowrap;
		}
		body .tip-yellowsimple .tip-inner{font-size: 14px; line-height: 24px;}					
</style>
<link rel="stylesheet" type="text/css" href="//www.haohua.com/theme/haohua.com/default/static/poshytip/tip-yellowsimple/tip-yellowsimple.css" />
<script type="text/javascript" src="//www.haohua.com/theme/haohua.com/default/static/poshytip/jquery.poshytip.min.js"></script>


<ul class="tab-card">
	<li class="active">快捷留言</li>
	<li>生日祝福</li>
	<li>送恋人</li>
	<li>送朋友</li>
	<li>送长辈</li>
</ul>
<div class="card-content">
	<ul class="active">
	    <li data-title="有些人，因为新鲜感而爱你。而有些人，是因为看懂了你的灵魂。前者会在热情消退后离开，而后者可以陪你一辈子。所以爱的再热烈，也不如爱的有理由。七夕快乐！">1.有些人，因为新鲜感而爱你。而有些人，是因为看懂了你的灵魂。前者会在热情消退后离开，而后者可以陪你一辈子。所以爱的再热烈，也不如爱的有理由。七夕快乐！</li>
	    <li data-title="我的情人节里没有情人，只有老婆你，你是我的最爱，今天是，明天是，直到我死去我的心中也只有你!七夕情人节快乐，老婆!">2.我的情人节里没有情人，只有老婆你，你是我的最爱，今天是，明天是，直到我死去我的心中也只有你!七夕情人节快乐，老婆!</li>
	    <li data-title="你如缪斯女神般，存在我灵魂深处！七夕情人节快乐，我的女神！">3.你如缪斯女神般，存在我灵魂深处！七夕情人节快乐，我的女神！</li>
	    <li data-title="我能想到的最浪漫的事就是以后每年的七夕都有你的陪伴，我能感觉到最幸福的事就是与你一起携手白头到老，我爱你，亲爱的七夕情人节快乐！">4.我能想到的最浪漫的事就是以后每年的七夕都有你的陪伴，我能感觉到最幸福的事就是与你一起携手白头到老，我爱你，亲爱的七夕情人节快乐！</li>
	    <li data-title="“爱一个人绝不潇洒，为自己留了后步的，也就不是爱。”爱，应该像海水一般，纯净、清澈、湛蓝。亲爱的，七夕情人节快乐！">5.“爱一个人绝不潇洒，为自己留了后步的，也就不是爱。”爱，应该像海水一般，纯净、清澈、湛蓝。亲爱的，七夕情人节快乐！</li>
	    <li data-title="最温柔的月光也敌不过你转瞬间的回眸只要你肯转头我一直为你静候一生为期">6.最温柔的月光也敌不过你转瞬间的回眸只要你肯转头我一直为你静候一生为期</li>
	    <li data-title="我的小公举：我想陪着你，吃你最喜欢的好吃的；我想陪着你，刷你最爱的电视剧；我想陪着你，泡你觉得最舒服…想陪着你，一直陪着你，还有好多想陪着你～你的小前半生我来不及参与，你的大后半生我可以奉陪到底吗～">7.我的小公举：我想陪着你，吃你最喜欢的好吃的；我想陪着你，刷你最爱的电视剧；我想陪着你，泡你觉得最舒服…想陪着你，一直陪着你，还有好多想陪着你～你的小前半生我来不及参与，你的大后半生我可以奉陪到底吗～</li>
	    <li data-title="风里有种浪漫气息缓缓流动，挑起了爱的情绪，一点一滴流入心中，对你情有独钟，想把整个世界都给你，都不觉得荒谬。七夕快乐！">8.风里有种浪漫气息缓缓流动，挑起了爱的情绪，一点一滴流入心中，对你情有独钟，想把整个世界都给你，都不觉得荒谬。七夕快乐！</li>
	    <li data-title="你的名字是我心里，深深的烙印，不断搜寻，你的身影。给你所有的幸福，我会好好呵护。希望你天天开心，永远幸福！做一个我心目中美丽的女人。1">9.你的名字是我心里，深深的烙印，不断搜寻，你的身影。给你所有的幸福，我会好好呵护。希望你天天开心，永远幸福！做一个我心目中美丽的女人。1</li>
	    <li data-title="我还是很喜欢你，像风走了八千里，不问归期；我还是很喜欢你，像雨洒落在热带与极地，不远万里；我还是很喜欢你，像风吹过杨柳泛起涟漪，昔我往矣；我喜欢你，很喜欢你，亲爱的七夕快乐！">10.我还是很喜欢你，像风走了八千里，不问归期；我还是很喜欢你，像雨洒落在热带与极地，不远万里；我还是很喜欢你，像风吹过杨柳泛起涟漪，昔我往矣；我喜欢你，很喜欢你，亲爱的七夕快乐！</li>
	</ul>
	<ul>
	    <li data-title="亲爱的，生日快乐，我只想唯一霸道的拥有着一个你。给我开开心心的一辈子。生日快乐！my love">1.亲爱的，生日快乐，我只想唯一霸道的拥有着一个你。给我开开心心的一辈子。生日快乐！my love</li>
		<li data-title="今天是你的生日，你最大！在这个属于你最灿烂的日子里，我诚挚的送上一句最古老但又是最新鲜出炉的生日祝福：生日快乐！健康平安！">2.今天是你的生日，你最大！在这个属于你最灿烂的日子里，我诚挚的送上一句最古老但又是最新鲜出炉的生日祝福：生日快乐！健康平安！</li>
		<li data-title="亲爱的~~生日快乐生日快乐生日快乐~爱你么么哒——给全世界最温柔最可爱的小姐姐~">3.亲爱的~~生日快乐生日快乐生日快乐~爱你么么哒——给全世界最温柔最可爱的小姐姐~</li>
		<li data-title="感谢上苍在今天给了我一个特别的礼物，就是你。长长的人生旅程，有你相伴是我一生的幸福。祝你生日快乐!">4.感谢上苍在今天给了我一个特别的礼物，就是你。长长的人生旅程，有你相伴是我一生的幸福。祝你生日快乐!</li>
		<li data-title="在这个特别的日子里，我没有别的话，只想你知道，每年今天，你都会收到我的祝福，感受到我的爱，永远的爱!">5.在这个特别的日子里，我没有别的话，只想你知道，每年今天，你都会收到我的祝福，感受到我的爱，永远的爱!</li>
		<li data-title="有些事我每天都挂念，但只能一年说一次。迟到了，对不起。生日快乐！">6.有些事我每天都挂念，但只能一年说一次。迟到了，对不起。生日快乐！</li>
		<li data-title="特别的日子，特别的祝福，送给生日的你：希望长大一岁的你更成熟，更顺利，更漂亮！年年18！">7.特别的日子，特别的祝福，送给生日的你：希望长大一岁的你更成熟，更顺利，更漂亮！年年18！</li>
		<li data-title="你虽不在我身旁可我从未将你遗忘…做你想做的事，去你想去的地方，爱你想爱的人，追求你想追求的梦想，亲爱的朋友，祝你生日快乐！">8.你虽不在我身旁可我从未将你遗忘…做你想做的事，去你想去的地方，爱你想爱的人，追求你想追求的梦想，亲爱的朋友，祝你生日快乐！</li>
		<li data-title="简单的一句话语，一个祝福，寄给一个远在他乡的你。虽然不常联系，但是不曾忘记。祝你生日快乐，更愿你天天都有个好心情!">9.简单的一句话语，一个祝福，寄给一个远在他乡的你。虽然不常联系，但是不曾忘记。祝你生日快乐，更愿你天天都有个好心情!</li>
		<li data-title="您的生日让我想起您对我的体贴，还有您为我所做的一切。我只希望您所给予我的幸福，我将同样回报给您。祝福您事事顺心，幸福无边!">10.您的生日让我想起您对我的体贴，还有您为我所做的一切。我只希望您所给予我的幸福，我将同样回报给您。祝福您事事顺心，幸福无边!</li>
		<li data-title="妈妈，生日快乐！真希望能有语言能表达我们的谢意，感谢您每日操持家务及给予我们的帮助。愿您在今后的岁月中永远快乐、健康！">11.妈妈，生日快乐！真希望能有语言能表达我们的谢意，感谢您每日操持家务及给予我们的帮助。愿您在今后的岁月中永远快乐、健康！</li>
	</ul>
	<ul>
	    <li data-title="遇到你我感到很幸福，但是我不能成为世界上最幸福的人，因为我们在一起，我要让你成为世界上最幸福的人。">
	        1.遇到你我感到很幸福，但是我不能成为世界上最幸福的人，因为我们在一起，我要让你成为世界上最幸福的人。
	    </li>
	    <li data-title="有些情感，无需多么华美，只是简单的遇见，简单的想念，哪怕它只是简单到：拉着你的手，迎着风走！">
	        2.有些情感，无需多么华美，只是简单的遇见，简单的想念，哪怕它只是简单到：拉着你的手，迎着风走！
	    </li>
	    <li data-title="我多么希望，有一个门口，早晨，阳光照在草上，我们站着，扶着自己的门扇，门很低，但太阳是明亮的。草在结它的种子，风在摇它的叶子，我们站着，不说话，就十分美好。">
	        3.我多么希望，有一个门口，早晨，阳光照在草上，我们站着，扶着自己的门扇，门很低，但太阳是明亮的。草在结它的种子，风在摇它的叶子，我们站着，不说话，就十分美好。
	    </li>
	    <li data-title="如果世界上曾经有那个人出现过，其他人都会变成将就，而我，不愿意将就。没遇到爱时，它是一个遥不可及的幻梦，遇到爱之后，它是一份可以被触碰的美好，不善言辞的我，爱上了你后，突然有很多话想说给你听..">
	        4.如果世界上曾经有那个人出现过，其他人都会变成将就，而我，不愿意将就。没遇到爱时，它是一个遥不可及的幻梦，遇到爱之后，它是一份可以被触碰的美好，不善言辞的我，爱上了你后，突然有很多话想说给你听..
	    </li>
	    <li data-title="我还是喜欢你，就像风追随云，我好想追到你，又怕吹散了你，春风十里，不如你。">
	        5.我还是喜欢你，就像风追随云，我好想追到你，又怕吹散了你，春风十里，不如你。
	    </li>
	    <li data-title="亲爱的：在这特别的日子，我只能用心去默默地想你、爱你。只想告诉你：永远深爱着你，希望你每年的今天都能过一个快乐的生日。">
	        6.亲爱的：在这特别的日子，我只能用心去默默地想你、爱你。只想告诉你：永远深爱着你，希望你每年的今天都能过一个快乐的生日。
	    </li>
	    <li data-title="为你的幸福而高兴，并且我愿付出一切让你更幸福。任何时候为爱你付出的一切都不是白白浪费。">
	        7.为你的幸福而高兴，并且我愿付出一切让你更幸福。任何时候为爱你付出的一切都不是白白浪费。
	    </li>
	    <li data-title="爱你是我一生无悔的决定，漫天星星都是我注视你的眼睛。无论结局如何，我都知道：此生最爱是你！">
	        8.爱你是我一生无悔的决定，漫天星星都是我注视你的眼睛。无论结局如何，我都知道：此生最爱是你！
	    </li>
	    <li data-title="时间会慢慢地让你了解，一个外表很冷漠又很怕羞的人，他的心却充满了对你的爱。">
	        9.时间会慢慢地让你了解，一个外表很冷漠又很怕羞的人，他的心却充满了对你的爱。
	    </li>
	    <li data-title="我的错误，划破了你的心。如今，我用我真挚的爱弥补你的伤口，请接受我的诚意。">
	        10.我的错误，划破了你的心。如今，我用我真挚的爱弥补你的伤口，请接受我的诚意。
	    </li>
	</ul>
	<ul class="tab-pane" id="cardPane02">
	    <li data-title="一切的不顺心都是纸老虎！希望你开心！">
	        1.一切的不顺心都是纸老虎！希望你开心！
	    </li>
	    <li data-title="不管世界尽头多寂寞，你的身边一定有我 ">
	        2.不管世界尽头多寂寞，你的身边一定有我 
	    </li>
	    <li data-title="不求同年同月同日生，但求同年同月同日疯 ">
	        3.不求同年同月同日生，但求同年同月同日疯 
	    </li>
	    <li data-title="最深的爱，总是风雨兼程；最浓的情，总是冷暖与共；最懂的人，才是最暖的伴。朋友，感恩有你。">
	        4.最深的爱，总是风雨兼程；最浓的情，总是冷暖与共；最懂的人，才是最暖的伴。朋友，感恩有你。
	    </li>
	    <li data-title="不是所有人都能掏心掏肺，不是所有的路过都是风景，不是所有的擦肩都是过客。但无论是对朋友还是爱人，只要是在乎我的，我都会加倍珍惜！">
	        5.不是所有人都能掏心掏肺，不是所有的路过都是风景，不是所有的擦肩都是过客。但无论是对朋友还是爱人，只要是在乎我的，我都会加倍珍惜！
	    </li>
	    <li data-title="吾在茫茫人海遇见了你，能成为知己，得知，我的幸运！">
	        6.吾在茫茫人海遇见了你，能成为知己，得知，我的幸运！
	    </li>
	    <li data-title="朋友就是那种不需要时刻想起，永远也不会忘记的人，当我需要的时候，还没有讲，你已来到我的身边。不过有你的做伴使我不再感到渺小和孤独。">
	        7.朋友就是那种不需要时刻想起，永远也不会忘记的人，当我需要的时候，还没有讲，你已来到我的身边。不过有你的做伴使我不再感到渺小和孤独。
	    </li>
	    <li data-title="无私无邪无猜无疑的友情无价，你是我买不到的奢华 ">
	        8.无私无邪无猜无疑的友情无价，你是我买不到的奢华 
	    </li>
	    <li data-title="人逢知己千杯少，难得在漫漫人生路上能认识你，在一起走过的日子，非常的感谢你给我的帮助，我始终不能忘记我们友谊，不能忘记我们在一起的点点滴滴，很想说有你真好，祝福你，我的朋友。">
	        9.人逢知己千杯少，难得在漫漫人生路上能认识你，在一起走过的日子，非常的感谢你给我的帮助，我始终不能忘记我们友谊，不能忘记我们在一起的点点滴滴，很想说有你真好，祝福你，我的朋友。
	    </li>
	    <li data-title="这些日子你过得还好吗？也许忙碌改变了我们的生活，但我永远珍惜我们的情谊。">
	        10.这些日子你过得还好吗？也许忙碌改变了我们的生活，但我永远珍惜我们的情谊。
	    </li>
	</ul>
	<ul>
	    <li data-title="引一缕清风，为妈妈带去轻松；采一缕阳光，为妈妈送去芬芳；掬一捧清水，为妈妈消去疲惫；送一束鲜花，为妈妈奉上祝福。祝妈妈生日快乐！">
	        1.引一缕清风，为妈妈带去轻松；采一缕阳光，为妈妈送去芬芳；掬一捧清水，为妈妈消去疲惫；送一束鲜花，为妈妈奉上祝福。祝妈妈生日快乐！
	    </li>
	    <li data-title="美丽动人可爱迷人的妈妈：生日快乐！青春永驻！虽然不能陪伴在你身边，我的心一直陪伴着你，我爱你，妈妈。">
	        2.美丽动人可爱迷人的妈妈：生日快乐！青春永驻！虽然不能陪伴在你身边，我的心一直陪伴着你，我爱你，妈妈。
	    </li>
	    <li data-title="“洗衣做饭忙不完，每日忙碌不着闲，历经风霜添白发，勤劳持家不知烦”。作为儿子女儿的我们，深知您每天的辛苦忙碌，但作为儿子女儿的我们，同样要给您幸福，祝您生日快乐，幸福万年长。">
	        3.“洗衣做饭忙不完，每日忙碌不着闲，历经风霜添白发，勤劳持家不知烦”。作为儿子女儿的我们，深知您每天的辛苦忙碌，但作为儿子女儿的我们，同样要给您幸福，祝您生日快乐，幸福万年长。
	    </li>
	    <li data-title="从一个城市到另一个城市，只有靠自己努力。学会长大，学会承受，学会哭过之后，还可以微笑地拥抱爸爸妈妈。因为你们一直是我的守护神！让我走到哪里都不会怕！">
	        4.从一个城市到另一个城市，只有靠自己努力。学会长大，学会承受，学会哭过之后，还可以微笑地拥抱爸爸妈妈。因为你们一直是我的守护神！让我走到哪里都不会怕！
	    </li>
	    <li data-title="谢谢您做的一切，双手撑起我们的家，总是竭尽所有把最好的给我们。不要再为我们而担心啦，你牵挂的孩子长大了。">
	        5.谢谢您做的一切，双手撑起我们的家，总是竭尽所有把最好的给我们。不要再为我们而担心啦，你牵挂的孩子长大了。
	    </li>
	    <li data-title="岁月总是越来越短，生日总是越来越快。留不住的时光使您走向人生的至善，留得住的贺卡捎去的是我深深的怀念。真心希望晚辈的祝福带给您欢乐！">
	        6.岁月总是越来越短，生日总是越来越快。留不住的时光使您走向人生的至善，留得住的贺卡捎去的是我深深的怀念。真心希望晚辈的祝福带给您欢乐！
	    </li>
	    <li data-title="听说神无法无处不在，所以创造了妈妈。即使到了妈妈的年龄，妈妈的妈妈仍然是妈妈的守护神。妈妈这个词，只是叫一叫，也觉得喉间哽咽。妈妈，最有力量的名字；妈妈，祝你永远年轻。">
	        7.听说神无法无处不在，所以创造了妈妈。即使到了妈妈的年龄，妈妈的妈妈仍然是妈妈的守护神。妈妈这个词，只是叫一叫，也觉得喉间哽咽。妈妈，最有力量的名字；妈妈，祝你永远年轻。
	    </li>
	    <li data-title="父爱如山，父爱无言，您总是微笑着担起了整个家庭。在我心中，您是全天下最好的爸爸。">
	        8.父爱如山，父爱无言，您总是微笑着担起了整个家庭。在我心中，您是全天下最好的爸爸。
	    </li>
	    <li data-title="您用优美的年轮，编成一册散发油墨清香的日历；年年，我都会在日历的这一天上，用深情的想念，祝福您的生日。">
	        9.您用优美的年轮，编成一册散发油墨清香的日历；年年，我都会在日历的这一天上，用深情的想念，祝福您的生日。
	    </li>
	    <li data-title="亲爱的妈妈：您曾用您坚实的臂弯为我撑起一片蓝天；而今，我也要用我日益丰满的羽翼为您遮挡风雨。妈妈，我永远爱您！生日快乐！祝我的美女妈妈越来越青春，身体健康，瘦成闪电，未来的我可以每个假期带你出去纵横~ ">
	        10.亲爱的妈妈：您曾用您坚实的臂弯为我撑起一片蓝天；而今，我也要用我日益丰满的羽翼为您遮挡风雨。妈妈，我永远爱您！生日快乐！祝我的美女妈妈越来越青春，身体健康，瘦成闪电，未来的我可以每个假期带你出去纵横~ 
	    </li>
	</ul>

</div>
				</div>
				<div class="clear"></div>
			</div>

			<div class="h40"></div>
			<div class="cart-order">
				<div class="cart-label" style="width: 125px;font-size: 16px;margin-left: 60px">核对购物清单:</div>
				<div class="cart-body">
					<c:if test="${not empty carts}">
					<c:forEach items="${carts}" var="cart">
					<ul class="order-list-item clearfix">
						<li class="img"><a href="${pageContext.request.contextPath}/product/info/${cart.product_id}" target="_blank"><img src="/image/${cart.picture}" width="70" height="70" /></a></li>
						<li class="txt">
							<h5>${cart.product_name}</h5>
						</li>
						<li class="price">¥<span>${cart.price}</span></li>
						<li class="num">${cart.num} 件</li>
					</ul>
					</c:forEach>
					</c:if>
				</div>
				<div class="clear"></div>
			</div>
			
			
			

			<div class="order-submit">
				<p class="total">${cart_info.checked}件商品，总商品金额： ¥<span>${cart_info.sum}</span></p>
				<p class="coupon" style="display:none">优惠： ¥<span>0.00</span></p>
				<p class="express" style="display:none">配送费： ¥<span>0.00</span></p>
				<p class="price">实付款： <b>¥<span>${cart_info.sum}</span></b></p>
				<p><button id="btn" >提交订单</button></p>
			</div>

		
		</div>
	
		</form>
		<div class="h60"></div>
		
	</div>
<script type="text/javascript">
$(function(){
	flatpickr.localize(flatpickr.l10ns.zh);
	$('input[name=arrive]').flatpickr({
		//minDate: '2020-04-05', //new Date().fp_incr(1),
		minDate: new Date().fp_incr(1), //new Date().fp_incr(1),
		maxDate: new Date().fp_incr(365), //new Date().fp_incr(365),
		defaultDate:new Date().fp_incr(3), // $('input[name="save-time"]').val().split(' ')[0], //'2020-04-06 10:00', //new Date().fp_incr(3),
		//enableTime: true,
		//defaultHour: 21,
		//time_24hr: true,
		//minuteIncrement: 30,
		//minTime: "08:00",
		//maxTime: "18:30",
		//dateFormat: "Y-m-d H:i D"
		dateFormat: "Y-m-d"
	});
	$('.card-content li').poshytip({className: 'tip-yellowsimple'});
	$('.tab-card li').click(function(){
		var index = $(this).index();
		$(this).addClass('active').siblings().not(this).removeClass('active');
		$('.card-content ul').removeClass('active').eq(index).addClass('active');
	});
	$('.card-content ul li').mouseover(function(){
		$(this).poshytip('update', $(this).data('title'));
	});
	$('.card-content ul li').click(function(){
		$('textarea[name=message]').val( $(this).data('title') );
	});
    $("#address_province").change( function () {
    	var provice = $(this).val() 
    		console.log(provice)
    	    //判断省份这个下拉框选中的值是否为空
    	    if (provice == "") {
    		$("#address_county").html("<option value=\"\" selected >请选择</option>");
    		$("#address_city").html("<option value=\"\" selected >请选择</option>");
    	        return;
    	    }
    	    $("#address_city").html("");
    	    var str = "<option value='' selected >请选择</option>";
    		$("#address_county").html("<option value=\"\" selected >请选择</option>");

    	    $.ajax({
    	        type: "POST",
    	        url: "${pageContext.request.contextPath}/shop/provinceCity",
    	        data: { "province": provice },
    	        dataType: "JSON",
    	        async: false,
    	        success: function (data) {
    				console.log(data)
    				for ( var i in data) {
    					str += "<option value=" + data[i].base_areaid + ">" + data[i].name + "</option>";
					}
    	            //从服务器获取数据进行绑定
    	           // $.each(data.Data, function (i, item) {
    	           //     str += "<option value=" + item.Id + ">" + item.MyTexts + "</option>";
    	           // })
    	            //将数据添加到省份这个下拉框里面
    	            $("#address_city").append(str);
    	        },
    	        error: function () { alert("Error"); }
    	    });
    	})
    	 $("#address_city").change( function () {
    	var city = $(this).val() 
    		console.log(city)
    	    //判断省份这个下拉框选中的值是否为空
    	    if (city == "") {
    		 $("#address_county").html("<option value=\"\" selected >请选择</option>");
    	        return;
    	    }
    	    $("#address_county").html("");
    	    var str = "<option value=\"\" selected >请选择</option>";
			console.log(str)

    	    $.ajax({
    	        type: "POST",
    	        url: "${pageContext.request.contextPath}/shop/provinceCounty",
    	        data: { "city": city },
    	        dataType: "JSON",
    	        async: false,
    	        success: function (data) {
    				console.log(data)
    				for ( var i in data) {
    					str += "<option value=" + data[i].base_areaid + ">" + data[i].name + "</option>";
					}
    	            //从服务器获取数据进行绑定
    	            //将数据添加到省份这个下拉框里面
    	            $("#address_county").append(str);
    	        },
    	        error: function () { alert("Error"); }
    	    });
    	})
    	history.pushState("", "", "${pageContext.request.contextPath}");
    	
});
function toVaild() {
	

	return true;
}


</script>

</body>


</html>
