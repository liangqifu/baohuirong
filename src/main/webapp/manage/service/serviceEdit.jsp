
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/manage/system/pageBase.jsp" %>
<%@ page info="相关新闻" %>
<%
    Map<String,String> statuss = new LinkedHashMap<String,String>();
    statuss.put("y","显示");
    statuss.put("n","不显示");
%>
<form action="<%=path %>/manage/service/save" name="form" id="form" method="post">
    <div style="height:auto!important;height:550px;min-height:550px;">
        <h3 style="border-bottom: 1px solid #D7D7D7;color: #666666;font-size: 28px;padding-bottom: 20px;margin-bottom: 30px;">
            <%=getServletInfo()%>
            <a href="<%=path %>/manage/service/selectList" class="btn btn-primary"
               style="padding: 2px 15px;float:right;"><i class="icon-double-angle-left"></i>返回列表</a>
        </h3>
        <table width="100%" border="0" cellspacing="0" cellpadding="10" class="tableBasic">

            <tr style="display: none;">
                <td>id</td>
                <td><input type="hidden" value="${e.id}" name="id" label="id"/></td>
            </tr>
            <tr>
                <th style="text-align: right;" width="200">标题</th>
                <td style="text-align: left;"><input type="text" size="40" value="${e.title}" name="title"
                                                     data-rule="标题:required;title;length[1~45];"
                                                     id="title"/></td>
            </tr>
            
            <tr>
                <th style="text-align: right;" width="200">链接</th>
                <td style="text-align: left;"><input type="text" size="40" value="${e.url}" name="url"
                                                     data-rule="链接:required;url;length[1~500];"
                                                     id="url"/></td>
            </tr>

            <tr>
                <th style="text-align: right;">状态</th>
                <td style="text-align: left;">
                    <select name="status">
                        <c:forEach var="entry" items="<%=statuss %>">
                            <option value="${entry.key}" <c:if test="${e.status eq entry.key}">selected="selected" </c:if>>${entry.value}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <th style="text-align: right;">排序</th>
                <td style="text-align: left;">
                    <input type="text"  value="${e.orders}" name="orders"
                           data-rule="排序:required;orders;integer[+];"
                           id="orders"/>
                </td>
            </tr>

            <%-- <tr>
                <th style="text-align: right;">内容</th>
                <td style="text-align: left;">
                    <textarea name="contentHtml" id="contentHtml" data-rule="文章内容:required;"
                              style="width:850px;height:400px;visibility:hidden;">${e.contentHtml}</textarea>
                </td>
            </tr> --%>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <button method="update" onclick="commit()" class="btn btn-info"
                                    style="padding:2px 15px;">
                                                        保存
                            </button>
                </td>
            </tr>
        </table>
    </div>
</form>

<script type="text/javascript">

    var content;
    KindEditor.ready(function (K) {
        content = K.create('textarea[name="contentHtml"]', {
            filterMode: false,
            allowFileManager: true,
            uploadJson: '<%=path%>/resource/kindeditor/jsp/upload_json.jsp',
            fileManagerJson: '<%=path%>/resource/kindeditor/jsp/file_manager_json.jsp'

        });
        var editor = K.editor({
            allowFileManager : true,
            uploadJson: '<%=path%>/resource/kindeditor/jsp/upload_json.jsp',
            fileManagerJson : '<%=path%>/resource/kindeditor/jsp/file_manager_json.jsp'
        });

        K('input[name=getHtml]').click(function (e) {
            alert(editor.html());
        });
        K('input[name=isEmpty]').click(function (e) {
            alert(editor.isEmpty());
        });
        K('input[name=getText]').click(function (e) {
            alert(editor.text());
        });
        K('input[name=selectedHtml]').click(function (e) {
            alert(editor.selectedHtml());
        });
        K('input[name=setHtml]').click(function (e) {
            editor.html('<h3>Hello KindEditor</h3>');
        });
        K('input[name=setText]').click(function (e) {
            editor.text('<h3>Hello KindEditor</h3>');
        });
        K('input[name=insertHtml]').click(function (e) {
            editor.insertHtml('<strong>插入HTML</strong>');
        });
        K('input[name=appendHtml]').click(function (e) {
            editor.appendHtml('<strong>添加HTML</strong>');
        });

        K('input[name=clear]').click(function (e) {
            editor.html('');
        });

    });
    function commit() {
       // content.sync();
        var _form = $("form");
        _form.submit();
    }
</script>


<%@ include file="/manage/system/baseFoot.jsp" %>
