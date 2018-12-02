<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@page import="com.enterprise.core.SystemManage" %>
<%@page import="com.enterprise.entity.SystemSetting" %>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<% 
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta name="description" content="<%=SystemManage.getInstance().getSystemSetting().getDescription() %>"/>
    <meta name="keywords" content="<%=SystemManage.getInstance().getSystemSetting().getKeywords() %>"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><%=SystemManage.getInstance().getSystemSetting().getTitle()%></title>
    <link rel="shortcut icon" type="image/x-icon" href="<%=SystemManage.getInstance().getSystemSetting().getImageRootPath() %><%=SystemManage.getInstance().getSystemSetting().getFavicon() %>">
	
	<!-- include main css -->
	<link rel="stylesheet" type="text/css" href="<%=path %>/resource/css2/slick.css"/>	
	<link rel="stylesheet" type="text/css" href="<%=path %>/resource/css2/bootstrap.css"/>
	<link rel="stylesheet" type="text/css" href="<%=path %>/resource/css2/jquery.mmenu.all.css"/>
	<link rel="stylesheet" type="text/css" href="<%=path %>/resource/css2/style.css"/>
	<link rel="stylesheet" type="text/css" href="<%=path %>/resource/css2/reset.css"/>
	<link rel="stylesheet" type="text/css" href="<%=path %>/resource/css2/animates.css" />
	<!--Include Js-->
	<!--[if lt IE 9]>
    <script src="<%=path %>/resource/js/html5.min.js"></script>
    <script src="<%=path %>/resource/js/respond.min.js"></script>
    <![endif]-->
	<script type="text/javascript" charset="utf-8" src="<%=path %>/resource/js/jquery.min.js" ></script>
	<!--移动端导航-->
	<script type="text/javascript" charset="utf-8" src="<%=path %>/resource/js/jquery.mmenu.all.min.js" ></script>
	<script type="text/javascript" charset="utf-8" src="<%=path %>/resource/js/public.js" ></script>
	<!--slick-->
	<script type="text/javascript" charset="utf-8" src="<%=path %>/resource/js/slick.min.js" ></script>
	<!--placeholder-->
	<script type="text/javascript" charset="utf-8" src="<%=path %>/resource/js/jquery.placeholder.min.js" ></script>
	<script type="text/javascript">
		    $(function(){
			    $('.banner').slick({
			        dots: true,
			        autoplay:true,
			        arrows:false,
			        autoplaySpeed:3000,
			    });
			    
			    $('input, textarea').placeholder();
			});
	</script>
	
</head>
<%
    SystemSetting s = SystemManage.getInstance().getSystemSetting();
    if (s != null && StringUtils.isNotBlank(s.getIsopen())
            && !Boolean.valueOf(s.getIsopen())) {
%>
    <%@include file="/front/common/close.jsp" %>
<%
        return;
    }
%>
<body>
