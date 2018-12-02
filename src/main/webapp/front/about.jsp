<%@page import="com.enterprise.entity.About"%>
<%@page import="com.enterprise.entity.Navigation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" %>

<%@include file="/front/common/htmlBase.jsp" %>
<%@include file="/front/common/header.jsp" %>
<%@include file="/front/common/banner.jsp" %>
<script type="text/javascript">
$(function(){
	
	$("ul.nav_left li a").on("click",function(){
		 $('ul.nav_left li').removeClass('active');
		 $(this).parent().addClass('active');
		 $("div[id*='aboutContent_']").hide();
		 var id = $(this).parent().attr("id");
		 $("#aboutContent_"+id).show();
	});
	
})
</script>
   <div class="com_zi clearfix">
		<div class="left_zi">
			<div class="top_com">
				<span>关于我们</span>
			</div>
			<ul class="nav_left">
			   <c:forEach var="item"  varStatus="status" items="<%=SystemManage.getInstance().getAbout()%>">
                    <li id="${item.id }" <c:if test="${item.id == id }"> class="active"</c:if> ><a>${item.title}</a></li>
               </c:forEach>
               <li id="${id }" <c:if test="${id == '999' }"> class="active"</c:if>><a >联系我们</a></li>
			</ul>
			
		</div>
		<div class="right_zi" >
		    <%  About a = SystemManage.getInstance().getAbout().get(0); %>
		     <c:forEach var="item"  varStatus="status"  items="<%=SystemManage.getInstance().getAbout()%>">
		           
		           <div id="aboutContent_${item.id }" <c:choose><c:when test="${item.id == id }"> style="display:block;" </c:when><c:otherwise> style="display:none;"</c:otherwise></c:choose>  >
                       <div class="bar clearfix">
							<span class="b_tt">${item.title}</span>
							<span class="curbar"><i>您当前的位置：</i><a href="<%=path%>/index">首页</a> >
							<a href="<%=path%>/about?id=<%=a.getId() %>>">关于我们</a> 
							> <i>${item.title}</i></span>
					   </div>
					   <div class="about_zi">
					       ${item.contentHtml}
					   </div>  
		           </div>
			</c:forEach>
			
			
			<div id="aboutContent_999" <c:choose><c:when test="${id == '999' }"> style="display:block;" </c:when><c:otherwise> style="display:none;"</c:otherwise></c:choose> >
			     <div class="cont_zi">
						<div class="contact_map">
						<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=6d88e38ab7f507ee19cec46443691d95"></script>
							<div id="map"></div>
							<script type="text/javascript">
					    // 百度地图API功能
					    var map = new BMap.Map("map");    // 创建Map实例
					    var point = new BMap.Point(113.58474,22.255719);   //坐标拾取网址：http://api.map.baidu.com/lbsapi/getpoint/index.html
					
					    var marker = new BMap.Marker(point);  // 创建标注
					    var mapStyle = {style:"normal"};
		    			map.setMapStyle(mapStyle);
		
					    var top_left_control = new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT});// 左上角，添加比例尺
					    var top_left_navigation = new BMap.NavigationControl();  //左上角，添加默认缩放平移控件
					
					    marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
					    map.centerAndZoom(point, 18);  // 初始化地图,设置中心点坐标和地图级别
					    map.addOverlay(marker);               // 将标注添加到地图中
					    map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
					    map.addControl(new BMap.MapTypeControl());   //添加地图类型控件
					    map.setCurrentCity("珠海");          // 设置地图显示的城市 此项是必须设置的
						
					
					
					    window.onresize = function(){
					
					        map.centerAndZoom(point, 15);  // 重置窗口的时候 重新获取中心点坐标的位置
					
					    }
		
				    map.addControl(top_left_control);
				    map.addControl(top_left_navigation);
					</script>
					</div>
					<div class="con_cc">
						<div class="left">
							<img src="images/contact_wei.jpg" alt="" />
							<p>CONTACT US</p>
						</div>
						<ul class="right">
							<li class="clearfix">
								<b>公司名称：</b><span><%=SystemManage.getInstance().getSystemSetting().getName()%></span>
							</li>
							<li class="clearfix">
								<b>电话：</b><span><%=SystemManage.getInstance().getSystemSetting().getTel()%></span>
							</li>
							<li class="clearfix">
								<b>邮箱：</b><span><%=SystemManage.getInstance().getSystemSetting().getEmail()%></span>
							</li>
							<li class="clearfix">
								<b>手机：</b><span><%=SystemManage.getInstance().getSystemSetting().getPhone()%></span>
							</li>
							<li class="clearfix">
								<b>地址：</b><span><%=SystemManage.getInstance().getSystemSetting().getAddress()%></span>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>


<%@include file="/front/common/foot.jsp" %>