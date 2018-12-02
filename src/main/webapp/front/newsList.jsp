<%@page import="com.enterprise.entity.Navigation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" %>

<%@include file="/front/common/htmlBase.jsp" %>
<%@include file="/front/common/header.jsp" %>
<%@include file="/front/common/banner.jsp" %>

	<div class="com_zi clearfix">
		
		<%@include file="/front/common/left_zi.jsp" %>
		
		<div class="right_zi">
		    <c:if test="${ navigation.code == '003'}">
		        <div class="application_area">
					   <table style="border-bottom:solid #e4e3e3 1px; border-left:solid #e4e3e3 1px; border-right:solid #e4e3e3 1px; border-top:solid #f7720f 2px; padding: 5px 0 5px 0;" width="100%" height="35px"  cellspacing="0" cellpadding="0" border="0">
		   		          <tbody>
		   		            <tr>
				   			<td width="80" height="37" align="right">
				   				应用领域：   				
				   			</td>
				   			<td>
				   			    <% Navigation useds = SystemManage.getInstance().getNavigation("34"); %>
				   			    <c:forEach var="item" varStatus="status" items="<%=useds.getChildren() %>">
				   			         <input name="usedArr" value="${item.id }" id="usedArr-${status.index }" style="width:20px;" onclick="check();" type="checkbox">
								     <label for="usedArr-${status.index }" class="checkboxLabel">${item.name}</label>
				   			    </c:forEach>
				   			</td>
					   		</tr>
		                 </tbody>
		              </table>
		          </div>
		    
		    </c:if>
			<%@include file="/front/common/bar.jsp" %>
			<c:choose>
			    <c:when test="${ navigation.code == '001'}">
			        <ul class="news_zi_ul clearfix">
						<c:forEach var="item" varStatus="status" items="${pager.list}">
						      <li>
									<a href="<%=path%>/detail?parentCategoryId=${parentCategoryId}&categoryId=${categoryId}&id=${item.id}" class="clearfix">
										<span class="left">
											<h4>${item.title }</h4>
											<p>${item.description }</p>
										</span>
										<span class="right">
										     <fmt:parseDate value="${item.createtime }" pattern="yyyy-MM-dd" var="myDate"/>
											<time><fmt:formatDate value="${myDate}" pattern="MM-dd" /></time>
											<span><fmt:formatDate value="${myDate}" pattern="yyyy" /></span>
											<i></i>
										</span>
									</a>
								</li>
						</c:forEach>
					</ul>
			    </c:when>
			    <c:when test="${ navigation.code == '002' or navigation.code == '005'}">
			         <ul class="down_ul">
			            <c:forEach var="item" varStatus="status" items="${pager.list}">
			                <li>
								<a href="<%=path%>/detail?parentCategoryId=${parentCategoryId}&categoryId=${categoryId}&id=${item.id}"><span>${item.title } </span></a>
							</li>
			            </c:forEach>
					</ul>
			    </c:when>
			    <c:when test="${ navigation.code == '003'}">
			         <ul class="down_ul">
			             <c:forEach var="item" varStatus="status" items="${pager.list}">
			                <li>
			                    <fmt:parseDate value="${item.createtime }" pattern="yyyy-MM-dd" var="myDate"/>
			                    <a href="<%=path%>/detail?parentCategoryId=${parentCategoryId}&categoryId=${categoryId}&id=${item.id}"><span>${item.title }</span><span class="news_time">[ <fmt:formatDate value="${myDate}" pattern="yyyy-MM-dd" /> ]</span></a>
							</li>
			             </c:forEach>
					</ul>
			    </c:when>
			    <c:when test="${ navigation.code == '004'}">
			    
			    </c:when>
			</c:choose>
			
			<%@include file="/front/common/page.jsp" %>
		</div>
	</div>


<%@include file="/front/common/foot.jsp" %>