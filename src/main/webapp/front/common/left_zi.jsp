<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="left_zi">
	<div class="top_com">
		<span>${navigation.name}</span>
	</div>
	<c:choose>
	    <c:when test="${ navigation.code == '004'}">
	        <div class="sub-search">
				<input class="input" name="title" value="" type="text">
				<a class="btn" href="javascript:void(0);" onclick="javascript:doSubmit();"><i class="iconfont icon-search_3"></i> </a>
			</div>
			<div class="integration_botton_box">
			     <ul>
				    <li>
					  <a href="personal_center.html">
					   <img src="images/wdxq.jpg">
						<p>我的需求</p>
					   </a>  
					 </li>
					  <li>
						<a href="personal_center.html">
					     <img src="images/fbxq.jpg">
					      <p>发布需求</p>
					     </a>
					 </li>
				</ul>
			</div>
	    </c:when>
	    <c:otherwise>
	        <ul class="nav_left">
			    <c:forEach var="item" varStatus="status" items="${navigation.children}">
			          <li  <c:if test="${ item.id ==categoryId }"> class="active"</c:if> >
					      <a href="<%=path %>/newsList?parentCategoryId=${navigation.id}&categoryId=${item.id}">${item.name}</a>
				      </li>
			    </c:forEach>
			</ul>
	    </c:otherwise>
	</c:choose>
	
</div>