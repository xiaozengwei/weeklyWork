<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.text.DateFormat"%>
<%@ page import="java.io.*"%>
<%@ page import="java.lang.*"%>
<%@include file="/common/taglibs.jsp"%>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<style>
    .form-advice>label {
        width: 480px;
    }
</style>
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="<%=basePath%>weeklyView/list.do" method="post">
        <tr>
            <td  class="jxlable" align="right">
                <select name="year" data-toggle="selectpicker">
                    <c:forEach items="${yearList}" var="y">
                        <option value="${y}" ${year eq y?'selected="selected"':''}>${y}</option>
                    </c:forEach>
                </select>年

                <select name="week" data-toggle="selectpicker">
                    <c:forEach items="${weekList}" var="w">
                        <option value="${w}" ${week eq w?'selected="selected"':''}>${w}</option>
                    </c:forEach>
                </select> 周

                <%--<a href="<%=basePath%>weeklyWork/list-new.do" class="btn btn-default" data-toggle="ajaxload" data-target="#myLoadDiv1" onclick="$(this).next().show()">查询</a>--%>
                <button type="submit" class="btn-default" data-icon="search">查询</button>
            </td>
        </tr>
        <div class="pull-right">
            <select name="weekExport" data-toggle="selectpicker">
                <c:forEach items="${weekList}" var="w">
                    <option value="${w}" ${week eq w?'selected="selected"':''}>${w}</option>
                </c:forEach>
            </select> 周
            <button type="button" class="btn-green" data-url="<%=basePath%>weeklyView/export.do" data-toggle="doexport" data-confirm-msg="确定要导出吗？" data-idname="delids" data-group="ids">导出</button>
        </div>
    </form>

</div>
<div class="bjui-pageContent">
    <table width="100%" border="1" cellspacing="0" cellpadding="0"
           align="center">
        <tbody>
        <tr>
            <td class="bdTableb">
                <table id="tet" cellspacing="0" cellpadding="0" width="90%"
                       align="center" border="0" style="margin-top:30px" >
                    <tbody>
                    <tr>
                        <td width="19" valign="bottom" class="fileCorner1"></td>
                        <td class="fileline01">&nbsp;</td>
                        <td valign="top" class="fileCorner2"></td>
                    </tr>
                    <tr>
                        <td class="fileline02">&nbsp;</td>
                        <td>
                            <table  align="center"  cellpadding="0" cellspacing="0" width="100%" border="0" >
                                <tr>
                                    <td align="center">
                                        <div class="bdtitle">${index.createDept}${year}${jd}建设公司一周主要会议安排
                                            <textarea name="title" id="title"  style="display: none">${index.createDept}${year}${jd}建设公司一周主要会议安排</textarea>
                                        </div>
                                        <table width="90%" align="center"  cellpadding="0" cellspacing="0"  class="mailborder" >
                                            <tr>

                                                <td  class="jxlable" align="left" style="font-size: 15px">
                                                    ${year}年
                                                    ${week}周


                                                    <%--<a href="<%=basePath%>weeklyWork/list-new.do" class="btn btn-default" data-toggle="ajaxload" data-target="#myLoadDiv1" onclick="$(this).next().show()">查询</a>--%>

                                                </td>
                                                <td  class="jxlable" align="left"> </td>
                                                <td  class="jxlable" align="right" style="font-size: 15px">${startTime}至${endTime} </td>
                                            </tr>
                                        </table>

                                        <table  width="99%" border="0" cellspacing="0" cellpadding="0" class="cttable" >
                                            <thead>
                                            <tr >
                                                <th title="日期" width="8%" align="center">
                                                    日期
                                                </th>
                                                <%--<th title="时间" width="10%" align="center">--%>
                                                <%--时间--%>
                                                <%--</th>--%>
                                                <th title="时间"  width="10%"  align="center">
                                                    时间
                                                </th>
                                                <th title="会议内容"  width="20%"  align="center">
                                                    会议内容
                                                </th>
                                                <th title="地点"  width="15%"  align="center">
                                                    地点
                                                </th>
                                                <th title="召集领导"  width="12%"  align="center">
                                                    召集领导
                                                </th>
                                                <th title="出席人员"  width="15%"  align="center">
                                                    出席人员
                                                </th>
                                                <th title="承办部门"  width="10%"  align="center" align="center">
                                                    承办部门
                                                </th>

                                            </tr>
                                            <%--<tr >--%>
                                            <%--<th title="日期" style="width: 10%;${status.index eq '0'?'':'display:none;'}" align="center"><textarea type="text" name="njdtJxUploadRecord[#index#].content"data-toggle="autoheight"   rows="1" readonly="readonly"></textarea></th>--%>
                                            <%--<th title="时间" style="width: 10%;${status.index eq '0'?'':'display:none;'}" align="center">--%>
                                            <%--<input type="text" name="useOrgName"  value="${weeklyReport.useOrgName}" data-toggle="lookup" data-url="<%=basePath %>sysorg/orglookup.do?orgName=useOrgName&orgId=useOrgId" data-rule="required">--%>
                                            <%--</th>--%>
                                            <%--<th title="时间" style="width: 10%;${status.index eq '0'?'':'display:none;'}" align="center">--%>
                                            <%--<input type="text" name="useOrgName"  value="${weeklyReport.useOrgName}" data-toggle="lookup" data-url="<%=basePath %>sysorg/orglookup.do?orgName=useOrgName&orgId=useOrgId" data-rule="required">--%>
                                            <%--</th>--%>
                                            <%--<th title="会议内容" style="width: 20%;${status.index eq '0'?'':'display:none;'}" align="center"><textarea type="text" name="njdtJxUploadRecord[#index#].content" data-rule="required" data-toggle="autoheight"   rows="1" ></textarea></th>--%>
                                            <%--<th title="地点" style="width: 10%;${status.index eq '0'?'':'display:none;'}" align="center"><textarea type="text" name="njdtJxUploadRecord[#index#].xs" data-toggle="autoheight" data-rule="required"  rows="1" ></textarea></th>--%>
                                            <%--<th title="召集领导" style="width: 10%;${status.index eq '0'?'':'display:none;'}" align="center"><textarea type="text" name="njdtJxUploadRecord[#index#].zbgz" data-toggle="autoheight" data-rule="required"  rows="1" ></textarea></th>--%>
                                            <%--<th title="出席人员" style="width: 20%;${status.index eq '0'?'':'display:none;'}" align="center"><textarea type="text" name="njdtJxUploadRecord[#index#].beizhu" data-toggle="autoheight"   rows="1" ></textarea></th>--%>
                                            <%--<th title="承办部门" style="width: 10%;${status.index eq '0'?'':'display:none;'}" align="center" align="center"><textarea type="text" name="njdtJxUploadRecord[#index#].beizhu" data-toggle="autoheight"   rows="1" ></textarea></th>--%>

                                            <%--</tr>--%>

                                            </thead>
                                            <tbody>
                                            <c:forEach items="${dateLists}" var="list" varStatus="i">

                                                <c:forEach items="${list.meetList}" var="meetList" varStatus="status">

                                                    <tr >
                                                        <c:if test="${'0' eq status.index}">
                                                        <td rowspan="${list.count}" align="center" style="font-size: 16px;">${list.dateName}<br/>${meetList.dayOfWeek}</td>
                                                        </c:if>
                                                        <td align="center" style="font-size: 14px;${meetList.ext2 eq "1" ?"":"background-color: #a1354c"}">${meetList.ext3}</td>
                                                            <%--<td align="center">${meetList.endTime}</td>--%>
                                                        <td align="center" style="font-size: 14px;${meetList.ext2 eq "1" ?"":"background-color: #a1354c"}">${meetList.title}</td>
                                                        <td align="center" style="font-size: 14px;${meetList.ext2 eq "1" ?"":"background-color: #a1354c"}">${meetList.meetingRoomName}</td>
                                                        <td align="center" style="font-size: 14px;${meetList.ext2 eq "1" ?"":"background-color: #a1354c"}">${meetList.callLeaderName}</td>
                                                        <td align="center" style="font-size: 14px;${meetList.ext2 eq "1" ?"":"background-color: #a1354c"}">${meetList.callUsersName}</td>
                                                        <td align="center" style="font-size: 14px;${meetList.ext2 eq "1" ?"":"background-color: #a1354c"}">${meetList.useOrgName}</td>



                                                    <tr/>


                                                    <%--<c:if test="${'0' ne status.index}">--%>
                                                    <%--<tr>--%>


                                                    <%--<td>${meetList.startTime}</td>--%>
                                                    <%--<td>${meetList.endTime}</td>--%>
                                                    <%--<td>${meetList.title}</td>--%>
                                                    <%--<td>${meetList.meetingRoomName}</td>--%>
                                                    <%--<td>${meetList.callLeaderName}</td>--%>
                                                    <%--<td>${meetList.callUsersName}</td>--%>
                                                    <%--<td>${meetList.createOrgName}</td>--%>



                                                    <%--<tr/>--%>

                                                    <%--</c:if>--%>
                                                </c:forEach>
                                            </c:forEach>

                                            </tbody>
                                        </table>



                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td class="fileShadowR">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="fileCorner4">&nbsp;</td>
                        <td class="fileShadowB">&nbsp;</td>
                        <td class="fileCorner3" width="19px">&nbsp;</td>
                    </tr>
                    </tbody>
                </table>

            </td>
        </tr>
        </tbody>
    </table>
</div>

<script type="text/javascript">
    function deleteRow(r)
    {
        var i=r.parentNode.parentNode.rowIndex;
        document.getElementById('phone-table').deleteRow(i);
    }
    function deleteRows(r)
    {
        var i=r.parentNode.parentNode.rowIndex;
        document.getElementById('phone-tables').deleteRow(i);
    }
    $(function() {

        $(".doc-print", $.CurrentNavtab).click(function() {
            var _url = $(this).data("url");
            window.open(_url, '_blank');
        });
        var tableId = $("#tableIds1",$.CurrentNavtab);
        tableId.val("${index.rowId}");

    });
</script>




<script src="<%=basePath%>gx/js/part-advice.js"></script>