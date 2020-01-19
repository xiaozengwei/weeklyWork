<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%--<script src="<%=request.getContextPath()%>/gx/js/jquery-1.11.2.js"></script>--%>
<%--<script src="<%=request.getContextPath()%>/gx/js/loading.js"></script>--%>

<%--<script>--%>

<%--$(function () {--%>
<%--$('#loading').click(function(){--%>
<%--var load = new Loading();--%>
<%--load.init();--%>
<%--load.start();--%>
<%--setTimeout(function() {--%>
<%--load.stop();--%>
<%--}, 30000)--%>
<%--});--%>

<%--})--%>
<%--</script>--%>
<base href="<%=basePath %>">
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch"
          action="<%=basePath%>njsfy-medicineTree/medicineTree-list.do?columnId=${columnId}" method="post"
          data-loadingmask="true">
        <input type="hidden" name="pageSize" value="${page.pageSize}">
        <input type="hidden" name="pageCurrent" value="${page.pageCurrent}">
        <input type="hidden" name="orderField" value="${param.orderField}">
        <input type="hidden" name="orderDirection" value="${param.orderDirection}">

        <div class="bjui-searchBar">
            <label>药物名称：</label><input type="text" value="${param.filter_LIKES_medicineName}"
                                       name="filter_LIKES_medicineName" class="form-control" size="10">&nbsp;
            <button type="submit" class="btn-default" data-icon="search">查询</button>
            &nbsp;
            <a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true"
               data-icon="undo">清空查询</a>
            <div class="pull-right">
                <button type="button" class="btn-green"
                        data-url="<%=basePath%>njsfy-medicineInstance/medicineInstance-input.do?bol=a" data-toggle="dialog"
                        data-target="medicineInstance-input" data-id="medicineInstance-input-dialog" data-icon="plus"
                        data-width="1000" data-height="500">添加药品
                </button>
                &nbsp;
                <button type="button" class="btn-blue" data-url="<%=basePath%>njsfy-medicineInstance/remove.do?bol_b=b"
                        data-toggle="doajaxchecked" data-confirm-msg="确定要删除选中项吗？" data-icon="remove"
                        data-idname="delids" data-group="ids">删除选中
                </button>
              <%--  <button type="button" class="btn-blue" data-url="<%=basePath%>njsfy-medicineTree/fileDownload.do"
                        data-toggle="doexport" data-confirm-msg="确定要下载吗？" data-icon="download">模板下载
                </button>
                &nbsp;
                <button type="button" class="btn-red" data-url="<%=basePath%>njsfy-medicineTree/medicineTree-import.do"
                        data-toggle="dialog" data-target="medicineTree-import" data-id="medicineTree-import-dialog"
                        data-icon="plus"
                        data-width="1000" data-height="300">批量导入
                </button>--%>


                <%--data-toggle="doajax" data-loadingmask="true"--%>
                <%--<button  type="button" class="btn-green" id="loading" >生成题库</button>&nbsp;--%>

                <%--<button type="button" class="btn-green" data-url="<%=basePath%>szgmkjx-kshjd/kshjd-input.do?columnId=${columnId}"  data-toggle="dialog" data-target="vis-input" data-id="vis-input-dialog"  data-icon="plus" data-width="400" data-height="500">添加问题</button>&nbsp;--%>
                <%--data-callback="callback"--%>
                <%--<button  type="button" class="btn-blue" data-url="<%=basePath%>szgmkjx-kshjd/remove.do" data-toggle="doajaxchecked" data-confirm-msg="确定要删除选中项吗？" data-icon="remove" data-idname="delides" data-group="ids" >删除选中</button>--%>
            </div>
        </div>

    </form>
</div>
<div class="bjui-pageContent" id="content">
    <table id="tb" class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <thead>
        <tr>
            <th width="3%" align="center"><input type="checkbox" class="checkboxCtrl" data-group="ids"
                                                 data-toggle="icheck"></th>
            <th width="15%" align="center">药物名称</th>

            <th width="15%" align="center">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.result}" var="bean" varStatus="status">
            <tr data-id="${bean.rowId}">
                <td align="center"><input type="checkbox" name="ids" data-toggle="icheck" value="${bean.rowId}"></td>
                <td align="center">${bean.medicineName}</td>
                    <%--<td align="center">--%>
                    <%--<c:set var="salary"  value="${bean.isShow}"/>--%>
                    <%--<c:if test="${salary==null || salary=='是'}">--%>
                    <%--是--%>
                    <%--</c:if>--%>
                    <%--<c:if test="${!(salary==null || salary=='是')}">--%>
                    <%--否--%>
                    <%--</c:if>--%>
                    <%--</td>--%>
                <td align="center">
                    <button class="btn-blue" data-url="<%=basePath%>njsfy-medicineInstance/edit.do?rowId=${bean.rowId}&bol=c" data-toggle="dialog" data-id="column-article-update" data-mask="true" data-width="1000" data-height="500"  data-title="编辑">编辑</button>
                    &nbsp;&nbsp;
                    <button class="btn-blue" data-url="<%=basePath%>njsfy-medicineInstance/look.do?rowId=${bean.rowId}" data-toggle="dialog" data-id="column-article-look" data-mask="true" data-width="1000" data-height="500"  data-title="查看详情">查看</button>

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