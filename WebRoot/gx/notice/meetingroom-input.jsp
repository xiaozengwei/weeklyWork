<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath %>">
<div class="bjui-pageContent">
    <form action="<%=basePath%>meetingRoom/save.do" method="post" data-toggle="validate" data-reloadNavtab="ture">
        <input type="hidden" name="rowId"  value="${model.rowId}" />
        <table class="table table-condensed table-hover">
            <tbody>
            <tr>
                <td  align="center"><h3>添加会议室</h3></td>
            </tr>

            <tr>
                <td>
                    <label class="control-label x90">会议室名称：</label>
                    <input type="text" name="mtName"  value="${model.mtName}" data-rule="required" size="20">
                </td>
            </tr>
            <tr>
                <td>
                    <label class="control-label x90">状态：</label>
                    <select name="status" data-toggle="selectpicker">
                        <option value="开放" ${model.status eq '开放' ? 'selected="selected"':'' }>开放</option>
                        <option value="关闭"  ${model.status eq '关闭' ? 'selected="selected"':'' }>关闭</option>
                    </select>

                </td>
            </tr>
            </tbody>
        </table>
    </form>
</div>
<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close">关闭</button></li>
        <li><button type="submit" class="btn-default">保存</button></li>
    </ul>
</div>