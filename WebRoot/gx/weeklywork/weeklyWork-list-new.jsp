<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<script type="text/javascript">
    $('#test-datagrid-json').datagrid({
        gridTitle : '一周工作安排列表',
        showToolbar: true,
        toolbarItem: 'add, edit, cancel, save, del',
//        toolbarItem:'all',
        addLocation:'first',
        local: 'local',
        data: '${List}',
        <%--dataUrl: '<%=basePath%>weeklyWork/data.do',--%>
        dataType: 'json',
        filterThead: false,
        columns: [
            {
                name: 'startTime',
                label: '开始',
                align: 'center',
                type: 'date',
                pattern:'yyyy-MM-dd HH:mm:ss',
                width: 150,
                rule:'required'
            },
            {
                name: 'endTime',
                label: '结束',
                align: 'center',
                type: 'date',
                pattern:'yyyy-MM-dd HH:mm:ss',
                width: 150,
                rule:'required'
            },
            {
                name: 'title',
                label: '标题',
                align: 'center',
                rule:'required',
                width: 80
            },
            {
                name: 'meetingRoomId',
                label: '地点Id',
                align: 'center',
                width: 80,
                hide:true
            },
            {
                name: 'meetingRoomName',
                label: '地点',
                type: 'lookup',
                attrs: {'data-url':'<%=basePath%>notice/select-meetingroom.do'},
                align: 'center',
                width: 80,
                rule:'required',
                render: function(value) {
                    return value
                }
            },
            {
                name: 'callLeaderName',
                label: '召集领导',
                type: 'lookup',
                attrs: {'data-url':'<%=basePath %>sysuser/userlookup.do?userId=callLeaderId&userName=callLeaderName'},
                align: 'center',
                width: 80,
                rule:'required',
                render: function(value) {
                    return value
                }
            },
            {
                name: 'callLeaderId',
                label: '召集领导id',
                align: 'center',
                width: 80,
                hide:true
            },
            {
                name: 'callUsersId',
                label: '出席人员',
                align: 'center',
                width: 80,
                hide:true
            },
            {
                name: 'callUsersName',
                label: '出席人员',
                type: 'lookup',
                attrs: {'data-url':'<%=basePath %>roleuserorg/role-lookup.do?name=callUsersName&id=callUsersId'},
                align: 'center',
                rule:'required',
                width: 80
            },
            {
                name: 'useOrgName',
                label: '承办部门',
                align: 'center',
                type: 'lookup',
                rule:'required',
                attrs: {'data-url':'<%=basePath %>sysorg/lookup-org-list.do?orgName=useOrgName&orgId=useOrgId'},
                width: 80
            },
            {
                name: 'useOrgId',
                label: '承办部门',
                align: 'center',
                width: 80,
                hide:true
            }
        ],
        editUrl: '<%=basePath%>weeklyWork/form-save.do',
        delUrl : '<%=basePath%>weeklyWork/remove.do',
        contextMenuB: true,
        paging: {total:30, pageSize:10},
//        paging:false,
        editMode: 'inline',
        fullGrid: true,
        showLinenumber: false,
        afterSave(){
            $(this).navtab('refresh');
        },
        afterDelete(){
            $(this).navtab('refresh');
        }
        //showCheckboxcol: true
    })
</script>
<div class="bjui-pageContent">
    <div style="padding:15px; height:100%; width:100%;">
        <table id="test-datagrid-json" data-width="100%" data-height="600" class="table table-bordered" data-reloadNavtab="true">
        </table>
        <%--<br>--%>
        <%--<table id="test-datagrid-array" data-width="100%" data-height="280" class="table table-bordered">--%>
        <%--</table>--%>
        <%--<br>--%>
        <%--<table id="test-datagrid-xml" data-width="100%" class="table table-bordered">--%>
        <%--</table>--%>
    </div>
</div>