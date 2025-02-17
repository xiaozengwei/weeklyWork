<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="bjui-pageContent">
    <form action="<%=basePath%>roleuserorg/role-saveUserToRole.do" method="post" data-toggle="validate" data-reloadNavtab="true">
        <input type="hidden" name="roleRowId" value="${rowId}"/>
        <div class="bjui-doc">
            <h3 class="page-header">关联用户选择</h3>
            <ul>
                <li>
                    <label>关联用户：</label>
                    <input type="hidden" name="userId"   class="doc_lookup" >
                    <input type="text" name="userName"  size="50" class="doc_lookup" data-toggle="lookup" data-url="<%=basePath%>roleuserorg/role-userlookup.do?roleRowid=${rowId}" size="20" readonly="readonly" data-width="700" data-height="600" data-title="请选择人员">
                </li>
            </ul>
        </div>
    </form>
</div>
<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close">关闭</button></li>
        <li><button type="submit" class="btn-default">保存</button></li>
    </ul>
</div>