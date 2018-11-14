<%--
  Created by IntelliJ IDEA.
  User: Cesiumai
  Date: 2016/6/14
  Time: 14:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%
     String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<script type="text/javascript" src="<%=path %>/resource/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="<%=path %>/resource/js/jquery.tab.js"></script>
    <!-- bootstrap -->
    <link rel="stylesheet" href="<%=path %>/resource/bootstrap-3.3.5/css/bootstrap.min.css" type="text/css">
    <script type="text/javascript" src="<%=path %>/resource/bootstrap-3.3.5/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=path %>/resource/bootstrap-3.3.5/js/bootstrap-modal.js"></script>
    <!-- validator -->
    <link rel="stylesheet" href="<%=path%>/resource/validator/jquery.validator.css">
    <script type="text/javascript" src="<%=path%>/resource/validator/jquery.validator.min.js"></script>
    <script type="text/javascript" src="<%=path%>/resource/validator/local/zh-CN.js"></script>
    <!-- jcrop -->
    <link rel="stylesheet" href="<%=path %>/resource/jcrop/css/jquery.Jcrop.css" type="text/css">
    <script type="text/javascript" src="<%=path %>/resource/jcrop/js/jquery.Jcrop.js"></script>

    <!-- ace -->
    <link rel="stylesheet" href="<%=path %>/resource/ace/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="<%=path %>/resource/ace/css/ace.min.css" type="text/css">
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="<%=path %>/resource/css/ace-ie.min.css"/>
    <![endif]-->
    <script src="<%=path %>/resource/ace/js/ace.min.js"></script>
    <script src="<%=path %>/resource/ace/js/ace-extra.min.js"></script>

    <link rel="stylesheet" href="<%=path%>/resource/css/manageBase.css">

    <!-- metisMenu -->
    <script src="<%=path %>/resource/metisMenu/metisMenu.min.js"></script>


    <!-- zTree树插件 -->
    <link rel="stylesheet" href="<%=path %>/resource/zTree3.5/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <script type="text/javascript" src="<%=path %>/resource/zTree3.5/js/jquery.ztree.all-3.5.min.js"></script>


    <!-- kindeditor富文本编辑器 -->
    <link rel="stylesheet" href="<%=path %>/resource/kindeditor/themes/default/default.css"/>
    <script charset="utf-8" src="<%=path %>/resource/kindeditor/kindeditor-all-min.js"></script>
    <script charset="utf-8" src="<%=path %>/resource/kindeditor/lang/zh-CN.js"></script>

   <div style="height:auto!important;height:550px;min-height:550px;">
    <h3 style="border-bottom: 1px solid #D7D7D7;color: #666666;font-size: 28px;padding-bottom: 20px;margin-bottom: 30px;">
        <a href="toAdd" class="btn btn-primary"
           style="padding: 2px 15px;float:right;">
            <i class="icon-plus "></i>添加分类
        </a>
    </h3>

    <table class="table table-bordered table-hover table-striped">
        <tr >
            <th width="300">分类名称</th>
            <th>分类描述</th>
            <th width="100">排序</th>
            <th width="200">操作</th>
        </tr>
        <c:forEach var="item" items="${pager.list}">
            <tr>
                <td>${item.catename}</td>
                <td>${item.description}</td>
                <td>${item.orders}</td>
                <td><a href="toEdit?id=${item.id}">编辑</a> | <a href="delete?id=${item.id}">删除</a></td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="71" style="text-align: center;">
                <%@ include file="/manage/system/page.jsp" %>
            </td>
        </tr>
    </table>
</div>
