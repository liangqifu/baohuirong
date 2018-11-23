
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/manage/system/pageBase.jsp" %>
<%@ page info="关于我们" %>

<form action="<%=path%>/manage/about/" method="post">
    <div style="height:auto!important;height:550px;min-height:550px;">
        <h3 style="border-bottom: 1px solid #D7D7D7;color: #666666;font-size: 28px;padding-bottom: 20px;margin-bottom: 30px;">
            <%=getServletInfo()%>
            
        </h3>
        <div class="filter">
            
            
        </div>
        <table class="table table-bordered table-hover table-striped">
            <tr>
                <th style="width: 9%;">标题</th>
                <th>内容</th>
                <th style="width: 4%;">排序</th>
                <th style="width: 9%;">操作</th>
            </tr>
            <c:forEach var="item" items="${list}">
                <tr>
                    <td>${item.title}</td>
                    <td>${item.contentHtml}</td>
                    <td>${item.orders}</td>
                    <td><a href="toEdit?id=${item.id}">编辑</a> </td>
                </tr>
            </c:forEach>	
            
        </table>
    </div>
</form>


<%@ include file="/manage/system/baseFoot.jsp" %>
