<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" %>
<header class="header">
		<div class="top">
			<div class="top_div">
			  <span>登陆 | 注册</span>
			</div>
		</div>	  
	    <div class="kuan_heaaer clearfix">
		 <div class="kuan_heaaer_div">
	    	<a href="<%=path %>/" class="logo">
	    		<img src="<%=SystemManage.getInstance().getSystemSetting().getImageRootPath() %><%=SystemManage.getInstance().getSystemSetting().getLogo() %>" alt="" />
	    	</a>
	    	<div class="nav_div">
	    		<ul class="nav_ul">                                                                                                      
	    			<li class="active">	
						<a href="<%=path %>/"><span>网站首页</span></a>
	    			</li>
	    			<c:forEach var="item" items="<%=SystemManage.getInstance().getNavigations()%>">
		    			<li>
		    				<a href="<%=path %>/${item.url}?id=${item.id}"><span>${item.name}</span></a>
		    				<div class="erji">
		    				   <c:forEach var="child" items="${item.children}">
		    					    <a href="<%=path %>/${child.url}?id=${child.id}">${child.name}</a>
							   </c:forEach>
		    				</div>
		    			</li>
				    </c:forEach>
	    				
	    		</ul>
	    	</div>
	    	
	    </div>
		</div>	
</header>