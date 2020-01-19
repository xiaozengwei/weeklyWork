<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<div class="bjui-pageHeader">
	<form id="pagerForm" data-toggle="ajaxsearch"
		action="<%=basePath%>dic/dic-record-list.do?rowId=${rowId}" method="post">
		<input type="hidden" name="pageSize" value="${page.pageSize}">
		<input type="hidden" name="pageCurrent" value="${page.pageCurrent}">
		<input type="hidden" name="orderField" value="${param.orderField}">
		<input type="hidden" name="orderDirection"
			value="${param.orderDirection}">

		<div class="bjui-searchBar">
			<label>字典名称：</label><input type="text"
				value="${param.filter_LIKES_dicName}"
				name="filter_LIKES_dicName" class="form-control" size="10">&nbsp;
			<label>字典内容：</label><input type="text"
				value="${param.filter_LIKES_dicShowVal}"
				name="filter_LIKES_dicShowVal" class="form-control" size="10">&nbsp;
			<label>创建日期：</label><input type="text" name="filter_GED_createDate"
				value="${param.filter_GED_createDate }" data-toggle="datepicker"
				data-rule="date" size="19">&nbsp;-&nbsp;<input type="text"
				name="filter_LED_createDate" id="j_custom_issuedate"
				data-toggle="datepicker" data-rule="date" size="19"
				value="${param.filter_LED_createDate }">

			<button type="submit" class="btn-default" data-icon="search">查询</button>
			&nbsp; <a class="btn btn-orange" href="javascript:;"
				data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">清空查询</a>
			<div class="pull-right">
				<button type="button" class="btn-green"
					data-url="<%=basePath%>dic/dic-record-input.do?indexId=${rowId}" data-toggle="dialog"
					data-target="role-input" data-id="role-input-dialog" data-mask="true"
					data-icon="plus" data-width="800" data-height="400">添加数据字典</button>
				&nbsp;
				<button type="button" class="btn-blue"
					data-url="<%=basePath%>dic/dic-record-remove.do"
					data-toggle="doajaxchecked" data-confirm-msg="确定要删除选中项吗？"
					data-icon="remove" data-idname="delids" data-group="ids">删除选中行</button>

			</div>
		</div>

	</form>
</div>
<div class="bjui-pageContent">
	<table class="table table-bordered table-hover table-striped table-top"
		data-selected-multi="true">
		<thead>
			<tr>
				<th width="3%" align="center"><input type="checkbox"
					class="checkboxCtrl" data-group="ids" data-toggle="icheck">
				</th>
				<th width="5%" align="center">序号</th>
				<th width="15%" align="center">字典名称</th>
				<th width="7%" align="center" >字典类型</th>
				<th width="39%" align="center">字典显示内容</th>
				<th width="7%" align="center" >字典值</th>
				<th width="12%" align="center">创建日期</th>
				<th width="12%" align="center">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.result}" var="dic" varStatus="status">
				<tr data-id="${dic.rowId}">
					<td align="center"><input type="checkbox" name="ids"
						data-toggle="icheck" value="${dic.rowId}">
					</td>
					<td align="center">${status.index +1 }</td>
					<td align="center">${dic.dicName}</td>
					<td align="center">${dic.dicType }</td>
					<td align="center">${dic.dicShowVal}</td>
					<td align="center">${dic.dicValue}</td>
					<td align="center"><fmt:formatDate value="${dic.createDate }" pattern="yyyy-MM-dd HH:mm" /></td>
					<td align="center"><a
						href="<%=basePath%>dic/dic-record-input.do?rowId=${dic.rowId}"
						data-toggle="dialog" data-id="dicindex-update" data-width="800"
						data-height="400" data-title="编辑" data-mask="true">编辑</a>||
						<a
						href="<%=basePath%>dic/dic-record-input.do?rowId=${dic.rowId}"
						data-toggle="dialog" data-id="dicindex-detail" data-width="800"
						data-height="400" data-title="查看详情" data-mask="true">查看详情</a>

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
	<div class="pagination-box" data-toggle="pagination"
		data-total="${page.totalCount }" data-page-size="${page.pageSize }"
		data-page-current="${page.pageCurrent }"></div>
</div>