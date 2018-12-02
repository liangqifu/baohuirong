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
                    <li id="${item.id }" ><a>${item.title}</a></li>
               </c:forEach>
               <li id="21212"><a >联系我们</a></li>
			</ul>
			
		</div>
		<div class="right_zi">
		     <c:forEach var="item"  varStatus="status" items="<%=SystemManage.getInstance().getAbout()%>">
		           <div id="aboutContent_${item.id }" style="display: none;" >
                       <div class="bar clearfix">
							<span class="b_tt">${item.title}</span>
							<span class="curbar"><i>您当前的位置：</i><a href="<%=path%>/index">首页</a> ><a href="<%=path%>/about">关于我们</a> > <i>${item.title}</i></span>
					   </div>
					   <div class="about_zi">
					       ${item.contentHtml}
					   </div>  
		           </div>
			</c:forEach>
			
			
		</div>
	</div>


<%@include file="/front/common/foot.jsp" %>