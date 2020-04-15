<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%
    String path = request.getContextPath();
    String basePath = request.getContextPath()+"/";
%>
<style>
    .user-selected{background-color:#3399ff;}
</style>
<script type="text/javascript">
    function do_open_layout(event, treeId, treeNode) {
        if (treeNode.isParent) {
            var zTree = $.fn.zTree.getZTreeObj(treeId);

            zTree.expandNode(treeNode);

            event.preventDefault();
            $(event.target).bjuiajax('doLoad', {url:treeNode.url, target:treeNode.divid,loadingmask:false});
            return;
        }
        $(event.target).bjuiajax('doLoad', {url:treeNode.url, target:treeNode.divid,loadingmask:false});
        event.preventDefault();

    }

</script>
<div class="bjui-pageContent" style="" id="user-select-page" onselectstart="return false">
    <div style="width:100%;height: 75%;">
        <div style="float:left; width:400px;height:100%;display: none;">
            <fieldset style="height:100%;">
                <legend>组织机构</legend>
                <div id="orgtree" style="height:94%;overflow: auto; ">
                    <ul id="layout-tree-org" class="ztree" data-toggle="ztree" data-expand-all="false" data-on-click="do_open_layout">
                        <c:forEach items="${orgList}" var="orgList" varStatus="status">
                            <li data-id="${orgList.rowId}" data-pid="${orgList.parentOrgId}" data-url="<%=basePath %>sysorg/get-users-part.do?orgId=${orgList.rowId}" data-divid="#layout-users" data-fresh="true" >${orgList.orgName}</li>
                        </c:forEach>
                    </ul>
                </div>
            </fieldset>
        </div>
        <div style="float:left;margin-left:10px; height:100%; width:200px;">
            <div style="height:100%; ">
                <fieldset style="height:100%;">
                    <legend>待选人员</legend>
                    <div id="layout-users" style="height:94%; overflow: auto;">
                        <table data-width="100%" class="table table-bordered">
                            <tbody>
                            <c:forEach items="${userList}" var="user" varStatus="status">
                                <tr id="${user.userId}">
                                    <td align="center" class="user-bring" data-user='{"id":"${user.userId}", "name":"${user.userName}","orgId":"${user.rowId}"}'>${user.userName}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </fieldset>
            </div>
        </div>
        <div style="float:left;margin-left:5px; height:100%; width:100px;  margin-right: 5px;text-align: center;">
            <div style="margin-top: 105px;">
                <button type="button" class="btn-blue" style="width: 80px;text-align: center;" id="btn-user-add">添加</button>
                <%--<button type="button" class="btn-blue" style="margin-top: 5px;width: 80px;text-align: center;" id="btn-user-select-all">全部添加</button>--%>
            </div>

            <div style="margin-top: 50px;">
                <button type="button" class="btn-blue" style="width: 80px;text-align: center;" id="btn-user-remove">删除</button>
                <%--<button type="button" class="btn-blue" style="margin-top: 5px;width: 80px;text-align: center;" id="btn-user-remove-all">全部删除</button>--%>
            </div>
        </div>
        <div style="float:left;margin-left:10px; height:100%; width:200px;">
            <div style="height:100%;">
                <fieldset style="height:100%;">
                    <legend>已选人员</legend>
                    <div id="layout-users-selected" style="height:94%; overflow: auto;">
                        <table data-width="100%" class="table table-bordered">

                        </table>
                    </div>
                </fieldset>
            </div>
        </div>
    </div>
    <div style="clear:both"></div>

    <div style="width:100%;margin-top:30px;border-top:1px solid #c7bbd8;margin-left:-10px;"></div>
    <div style="text-align:center; width:100%; line-height:50px;">
        <button class="btn-blue" id="btn-user-select" type="button" style="margin-right:8px" data-url="" data-opt="${opt }" data-icon="check">确定</button>

        <button class="btn-close" data-icon="close">关闭</button>

    </div>
    <%--<div id="div-search" style="width:100%;height:30px;text-align: center;margin-top: 5px;">--%>
    <%--<form id="pagerForm" data-toggle="ajaxsearch" action="<%=path%>/publish/user-search.do?opt=bringback&group=addtask"  data-target="#layout-users" loadingmask="false" data-fresh="true">--%>
    <%--<div class="bjui-searchBar">--%>
    <%--<input type="text" value="${name }" id="assignName" name="name" size="19" />&nbsp;--%>
    <%--<button type="submit" class="btn-default" data-icon="search">查询</button>&nbsp;--%>
    <%--</div>--%>
    <%--</form>--%>
    <%--</div>--%>
</div>

<script>
    $(function(){
        var user_selected_layout =$.CurrentDialog.find("#layout-users-selected");
        var layout_users =$.CurrentDialog.find("#layout-users");
        function addUser(user_id,user_name,user_org_id){

            var table_shows_container = user_selected_layout.find("table");

            if(table_shows_container.find("td#"+user_id).length < 1){
                var td_html= "<tr><td align='center' id='"+user_id+"' name='"+user_name+"' orgId='"+user_org_id+"'>"+user_name+"</td></tr>";
                table_shows_container.append(td_html);
            }
        }
        $("#user-select-page",$.CurrentDialog).on("dblclick", "td.user-bring",function(){
            var user =$(this).data("user");
            var user_id = user.id;
            var user_name = user.name;
            var user_org_id = user.orgId;
            $(this).parent("tr").hide();
            addUser(user_id,user_name,user_org_id);
        });
        $("#user-select-page",$.CurrentDialog).on("click", "td.user-bring",function(){//单选样式切换
            $(this).toggleClass("user-selected");
        });
        user_selected_layout.on("click", "td",function(){//单选样式切换
            $(this).toggleClass("user-selected");
        });
        $("#layout-users-selected",$.CurrentDialog).on("dblclick","td",function(){
            layout_users.find("#"+$(this).attr("id")).show();
            $(this).parent("tr").remove();
        });
        //功能按钮1：添加
        $("#btn-user-add",$.CurrentDialog).on("click",function(){
            layout_users.find(".user-selected").each(function(){
                var user =$(this).data("user");
                var user_id = user.id;
                var user_name = user.name;
                var user_org_id = user.orgId;
                $(this).parent("tr").hide();
                addUser(user_id,user_name,user_org_id);
            });
        });
        //功能按钮2：全部添加
        $("#btn-user-select-all",$.CurrentDialog).on("click",function(){
            $("td.user-bring",$.CurrentDialog).each(function(){
                var user =$(this).data("user");
                var user_id = user.id;
                var user_name = user.name;
                var user_org_id = user.orgId;
                addUser(user_id,user_name,user_org_id);
            });
        });
        //功能按钮3：删除
        $("#btn-user-remove",$.CurrentDialog).on("click",function(){
            user_selected_layout.find(".user-selected").each(function(){
                layout_users.find("#"+$(this).attr("id")).show();
                $(this).parent("tr").remove();
            });
        });
        //功能按钮4：全部删除
        $("#btn-user-remove-all",$.CurrentDialog).on("click",function(){
            $("table",user_selected_layout).empty();
        });

        //确定按钮
        $("#btn-user-select",$.CurrentDialog).on("click",function(){
            var btn_current = $(this);
            var select_opt = btn_current.data("opt");//bringback(普通的选择带回)
            var users_selected_td = user_selected_layout.find("td");
            var v_user_ids ="";
            var v_user_names ="";
            var v_org_ids = "";
            if(users_selected_td.length < 1){
                btn_current.alertmsg('info', '请选择人员');
                return false;
            }
            users_selected_td.each(function(){
                v_user_ids+= $(this).attr("id") +",";
                v_user_names+= $(this).attr("name") +",";
                v_org_ids+= $(this).attr("orgId")+",";
            });
            var has_current = false;
            var current_userId ='${userId}';

            if(v_user_ids.length >0 && v_user_ids.indexOf(",") != -1){
                v_user_ids = v_user_ids.substring(0,v_user_ids.length -1);
            }
            if(v_user_names.length >0 && v_user_names.indexOf(",") != -1){
                v_user_names = v_user_names.substring(0,v_user_names.length -1);
            }
            if(v_org_ids.length >0 && v_org_ids.indexOf(",") != -1){
                v_org_ids = v_org_ids.substring(0,v_org_ids.length -1);
            }
            if(select_opt =='bringback'){//bringback(普通的选择带回)

                $.CurrentNavtab.find(':input').each(function() {
                    var $input = $(this), inputName = "${id}",callUsersId = "meetingArrangement[${group}].auditorId";
                    var name = $input.attr("name");
                    if (name=="meetingArrangement[${group}].auditorName") {

                        $input.val(v_user_names);
                    }
                    if (name=="meetingArrangement[${group}].callLeaderId") {
                        $input.val(v_user_ids);
                    }

                });
                $(this).dialog('closeCurrent');
            }

        });
        $(document).on(BJUI.eventType.afterInitUI, function(e) {
            var $box = $(e.target);
            if($("#layout-users",$.CurrentDialog).children().length < 1){//仅当选择列表里没有数据的时候触发
                var treeObj = $.fn.zTree.getZTreeObj("layout-tree-org");
                var nodes = treeObj.getNodesByParam('pid','root',null);
                if(nodes.length > 0){
                    var rootNode = nodes[0];
                    var childNodes = rootNode.children;

                    if(childNodes.length > 0){
                        var firstChild = childNodes[0];
                        treeObj.selectNode(firstChild);
                        $.ajax({
                            url:'<%=basePath%>publish/get-users-part-json.do',
                            type:'post',
                            data:{
                                orgId:firstChild.id
                            },
                            dataType:'json',
                            success:function(json){
                                if(json.userList.length >0 ){//该组织机构下人数大于1的时候才触发点击事件
                                    $(firstChild).trigger('click');
                                    $(".curSelectedNode",$.CurrentDialog).trigger('click');
                                }
                            }
                        });


                    }
                }
            }
        });
    });


</script>