<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath %>">
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch"  action="<%=basePath%>meetingRoom/list.do" method="post">
        <input type="hidden" name="pageSize" value="${page.pageSize}">
        <input type="hidden" name="pageCurrent" value="${page.pageCurrent}">

        <div class="bjui-searchBar">
            <label>会议室：</label><input type="text" value="${param.filter_LIKES_mtName}" name="filter_LIKES_mtName" class="form-control" size="10">&nbsp;
            <button type="submit" class="btn-default" data-icon="search">查询</button>&nbsp;
            <a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">清空查询</a>
            <div class="pull-right">
                <button type="button" class="btn-green" data-url="<%=basePath%>meetingRoom/input.do"  data-toggle="dialog" data-target="sysuser-input" data-id="sysuser-input-dialog"  data-icon="plus" data-width="600" data-height="400">添加会议室</button>&nbsp;
                <button type="button" class="btn-blue" data-url="<%=basePath %>meetingRoom/remove.do" data-toggle="doajaxchecked" data-confirm-msg="确定要删除选中项吗？" data-icon="remove" data-idname="delids" data-group="ids" >删除选中</button>
            </div>
        </div>
    </form>
</div>
<div class="bjui-pageContent">
    <table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <thead>
        <tr>
            <th width="3%" align="center"><input type="checkbox" class="checkboxCtrl" data-group="ids" data-toggle="icheck"></th>
            <th  width="5%"  align="center">序号</th>
            <th  width="20%"  align="center">会议室</th>
            <th width="20%"  align="center">状态</th>
            <th width="35%" align="center">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.result}" var="room" varStatus="status">
            <tr data-id="${room.rowId}">
                <td align="center"><input type="checkbox" name="ids" data-toggle="icheck" value="${room.rowId}"></td>
                <td align="center">${status.count }</td>
                <td align="center">${room.mtName}</td>
                <td align="center">${room.status}</td>
                <td align="center">
                    <button data-url="<%=basePath%>meetingRoom/input.do?rowId=${room.rowId}" class="btn-green"
                            data-toggle="dialog" data-id="sysuser-update" data-width="600" data-height="400"
                            data-title="编辑" data-icon="edit">编辑</button>&nbsp;&nbsp;
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<div class="bjui-pageFooter">
    <div class="pages">
        <span>每页&nbsp;</span>
        <div class="selectPagesize">
            <select data-toggle="selectpicker"
                    data-toggle-change="changepagesize">
                <option value="10">10</option>
                <option value="15">15</option>
                <option value="20">20</option>
                <option value="25">25</option>
            </select>
        </div>
        <span>&nbsp;条，共 ${page.totalCount }条</span>
    </div>
    <div class="pagination-box" data-toggle="pagination" data-total="${page.totalCount }"
         data-page-size="${page.pageSize }" data-page-current="${page.pageCurrent }"></div>
</div>