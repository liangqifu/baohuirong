
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <div class="footer">
		<div class="footer_com clearfix">
			<ul class="di_nav">
				<li>
					<p class="tit">关于我们</p>
					 <c:forEach var="item"  varStatus="status"  items="<%=SystemManage.getInstance().getAbout()%>">
						<a href="<%=path %>/about?id=${item.id }">${item.title }</a>
					</c:forEach>
					<a href="<%=path %>/about?id=999">联系我们</a>
					
				</li>
				
				<li>
					<p class="tit">联系我们</p>
					<p style="white-space: nowrap;">地址:<%=SystemManage.getInstance().getSystemSetting().getAddress()%></p> 
					<p style="white-space: nowrap;">电话:<%=SystemManage.getInstance().getSystemSetting().getTel()%></p>
					<p style="white-space: nowrap;">邮箱:<%=SystemManage.getInstance().getSystemSetting().getEmail()%></p>
					<p style="white-space: nowrap;">网址:<%=SystemManage.getInstance().getSystemSetting().getWww()%></p>
				</li>
			</ul>
			<div class="er_right">
				<div class="er">
					<div class="pic">
						<img src="<%=SystemManage.getInstance().getSystemSetting().getImageRootPath()%>/<%=SystemManage.getInstance().getSystemSetting().getQrcode()%>" alt="" class="vcenter">
						<i></i>
					</div>
					<div class="text">
						<span>微信公众平台</span>
						<span>关注宝汇融</span>
					</div>
				</div>
				
			</div>
			
		</div>
		<div class="copy clearfix">
			<div class="copy_cc">
				<span> Copyright(c)2018版权所有 <%=SystemManage.getInstance().getSystemSetting().getTitle()%> <%=SystemManage.getInstance().getSystemSetting().getIcp()%> </span> 
			</div>
		</div>
	</div>

</body>
</html>
