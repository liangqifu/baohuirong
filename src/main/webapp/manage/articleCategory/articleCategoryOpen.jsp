<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/manage/system/pageBase.jsp" %>
<%@ page info="字典分类管理"%>

<form action="" name="form1" style="display: none;">
    <input type="hidden" value="" name="id" id="dfsfsf">
</form>

<table class="table table-bordered" >
	<tr class="warning">
		<td colspan="2">
			<div>
				[<a id="expandOrCollapseAllBtn" href="#" title="展开/折叠全部资源" onclick="return false;">展开/折叠</a>]
			</div>
		</td>
	</tr>
	<tr>
		<td style="width:12%">
			<div >
				<ul id="treeDemo2" style="display: none;" class="ztree"></ul>
			</div>
		</td>
		<td>
			<iframe src=""  id="iframeEdit" style="width: 100%;height: 344px;">
				
			</iframe>
		</td>
	</tr>
</table>
<script>
$(function(){
var setting = {
		check: {
			enable: true,
			dblClickExpand: false
		},callback: {
			onClick: function(e,treeId, treeNode) {
                var zTree = $.fn.zTree.getZTreeObj("treeDemo2");
               // zTree.expandNode(treeNode);
            },
			onMouseDown: function (event, treeId, treeNode) {
                var url = "<%=path%>/manage/articleCategory/selectList?parentid="+treeNode.id;
                if(url){
                    $("#iframeEdit").attr("src",url);
                    return;
                }
                $("#dfsfsf").val(treeNode.id);
                document.form1.action = url;
                document.form1.submit();
            }
		},
        data:{
        	simpleData: {
				enable: true
			}
        }
		
};

loadMenusTree();

//加载菜单树
function loadMenusTree(){
	$.ajax({
		url:"<%=path%>/manage/articleCategory/getListAll",
					type:"GET",
					dataType:"text",
					success:function(data, textStatus){	
						var zNodes = eval('('+data+')');
						$.fn.zTree.init($("#treeDemo2"), setting, zNodes);
						//$("#loadImg").hide();
						$("#treeDemo2").show();
					},
					error:function(){
						alert("error");
					}
				});
			}
			
			
			
			var expandAllFlg = true;
			function expandNode(e) {
				var zTree = $.fn.zTree.getZTreeObj("treeDemo2"),
				type = e.data.type,
				nodes = zTree.getSelectedNodes();

				if (type == "expandAll") {
					zTree.expandAll(true);
				} else if (type == "collapseAll") {
					zTree.expandAll(false);
				} else if (type == "expandOrCollapse") {
					zTree.expandAll(expandAllFlg);
					expandAllFlg = !expandAllFlg;
				} else {
					if (type.indexOf("All")<0 && nodes.length == 0) {
						alert("请先选择一个父节点");
					}
					var callbackFlag = $("#callbackTrigger").attr("checked");
					for (var i=0, l=nodes.length; i<l; i++) {
						zTree.setting.view.fontCss = {};
						if (type == "expand") {
							zTree.expandNode(nodes[i], true, null, null, callbackFlag);
						} else if (type == "collapse") {
							zTree.expandNode(nodes[i], false, null, null, callbackFlag);
						} else if (type == "toggle") {
							zTree.expandNode(nodes[i], null, null, null, callbackFlag);
						} else if (type == "expandSon") {
							zTree.expandNode(nodes[i], true, true, null, callbackFlag);
						} else if (type == "collapseSon") {
							zTree.expandNode(nodes[i], false, true, null, callbackFlag);
						}
					}
				}
			}
			$("#expandOrCollapseAllBtn").bind("click", {type:"expandOrCollapse"}, expandNode);
		});
</script>
<%@ include file="/manage/system/baseFoot.jsp" %>