<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%
    String path = request.getContextPath();
    String basePath = request.getContextPath()+"/";
%>
<style>
    .user-bring{
        cursor: pointer;
    }
</style>
<table data-width="100%" class="table table-bordered">
    <tbody>
    <c:forEach items="${userList}" var="user" varStatus="status">
        <tr id="${user.userId}">
            <td align="center" class="user-bring" data-user='{"id":"${user.userId}", "name":"${user.userName}","orgId":"${user.orgId}"}'>${user.userName}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
