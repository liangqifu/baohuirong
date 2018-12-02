<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="bar clearfix">
    <span class="b_tt">${curNavigation.name }</span>
    <span class="curbar">
	     <i>您当前的位置：</i>
	     <a href="<%=path %>/index">首页</a> > 
	     <a href="<%=path %>/newsList?parentCategoryId=${navigation.id}&categoryId=${firstCategoryId}">${navigation.name}</a> >
	     <i>${curNavigation.name }</i>
	 </span>
</div>