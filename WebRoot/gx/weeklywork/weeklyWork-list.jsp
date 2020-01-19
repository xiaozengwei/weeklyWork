<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="<%=basePath%>weeklyWork/list.do" method="post">
        <input type="hidden" name="pageSize" value="${page.pageSize}"><!-- 页大小 -->
        <input type="hidden" name="pageCurrent" value="${page.pageCurrent}"><!-- 当前页 -->
        <input type="hidden" name="orderField" value="${param.orderField}"><!-- 排序字段 -->
        <input type="hidden" name="orderDirection" value="${param.orderDirection}"><!-- 排序方向 -->
        <label>时间：</label>    <input type="text" name="filter_GED_startTime"
                                  value="${param.filter_GED_startTime}" data-toggle="datepicker"
                                     data-pattern="yyyy-MM-dd HH:mm:ss"size="18" autocomplete="off"> -
                                <input type="text" name="filter_LED_endTime"
                                       value="${param.filter_LED_endTime}" data-toggle="datepicker"
                                       data-pattern="yyyy-MM-dd HH:mm:ss" size="18" autocomplete="off">
        <label>会议室：</label><input type="text" value="${param.filter_LIKES_meetingRoomName}" name="filter_LIKES_meetingRoomName" class="form-control">&nbsp;
        <button type="submit" class="btn-default" data-icon="search">查询</button>
        &nbsp;
        <a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">清空查询</a>
        &nbsp;
        <button type="button" class="btn-green" data-url="<%=basePath%>weeklyWork/weeklyWork-input.do?rowId=${rowId}" data-toggle="dialog" data-target="weeklywork-input" data-id="weeklywork-dialog" data-icon="plus" data-width="900" data-height="700">添加</button>
        &nbsp;
        <button type="button" class="btn-red" data-url="<%=basePath%>weeklyWork/remove.do" data-toggle="doajaxchecked" data-confirm-msg="确定要删除选中项吗？" data-icon="remove" data-idname="delids" data-group="ids">删除选中行</button>
    </form>
</div>
<div class="bjui-pageContent">
    <table  class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <tr>
            <th width="2%" align="center"><input type="checkbox" class="checkboxCtrl" data-group="ids" data-toggle="icheck"></th>
            <th width="5%" align="center">序号</th>
            <th width="10%" align="center">开始时间</th>
            <th width="10%" align="center">结束时间</th>
            <th width="5%" align="center" >会议室</th>
            <th width="5%" align="center" >召集内容</th>
            <th width="7%" align="center" >操作</th>
        </tr>
        <c:forEach items="${page.result}" var="view" varStatus="status">
            <tr data-id="${view.rowId}">
                <td align="center"><input type="checkbox" name="ids" data-toggle="icheck" value="${view.rowId}"></td>
                <td align="center">${status.count }</td>
                <td align="center"><fmt:formatDate value="${view.startTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                <td align="center"><fmt:formatDate value="${view.endTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                <td align="center">${view.meetingRoomName}</td>
                <td align="center">${view.title}</td>
                <td align="center">
                    <a class="btn btn-blue" href="<%=basePath%>weeklyWork/weeklyWork-input.do?rowId=${view.rowId}" data-toggle="dialog" data-id="view-update" data-width="900" data-height="700" data-title="编辑">编辑</a>
                    <a class="btn btn-blue" href="<%=basePath%>weeklyWork/look.do?rowId=${view.rowId}" data-toggle="dialog" data-id="view-update" data-width="900" data-height="1000" data-title="编辑">查看</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<div class="bjui-pageFooter">
    <div class="pages">
        <span>每页&nbsp;</span>
        <div class="selectPagesize">
            <select data-toggle="selectpicker" data-toggle-change="changepagesize">
                <option value="10">10</option>
                <option value="15">15</option>
                <option value="20">20</option>
                <option value="25">25</option>
            </select>
        </div>
        <span>&nbsp;条，共 ${page.totalCount }条</span>
    </div>
    <div class="pagination-box" data-toggle="pagination"
         data-total="${page.totalCount }" data-page-size="${page.pageSize }"
         data-page-current="${page.pageCurrent }"></div>
</div>