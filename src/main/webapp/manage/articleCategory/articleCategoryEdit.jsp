
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
     String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<script type="text/javascript" src="<%=path%>/resource/js/MooTools-Core-1.6.0.js"></script>
<script type="text/javascript" src="<%=path%>/resource/js/pinyin.js"></script>
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

<form action="<%=path %>/manage/articleCategory/save" name="form" id="form" method="post">
    <div style="height:auto!important;height:550px;min-height:550px;">
        <h3 style="border-bottom: 1px solid #D7D7D7;color: #666666;font-size: 28px;padding-bottom: 20px;margin-bottom: 30px;">
           
            <a href="<%=path %>/manage/articleCategory/selectList?parentid=${e.parentid}" class="btn btn-primary"
               style="padding: 2px 15px;float:right;"><i class="icon-double-angle-left"></i>返回列表</a>
        </h3>
        <table width="100%" border="0" cellspacing="0" cellpadding="10" class="tableBasic">
             <input type="hidden" name="parentid" value="${e.parentid}"></input>
             <input type="hidden" name="id" value="${e.id}"></input>
            
            <tr>
                <th style="text-align: right; width: 20%;white-space: nowrap;">分类名称</th>
                <td style="text-align: left;">
                <input type="text" size="40" value="${e.catename}" name="catename"
                                                     data-rule="分类名称:required;catename;length[1~45];remote[unique?id=${e.id}, parentid:parentid]" 
                                                     id="catename"/>
                </td>
            </tr>
            <tr>
                <th style="text-align: right; width: 20% ;white-space: nowrap;" >编码</th>
                <td style="text-align: left;"><input type="text" size="40" value="${e.code}" name="code" id="code" data-rule="编码:required;code;length[1~45];remote[unique?id=${e.id}, parentid:parentid]"/></td>
            </tr>
            <tr>
                <th style="text-align: right; width: 20% ;white-space: nowrap;" >url</th>
                <td style="text-align: left;"><input type="text" size="40" value="${e.url}" name="url" id="url" /></td>
            </tr>
            <tr>
                <th style="text-align: right;  width: 20% ">排序</th>
                <td style="text-align: left;"><input type="text" size="40" value="${e.orders}" name="orders"
                                                     data-rule="排序:required;integer[+];"
                                                     id="orders"/></td>
            </tr>
            <tr>
                <th style="text-align: right;  width: 20% 	;white-space: nowrap;">分类描述</th>
                <td style="text-align: left;">
                    <textarea id="description" name="description" class="textArea" cols="120"
                              rows="4">${e.description}</textarea>
                </td>
            </tr>

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
    function toCode(){
        var pinyin = new Pinyin();
        var code = pinyin.getFullChars($("#catename").val());
        $("#code").val(code);
    }
    function commit() {

        var _form = $("form");
        _form.submit();
    }
</script>
