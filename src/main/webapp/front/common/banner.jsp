<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--banner-->
<section class="banner">
    <c:forEach var="item" items="<%=SystemManage.getInstance().getIndexImgs()%>">
            <div><a href="<%=path %>/index"><img src="<%=SystemManage.getInstance().getSystemSetting().getImageRootPath()%>/${item.pictureUrl}" alt=""></a></div>
    </c:forEach>
</section>