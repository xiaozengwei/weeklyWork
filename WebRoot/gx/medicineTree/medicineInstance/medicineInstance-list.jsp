<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%--<script src="<%=request.getContextPath()%>/gx/js/jquery-1.11.2.js"></script>
<script src="<%=request.getContextPath()%>/gx/js/jQuery2.14.js"></script>

<script>
    (function ($) {
        $.fn.moreText = function (options) {
            var defaults = {
                maxLength: 50,
                mainCell: ".branddesc",
                openBtn: '显示全部',
                closeBtn: '收起'
            }
            return this.each(function () {
                var _this = $(this);

                var opts = $.extend({}, defaults, options);
                var maxLength = opts.maxLength;
                var TextBox = $(opts.mainCell, _this);
                var openBtn = opts.openBtn;
                var closeBtn = opts.closeBtn;

                var countText = TextBox.html();
                var newHtml = '';
                if (countText.length > maxLength) {
                    newHtml = countText.substring(0, maxLength) + '...<span class="more">' + openBtn + '</span>';
                } else {
                    newHtml = countText;
                }
                TextBox.html(newHtml);
                TextBox.on("click", ".more", function () {
                    if ($(this).text() == openBtn) {
                        TextBox.html(countText + ' <span class="more">' + closeBtn + '</span>');
                    } else {
                        TextBox.html(newHtml);
                    }
                })
            })
        }
    })(jQuery);
    $(function () {
        $(".branddesc").moreText({
            maxLength: 5, //默认最大显示字数，超过...
            mainCell: '.branddesc' //文字容器
        });
    })
</script>--%>
<base href="<%=basePath %>">
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch"
          action="<%=basePath%>njsfy-medicineInstance/medicineInstance-list.do" method="post"
          data-loadingmask="true">
        <input type="hidden" name="pageSize" value="${page.pageSize}">
        <input type="hidden" name="pageCurrent" value="${page.pageCurrent}">
        <input type="hidden" name="orderField" value="${param.orderField}">
        <input type="hidden" name="orderDirection" value="${param.orderDirection}">

        <div class="bjui-searchBar">
            <label>药品名称：</label><input type="text" value="${param.filter_LIKES_medicineName}"
                                       name="filter_LIKES_medicineName" class="form-control" size="10">&nbsp;
            <button type="submit" class="btn-default" data-icon="search">查询</button>
            &nbsp;
            <a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true"
               data-icon="undo">清空查询</a>
            <div class="pull-right">
                <button type="button" class="btn-blue" data-url="<%=basePath%>njsfy-medicineInstance/fileDownload.do"
                        data-toggle="doexport" data-confirm-msg="确定要下载吗？" data-icon="download">模板下载
                </button>
                &nbsp;
                <button type="button" class="btn-red"
                        data-url="<%=basePath%>njsfy-medicineInstance/medicineInstance-import.do"
                        data-toggle="dialog" data-target="medicineTree-import" data-id="medicineTree-import-dialog"
                        data-icon="plus"
                        data-width="1000" data-height="300">批量导入
                </button>
                <button type="button" class="btn-green"
                        data-url="<%=basePath%>njsfy-medicineInstance/medicineInstance-input.do" data-toggle="dialog"
                        data-target="medicineInstance-input" data-id="medicineInstance-input-dialog" data-icon="plus"
                        data-width="1000" data-height="500">添加药品
                </button>
                &nbsp;
                <button type="button" class="btn-blue" data-url="<%=basePath%>njsfy-medicineInstance/remove.do"
                        data-toggle="doajaxchecked" data-confirm-msg="确定要删除选中项吗？" data-icon="remove"
                        data-idname="delids" data-group="ids">删除选中
                </button>


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
            <th width="10%" align="center">药品名称</th>
            <th width="10%" align="center">药品规格</th>
            <th width="5%" align="center">价格</th>
            <th width="10%" align="center">厂商</th>
            <%--<th width="5%" align="center">药品类别</th>--%>
            <th width="10%" align="center">警示</th>
            <%--<th width="35%" align="center">适应症</th>--%>
            <%--<th width="35%" align="center">用法用量</th>--%>
            <th width="10%" align="center">哺乳期安全等级</th>
            <th width="10%" align="center">妊娠期危害分级</th>
            <th width="5%" align="center">是否基药</th>
            <th width="6%" align="center">是否高危药</th>
            <th width="5%" align="center">医保类别</th>
            <th width="30%" align="center">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.result}" var="bean" varStatus="status">
            <tr data-id="${bean.rowId}">
                <td class="" align="center"><input type="checkbox" name="ids" data-toggle="icheck" value="${bean.rowId}"></td>
                <td class="" align="center">${bean.medicineName}</td>
                <td class="" align="center">${bean.medicineGuige}</td>
                <td class="" align="center">${bean.price}</td>
                <td class="" align="center">${bean.changShang}</td>
                <td class="" align="center">${bean.warn}</td>
                    <%--<td align="center">${bean.syz}</td>--%>
                    <%--<td align="center">${bean.yfyl}</td>--%>
                <td class="" align="center">${bean.brqAqdj}</td>
                <td class="" align="center">${bean.yqAqdj}</td>
                <td class="" align="center">${bean.isJy}</td>
                <td class="" align="center">${bean.isGwy}</td>
                <td class="" align="center">${bean.ybType}</td>
                <td align="center">
                        <button class="btn-blue" data-url="<%=basePath%>njsfy-medicineInstance/edit.do?rowId=${bean.rowId}" data-toggle="dialog" data-id="column-article-update" data-mask="true" data-width="1000" data-height="500"  data-title="编辑">编辑</button>
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