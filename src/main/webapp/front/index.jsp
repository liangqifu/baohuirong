<%@page import="com.enterprise.entity.Navigation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" %>

<%@include file="/front/common/htmlBase.jsp" %>
<%@include file="/front/common/header.jsp" %>
<%@include file="/front/common/banner.jsp" %>
<script type="text/javascript">
    $(function(){
    	$("ul.technology_menu_li li a").on("click",function(){
    		 $('ul.technology_menu_li li').removeClass('active');
    		 $(this).parent().addClass('active');
    		 $("div[id*='technologyList_']").hide();
    		 var id = $(this).parent().attr("id");
    		 $("#technologyList_"+id).show();
    	});
    	
    	$("li.army_box_span span").on("click",function(){
    		$('li.army_box_span span').removeClass('army_tab');
    		$(this).addClass('army_tab');
    		var id = $(this).attr("id");
    		$("li.army_menu_title_li").hide();
    		$("li.army_menu_title_li_"+id).show();
    		$($("li.army_menu_title_li_"+id+" a")[0]).click();
    	});
    	
    	$("li.army_menu_title_li a").on("click",function(){
    		$('li.army_menu_title_li').removeClass('active');
    		$(this).parent().addClass('active');
    		$("div[id*='army_pr_list_']").hide();
    		var id = $(this).parent().attr("id");
    		$("#army_pr_list_"+id).show();
    	});
    	
    	$("ul.industry_menu_li li a").on("click",function(){
	   		 $('ul.industry_menu_li li').removeClass('active');
	   		 $(this).parent().addClass('active');
	   		 $("div[id*='industryList_']").hide();
	   		 var id = $(this).parent().attr("id");
	   		 $("#industryList_"+id).show();
   	    });
    	$("ul.service_menu_li li a").on("click",function(){
	   		 $('ul.service_menu_li li').removeClass('active');
	   		 $(this).parent().addClass('active');
	   		 $("div[id*='serviceList_']").hide();
	   		 var id = $(this).parent().attr("id");
	   		 $("#serviceList_"+id).show();
  	    });
    	
    	
    })
</script>
<div class="con clearfix">		
		<div class="news">
			<div class="news_boxs">
			   <c:forEach var="item" varStatus="status" items="${news.children}">
			         <div class="news_con"  <c:if test="${status.index == 1}"> style="margin-left:50px;" </c:if>  >
			          <div class="news_title">${item.name }</div>
				        <ul>
				             <c:forEach var="article"  items="${item.articles}">
				                   <li><a href="<%=path %>/#?id=${article.id}">${article.title }<span class="news_time">[ ${article.createtime } ]</span></a></li>
				             </c:forEach>
				        </ul>
				    </div>
			   </c:forEach>
		   </div>
	   </div>
		
		<div class="technology">
		  <div class="technology_box">
			<div class="technology_menu">
			  <span class="technology_menu_title"></span>
			      <i class="atv_title"></i> 
				  <ul class="technology_menu_li">
				      <c:forEach var="item" varStatus="status" items="${technology.children }" >
				           <li <c:if test="${status.index == 0}"> class="active" </c:if> id="${item.id}"><a>${item.name }</a></li>
				      </c:forEach>
				  </ul>	
			</div>
			<c:forEach var="item" varStatus="status" items="${technology.children }" >
			       <div id="technologyList_${item.id}" <c:choose><c:when test="${status.index == 0}">style="display: block;"</c:when><c:otherwise>style="display: none;"</c:otherwise></c:choose> >
						<c:forEach var="article"  items="${item.articles}">
						       <div class="technology_pr">
							     <a href="<%=path %>/#?id=${article.id}">
								      <div class="technology_pr_box">
								            <c:choose>
								                <c:when test="${not empty article.image }">
								                  <img src="<%=SystemManage.getInstance().getSystemSetting().getImageRootPath()%>/${article.image} ">
								                </c:when>
								                <c:otherwise>
								                   <img src="<%=path %>/resource/images/pr_pic.png">
								                </c:otherwise>
								            </c:choose>				
										   <p>${article.title}</p>
										   <p>${article.description}</p>
										   <c:if test="${not empty article.remark }">
										       <p class="technology_pr_m">¥ ${article.remark}</p>	
										   </c:if>
										   			
									 </div>
								  </a>
								</div>
						</c:forEach>
				 </div>
			</c:forEach>
			
		</div>
	  </div>
		
	  	<div class="army">
		  <div class="army_box">
			<div class="army_menu">
			  <span class="army_menu_title"></span>
			  <i class="atv_title"></i> 
			  <ul>
			     
				<li class="army_box_span">
				   <c:forEach var="item" varStatus="status" items="${army.children }" >
				        <c:if test="${status.index ==1 }">|</c:if>
				        <span style="cursor: pointer;" id="${item.id}" <c:if test="${status.index ==0 }"> class="army_tab"</c:if>>${item.name }</span>
				   </c:forEach>
				</li>
				<c:forEach var="item" varStatus="status" items="${army.children }" >
				        <c:forEach var="i" varStatus="itemStatus" items="${item.children }" >
				             <li id="${item.id}_${i.id}" class='army_menu_title_li army_menu_title_li_${item.id} <c:if test="${itemStatus.index == 0 }">active</c:if>'  <c:if test="${status.index == 0 }">style="display: block;"</c:if> <c:if test="${status.index == 1 }">style="display: none;"</c:if>><a>${i.name }</a></li>
				         </c:forEach>
				</c:forEach>
			  </ul>	
			</div>
			  <c:forEach var="item" varStatus="status" items="${army.children }" >
			       <c:forEach var="i" varStatus="itemStatus" items="${item.children }" >
			           <div id="army_pr_list_${item.id}_${i.id}" <c:choose><c:when test="${status.index == 0 and itemStatus.index == 0}">style="display: block;"</c:when><c:otherwise>style="display: none;"</c:otherwise></c:choose> >
			                 <c:forEach var="article" varStatus="hStatus" items="${i.articles }" >
			                       <div class="army_pr">
									    <a href="<%=path %>/#?id=${article.id}">
										   <div class="army_pr_box">
										       <c:choose>
								                <c:when test="${not empty article.image }">
								                  <img src="<%=SystemManage.getInstance().getSystemSetting().getImageRootPath()%>/${article.image} ">
								                </c:when>
								                <c:otherwise>
								                   <img src="<%=path %>/resource/images/xq_pic.jpg">
								                </c:otherwise>
								                </c:choose>
											   <p>${article.title}</p>
											   <p>${article.description}</p>
											   <c:if test="${not empty article.remark }">
											       <p class="technology_pr_m">¥ ${article.remark}</p>	
											   </c:if>
											</div>
										</a>
									</div>
			                 </c:forEach>
			           </div>
			       </c:forEach>
			  </c:forEach>
		</div>
	  </div>	
		
		
		<div class="industry">
		  <div class="industry_box">
			<div class="industry_menu">
			  <span class="industry_menu_title"></span>
			  <i class="atv_title"></i> 
			  <ul class="industry_menu_li">	
			      	<c:forEach var="item" varStatus="status" items="${industry.children }" >
				           <li <c:if test="${status.index == 0}"> class="active" </c:if> id="${item.id}"><a>${item.name }</a></li>
				    </c:forEach>		
			  </ul>	
			</div>
			<c:forEach var="item" varStatus="status" items="${industry.children }" >
			     <div id="industryList_${item.id}" <c:choose><c:when test="${status.index == 0}">style="display: block;"</c:when><c:otherwise>style="display: none;"</c:otherwise></c:choose> >
			           <div class="industry_pr">
					     <ul>
					         <c:forEach var="article"  items="${item.articles}">
			                      <li><a href="<%=path %>/#?id=${article.id}">${article.title }</a></li>
			                 </c:forEach>
					     </ul>
					   </div>
					   <div class="industry_pr">
					     <ul>
					         <c:forEach var="article"  items="${item.articles2}">
			                      <li><a href="<%=path %>/#?id=${article.id}">${article.title }</a></li>
			                 </c:forEach>
					     </ul>
					   </div>
			     </div>
			</c:forEach>			 
			  
		</div>
	  </div>	
		
		<div class="service">
		  <div class="service_box">
			<div class="service_menu">
			  <span class="service_menu_title"></span>
			  <i class="atv_title"></i> 
			  <ul class="service_menu_li">		
			      <c:forEach var="item" varStatus="status" items="${service.children }" >
				           <li <c:if test="${status.index == 0}"> class="active" </c:if> id="${item.id}"><a>${item.name }</a></li>
				  </c:forEach>		
			  </ul>	
			</div>
			<c:forEach var="item" varStatus="status" items="${service.children }" >
			     <div id="serviceList_${item.id}" <c:choose><c:when test="${status.index == 0}">style="display: block;"</c:when><c:otherwise>style="display: none;"</c:otherwise></c:choose> >
			           <div class="service_list">
					     <ul>
					         <c:forEach var="article"  items="${item.articles}">
			                      <li><a href="<%=path %>/#?id=${article.id}">${article.title }</a></li>
			                 </c:forEach>
					     </ul>
					   </div>
					   <div class="service_list">
					     <ul>
					         <c:forEach var="article"  items="${item.articles2}">
			                      <li><a href="<%=path %>/#?id=${article.id}">${article.title }</a></li>
			                 </c:forEach>
					     </ul>
					   </div>
			     </div>
			</c:forEach>			 
			   
		</div>
	  </div>	
		
	</div>

<%@include file="/front/common/foot.jsp" %>