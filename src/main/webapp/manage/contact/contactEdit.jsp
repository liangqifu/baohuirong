
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/manage/system/pageBase.jsp" %>
<%@ page info="联系我们" %>
<form action="<%=path %>/manage/contact/save" name="form" id="form" method="post">
    <div style="height:auto!important;height:550px;min-height:550px;">
        <h3 style="border-bottom: 1px solid #D7D7D7;color: #666666;font-size: 28px;padding-bottom: 20px;margin-bottom: 30px;">
            <%=getServletInfo()%>
        </h3>
        <table width="100%" border="0" cellspacing="0" cellpadding="10" class="tableBasic">

            <tr style="display: none;">
                <td>id</td>
                <td><input type="hidden" value="${e.id}" name="id" label="id"/></td>
            </tr>
            <tr>
                <th style="text-align: right;" width="200">电话</th>
                <td style="text-align: left;">
                  <input name="mobile" id="mobile" value="${e.mobile}" data-rule="电话:required;tel;" ></input>
                </td>
            </tr>
            <tr>
                <th style="text-align: right;" width="200">手机</th>
                <td style="text-align: left;">
                  <input name="phone" id="phone" value="${e.phone}" data-rule="手机:required;mobile;" ></input>
                </td>
            </tr>
            <tr>
                <th style="text-align: right;" width="200">邮箱</th>
                <td style="text-align: left;">
                  <input name="email" id="email" value="${e.email}" data-rule="邮箱:required;email;" ></input>
                </td>
            </tr>
            <tr>
                <th style="text-align: right;" width="200">地址</th>
                <td style="text-align: left;">
                  <input name="address" id="address" value="${e.address}" data-rule="地址:required;" ></input>
                </td>
            </tr>
            <tr>
                <th style="text-align: right;" width="200">网址</th>
                <td style="text-align: left;">
                  <input name="website" id="website" value="${e.website}" data-rule="网址:required;" ></input>
                </td>
            </tr>
            <%-- <tr>
                <th style="text-align: right;" width="200">内容</th>
                <td style="text-align: left;">
     <textarea name="contentHtml" id="contentHtml" data-rule="内容:required;"
               style="width:850px;height:400px;visibility:hidden;">${e.contentHtml}</textarea>
                </td>
            </tr> --%>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <button  onclick="commit()" class="btn btn-info"
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

