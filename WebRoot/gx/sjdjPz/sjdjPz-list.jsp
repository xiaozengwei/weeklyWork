<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<base href="<%=basePath %>">
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch"
          action="<%=basePath%>njsfy-sjdjpz/sjdjpz-list.do" method="post"
          data-loadingmask="true">
        <input type="hidden" name="pageSize" value="${page.pageSize}">
        <input type="hidden" name="pageCurrent" value="${page.pageCurrent}">
        <input type="hidden" name="orderField" value="${param.orderField}">
        <input type="hidden" name="orderDirection" value="${param.orderDirection}">

        <div class="bjui-searchBar">

        </div>

    </form>
</div>
<div class="bjui-pageContent" id="content">
    <table id="tb" class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <thead>
        <tr>
            <th width="3%" align="center"><input type="checkbox" class="checkboxCtrl" data-group="ids"
                                                 data-toggle="icheck"></th>
            <th width="60%" align="center">地址</th>
            <th width="15%" align="center">数据库账号</th>
            <th width="15%" align="center">数据库密码</th>
            <th width="30%" align="center">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.result}" var="bean" varStatus="status">
            <tr data-id="${bean.rowId}">
                <td align="center"><input type="checkbox" name="ids" data-toggle="icheck" value="${bean.rowId}"></td>
                <td align="center">${bean.url}</td>
                <td align="center">${bean.userName}</td>
                <td align="center">${bean.userPwd}</td>
                <td align="center">
                        <button class="btn-blue" data-url="<%=basePath%>njsfy-sjdjpz/sjdjpz-edit.do?bean=${bean.rowId}" data-toggle="dialog" data-id="column-article-update" data-mask="true" data-width="400" data-height="300"  data-title="编辑">编辑</button>
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