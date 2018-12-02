<%@page import="com.enterprise.entity.Navigation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" %>

<%@include file="/front/common/htmlBase.jsp" %>
<%@include file="/front/common/header.jsp" %>
<%@include file="/front/common/banner.jsp" %>

<div class="com_zi clearfix">
   <%@include file="/front/common/left_zi.jsp" %>
<div class="right_zi">
   <%@include file="/front/common/bar.jsp" %> 
   
   <div class="news_show_zi">
       <h4>${e.title }</h4>
       <p style="float: right;">
              <fmt:parseDate value="${e.createtime }" pattern="yyyy-MM-dd HH:mm" var="myDate"/>
             <fmt:formatDate value="${myDate}" pattern="yyyy-MM-dd HH:mm" />  | 浏览量：${e.hit}
       </p>
       <br>
       <div style="margin-top: 31px;">
          ${e.content }
       </div>
       <ul class="prev_next clearfix">
			<li><b>上一篇：</b>
			<c:choose>
				<c:when test="${previous.id != 0}">
					<a href="<%=path%>/detail?parentCategoryId=${parentCategoryId}&categoryId=${categoryId}&id=${previous.id}">
					   ${previous.title}
					</a>
				</c:when>
				<c:otherwise>暂无信息！</c:otherwise>
			</c:choose>
			</li>
			<li><b>下一篇：</b>
			<c:choose>
			    <c:when test="${next.id != 0}">
			        <a href="<%=path%>/detail?parentCategoryId=${parentCategoryId}&categoryId=${categoryId}&id=${next.id}">
			          ${next.title}
			        </a>
			    </c:when>
			    <c:otherwise>暂无信息！</c:otherwise>
			</c:choose>
			</li>
		</ul>
		<div class="xi_guan">
			<div class="guan_c">
				<span>相关新闻</span>
			</div>
		</div>
		<ul class="guan_ul">
		     
		     <c:forEach var="item" varStatus="status" items="<%=SystemManage.getInstance().getService() %>" >
		        <li>
				    <a href="javascript:window.open('${item.url }') ">${item.title }</a>
				     <fmt:parseDate value="${item.createtime }" pattern="yyyy-MM-dd" var="myDate"/>
				    <span><fmt:formatDate value="${myDate}" pattern="yyyy-MM-dd" /></span>
			    </li>
		     </c:forEach>
			
		</ul>
       
   </div>

</div>

</div>


<%@include file="/front/common/foot.jsp" %>