
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/manage/system/pageBase.jsp" %>
<%@ page info="文章列表" %>

<form action="<%=path%>/manage/article" method="post">
    <div style="height:auto!important;height:550px;min-height:550px;">
        <h3 style="border-bottom: 1px solid #D7D7D7;color: #666666;font-size: 28px;padding-bottom: 20px;margin-bottom: 30px;">
            <%=getServletInfo()%>
            <a href="toAdd" class="btn btn-primary"
               style="padding: 2px 15px;float:right;">
                <i class="icon-plus "></i>添加文章
            </a>
        </h3>
        <div class="filter">
            <button method="deletes" class="btn btn-danger" style="padding:0px 5px;margin-top: -4px;"
                    onclick="return submitIDs(this,'确定删除选择的信息?');">
                <i class="icon-trash"></i>删除
            </button>
            <div style="float: right">
                <input type="hidden" id="categoryId" name="categoryId" ></input>
                <input id="categoryName" readonly="readonly" name="categoryName" type="text" placeholder="选择分类"  />
                
                <input type="text" value="${e.title}" class="input-medium search-query" name="title" placeholder="标题"/>
                <button method="selectList" class="btn btn-info" style="padding:0px 5px;margin-top: -4px;"
                        onclick="selectList(this)">
                    <i class="icon-search"></i>查询
                </button>
            </div>
        </div>
        <table class="table table-bordered table-hover table-striped">
            <tr>
                <th width="30"><input type="checkbox" id="firstCheckbox"/></th>
                <th width="290">文章名称</th>
                <th width="100">文章分类</th>
                <th width="150">创建时间</th>
                <th width="60">状态</th>
                <th width="100">操作</th>
            </tr>
            <c:forEach var="item" items="${pager.list}">
                <tr>
                    <td><input type="checkbox" name="ids"
                               value="${item.id}"/></td>
                    <td>${item.title}</td>
                    <td>${item.catename}</td>
                    <td>${item.createtime}</td>
                    <td>
                    <c:choose>
                       <c:when test="${item.status =='y'}">显示</c:when>
                        <c:otherwise>不显示</c:otherwise>
                    </c:choose>
                    </td>
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
</form>
<div id="menuContent" class="menuContent" style="displayx: none; position: absolute;z-index: 1000;width: 16%;background-color: #edf0f3;">
      <ul id="treeDemo" class="ztree" style="margin-top: 0; width:100%;">
      </ul>
</div>
<script type="text/javascript">
    $(function () {
    	createTree("#treeDemo");
    	hideMenu();
        $("#firstCheckbox").on("click", function () {
            if ($(this).prop("checked")) {
                $("input[type=checkbox]").prop("checked", true);
            } else {
                $("input[type=checkbox]").prop("checked", false);
            }
        });
        $("body").bind("mousedown", 
             function(event){
                 if (!(event.target.id == "menuContent" || $(event.target).parents("#menuContent").length>0)) {
                     hideMenu();
                 }
             }
        ); 
        $("#categoryName").bind("click",
                function(){
        	            showMenu();
                }
       );
    });
    function submitIDs(obj, tip) {
        if ($("input:checked").size() == 0) {
            alert("请先选择要操作的内容！");
            return false;
        }

        if (confirm(tip)) {
            var _form = $("form");
            _form.attr("action", $(obj).attr("method"));
            _form.submit();
        }
        return false;
    }
    //查询
    function selectList(obj) {

        var _form = $("form");
        _form.attr("action", $(obj).attr("method"));
        _form.submit();
    }
    
  //显示树
    function showMenu() {
                var cityObj = $("#categoryName");
                var cityOffset = $("#categoryName").offset();
                $("#menuContent").css({ left: cityOffset.left-195 + "px", top: cityOffset.top + cityObj.outerHeight()-95	 + "px" }).slideDown("fast");
    }
           
     //隐藏树
    function hideMenu() {
                $("#menuContent").fadeOut("fast");
    }
    
    function createTree(treeId) {
        var zTree; //用于保存创建的树节点
        var setting = { //设置
            check: {
                enable: false
            },
            view: {
                showLine: true, //显示辅助线
                dblClickExpand: true,
            },
            data:{
            	simpleData: {
    				enable: true
    			}
            },callback: {
                onClick: function(e, treeId, treeNode){
                	if (treeNode) {
                		$("#categoryName").val(treeNode.name);
                		$("#categoryId").val(treeNode.id);
                		hideMenu();
                	}
                    
                }
            }
        };
        $.ajax({ //请求数据,创建树
            type: 'GET',
            url: '<%=path%>/manage/articleCategory/getListAll',
            dataType: "json", //返回的结果为json  
            success: function(data) {
            	
                zTree = $.fn.zTree.init($(treeId), setting, data.slice(1,data.length)); //创建树
            },
            error: function(data) {
                alert("创建树失败!");
            }
        });
    }
    
   
</script>

<%@ include file="/manage/system/baseFoot.jsp" %>
