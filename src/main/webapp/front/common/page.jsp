<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<section class="pageing">
               <c:if test="${pager.pagerSize > 0}">
                 <a href="javascript:onSelectPage(${pager.offset - 1})">«</a>
                 <c:if test="${pager.pagerSize <= 10}">
                    <c:forEach var="i" begin="1" end="${pager.pagerSize}">
                        <c:choose>
                            <c:when test="${i == pager.offset}">
                                <a class="active" href="javascript:onSelectPage(${i})">${i}</a>
                            </c:when>
                            <c:otherwise>
                                <a href="javascript:onSelectPage(${i})">${i}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </c:if>
                <c:if test="${pager.pagerSize > 10}">
                    <c:if test="${pager.offset < 10}">
                        <c:forEach var="i" begin="1" end="10">
                            <c:choose>
                                <c:when test="${i == pager.offset}">
                                    <a class="active" href="javascript:onSelectPage(${i})">${i}</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="javascript:onSelectPage(${i})">${i}</a>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </c:if>
                    <c:if test="${pager.offset >= 10}">
                        <c:forEach var="j" begin="${pager.offset-5}" end="${pager.offset+4}">
                            <c:if test="${j <= pager.pagerSize}">
                                <c:choose>
                                    <c:when test="${j == pager.offset}">
                                        <a class="active" href="javascript:onSelectPage(${j})">${j}</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="javascript:onSelectPage(${j})">${j}</a>
                                    </c:otherwise>
                                </c:choose>
                            </c:if>
                        </c:forEach>
                    </c:if>
                </c:if>
                 <a href="javascript:onSelectPage(${pager.offset + 1})">»</a>
               </c:if>
</section>

<c:if test="${!empty pager}"> 
    <script type="text/javascript">
        function onSelectPage(offset){
            if(offset>=1 && offset<=${pager.pagerSize}){
                if (offset != ${pager.offset}) { //当前页点击禁用跳转
                         window.location.href="<%=path %>/${pager.pagerUrl}&offset="+offset;
                }
            }
        }
    </script>
</c:if>




            

