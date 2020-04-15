<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="navtabPage unitBox" style="display: block;">
    <div class="bjui-pageHeader">
        <form id="pagerForm" data-toggle="ajaxsearch" action="<%=basePath%>weeklyView/list-inform.do" method="post">
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

        </form>
    </div>

    <div class="bjui-pageContent tableContent" style="top: 63px; bottom: 28px;">
        <form action="<%=basePath%>weeklyWork/inform-save.do" id="j_custom_form" class="pageForm nice-validator n-red" data-toggle="validate" method="post" novalidate="novalidate">
            <table id="tabledit1" class="table workborder table-hover table-striped table-top bjui-tabledit" data-toggle="tabledit" data-initnum="" data-action="ajaxDone3.html" data-single-noindex="true">
                <thead>


                <tr style="display:none;">
                    <th title="主键" style="width: 0%;border-bottom:1px #000 solid;" align="center">
                        <input type="text" readonly name="meetingArrangement1[#index#].rowId"  id="meetingArrangement1[#index#].rowId"    data-pattern="yyyy-MM-dd HH:mm:ss" value="0"
                               aria-required="true">

                    </th>
                    <th title="开始" style="width: 8%;border-bottom:1px #000 solid;" align="center">
                        <input type="text" name="meetingArrangement[#index#].startTime"  id="meetingArrangement1[#index#].startTime"    data-pattern="yyyy-MM-dd HH:mm:00"
                               data-mm-step=10
                               data-toggle="datepicker" align="center"  aria-required="true" >
                    </th>
                    <th title="结束" style="width: 8%;border-bottom:1px #000 solid;" align="center">
                        <input type="text"  name="meetingArrangement[#index#].endTime"  id="meetingArrangement1[#index#].endTime"    data-pattern="yyyy-MM-dd HH:mm:00"
                               data-mm-step=10
                               data-toggle="datepicker" align="center"  aria-required="true" >
                    </th>
                    <th title="标题" style="width: 12%;border-bottom:1px #000 solid;" align="center">
                        <input type="text" name="meetingArrangement[#index#].title" id="meetingArrangement1[#index#].title"
                               value="" style="width:90%;font-size: 15px" />
                    </th>

                    <th title="地点" style="width: 8%;border-bottom:1px #000 solid;" align="center">
                        <input type="text" style="font-size: 15px" name="meetingArrangement[#index#].meetingRoomName" ondblclick="findaddress(this)"
                               id="meetingArrangement1[#index#].meetingRoomName"  />
                    </th>
                    <th title="召集领导" style="width: 8%;border-bottom:1px #000 solid;" align="center">

                        <input type="text" name="meetingArrangement[#index#].callLeaderName"  ondblclick="findCallLeader(this)"
                               id="meetingArrangement1[#index#].callLeaderName"  value="" style="width:90%;font-size: 15px"

                        />
                        <input type="hidden" name="meetingArrangement[#index#].callLeaderId"
                               id="meetingArrangement1[#index#].callLeaderId"  value="" style="width:90%;font-size: 15px;display: none"
                        />
                    </th>
                    <th title="出席人员" style="width: 10%;border-bottom:1px #000 solid;" disabled="true" align="center">

                        <input type="text" name="meetingArrangement[#index#].callUsersName"
                               id="meetingArrangement1[#index#].callUsersName" value="" style="width:90%;font-size: 15px" disabled="true"

                        />
                        <input type="hidden" name="meetingArrangement[#index#].callUsersId"
                               id="meetingArrangement1[#index#].callUsersId"  value="" style="width:90%;font-size: 15px;display: none"
                        />
                    </th>
                    <th title="承办部门" style="width: 10%;border-bottom:1px #000 solid;" align="center">

                        <input type="text" name="meetingArrangement[#index#].useOrgName"
                               id="meetingArrangement1[#index#].useOrgName" ondblclick="findCallDept(this)" value="" style="width:90%;font-size: 15px"

                        />
                        <input type="hidden" name="meetingArrangement[#index#].useOrgId"
                               id="meetingArrangement1[#index#].useOrgId"  value="" style="width:90%;font-size: 15px"
                        />
                    </th>

                    <th title="审核人" style="width: 10%;border-bottom:1px #000 solid;" align="center">

                        <input type="text" name="meetingArrangement[#index#].auditorName"  ondblclick="findAuditor(this)"
                               id="meetingArrangement1[#index#].auditorName"  value="" style="width:90%;font-size: 15px"

                        />
                        <input type="hidden" name="meetingArrangement[#index#].auditorId"
                               id="meetingArrangement1[#index#].auditorId"  value="" style="width:90%;font-size: 15px;display: none"
                        />
                    </th>

                    <th title="附件(图片)" style="width: 10%;border-bottom:1px #000 solid;" align="center">
                        <input type="text" name="meetingArrangement[#index#].remark"  ondblclick="findImg(this)"
                               id="meetingArrangement1[#index#].remark"  value="" style="width:90%;font-size: 15px"

                        />
                    </th>

                    <th title="" width="100" style="width: 5%;border-bottom:1px #000 solid;" align="center" >
                        <a onclick="save(this)" class="btn btn-green " >保存</a>
                    </th>

                    <th title="" width="100" style="width: 5%;border-bottom:1px #000 solid;" align="center">
                        <a onclick="deleteRow(this)" class="btn btn-red " >删除</a>
                    </th>


                </tr>
                <tr>
                    <td style="width: 0%;border-bottom:1px #000 solid;border-top:1px #000 solid;" align="center">主键</td>
                    <td title="" style="width: 6%;border-bottom:1px #000 solid;border-top:1px #000 solid;" align="center">开始</td>
                    <td title="" style="width: 6%;border-bottom:1px #000 solid;border-top:1px #000 solid;" align="center">结束</td>
                    <td title="" style="width: 12%;border-bottom:1px #000 solid;border-top:1px #000 solid;" align="center">标题</td>
                    <td title="" style="width: 8%;border-bottom:1px #000 solid;border-top:1px #000 solid;" align="center">地点</td>
                    <td title="" style="width: 12%;border-bottom:1px #000 solid;border-top:1px #000 solid;" align="center">召集领导</td>
                    <td title="" style="width: 15%;border-bottom:1px #000 solid;border-top:1px #000 solid;" align="center" disabled="true">出席人员</td>
                    <td title="" style="width: 12%;border-bottom:1px #000 solid;border-top:1px #000 solid;" align="center">承办部门</td>
                    <td title="" style="width: 8%;border-bottom:1px #000 solid;border-top:1px #000 solid;" align="center">审核人</td>
                    <td title="" style="width: 8%;border-bottom:1px #000 solid;border-top:1px #000 solid;" align="center">上传(图片)</td>

                    <td colspan="2" align="right" style="border-top:1px #000 solid;">
                        <button type="button" class="btn btn-green" data-toggle="tableditadd" data-target="#tabledit1" data-num="1" data-icon="plus"> 添加行</button>
                    </td>
                </tr>

                </thead>
                <tbody>
                <c:forEach items="${list}" var="meet" varStatus="status">
                    <tr>
                        <td style=" ${meet.ext2 eq '2'?"background-color:  #ff6250":""}">${meet.rowId}</td>
                        <td width="13%" style=" ${meet.ext2 eq '2'?"background-color:  #ff6250":""}"><fmt:formatDate value="${meet.startTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                        <td width="13%" style=" ${meet.ext2 eq '2'?"background-color:  #ff6250":""}"><fmt:formatDate value="${meet.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                        <td style=" ${meet.ext2 eq '2'?"background-color:  #ff6250":""}">${meet.title}</td>
                        <td style=" ${meet.ext2 eq '2'?"background-color:  #ff6250":""}">${meet.meetingRoomName}</td>
                        <td style=" ${meet.ext2 eq '2'?"background-color:  #ff6250":""}">${meet.callLeaderName}</td>
                        <td style=" ${meet.ext2 eq '2'?"background-color:  #ff6250":""}" readonly="readonly">${meet.callUsersName}</td>
                        <td style=" ${meet.ext2 eq '2'?"background-color:  #ff6250":""}">${meet.useOrgName}</td>
                        <td style=" ${meet.ext2 eq '2'?"background-color:  #ff6250":""}">${meet.auditorName}</td>
                        <td style=" ${meet.ext2 eq '2'?"background-color:  #ff6250":""}">${meet.remark}</td>
                        <td></td>
                        <td></td>
                    <tr/>

                </c:forEach>
                </tbody>
            </table>
        </form>
    </div>
    <div class="bjui-pageFooter">
        <ul>
            <li><button type="button" class="btn btn-close" data-icon="close"> 取消</button></li>
            <%--<li><button type="button" onclick="save()" class="btn btn-default" data-icon="save">全部保存</button></li>--%>
        </ul>
    </div></div>
<script>
    function findImg(r){
        var index=r.parentNode.parentNode.rowIndex;
        var index = index-2;
        $(r).lookup({id:'findAuditor', url:'<%=basePath %>weeklyWork/img-select-upload.do?fileName='+r.value+'&docId=meetingArrangement['+index+'].remark&group='+index, title:'上传',width:650,height:300});
    }
    function findAuditor (r)
    {
        var index=r.parentNode.parentNode.rowIndex;
        var index = index-2;
        $(r).lookup({id:'findAuditor', url:'<%=basePath %>sysorg/auditor-select-page.do?docId=meetingArrangement['+index+'].auditorName&group='+index, title:'审核人',width:600,height:600});
    }
    function findCallDept(r)
    {
        var index=r.parentNode.parentNode.rowIndex;
        var index = index-2;
        $(r).lookup({id:'callDept', url:'<%=basePath %>sysorg/callDept.do?orgName=meetingArrangement'+index+'useOrgName&index='+index, title:'召集部门'});
    }
    function findCallperson(r)
    {
        var index=r.parentNode.parentNode.rowIndex;
        var index = index-2;
        $(r).lookup({id:'findCallperson', url:'<%=basePath %>sysorg/user-select-page.do?index='+index, title:'出席人员'});
    }
    function findCallLeader(r)
    {
        var index=r.parentNode.parentNode.rowIndex;
        var index = index-2;
        $(r).lookup({id:'findCallLeader', url:'<%=basePath %>sysorg/leader-select-page.do?docId=meetingArrangement['+index+'].callLeaderName&group='+index, title:'召集领导',width:600,height:600});

    }
    function findaddress(r)
    {
        var index=r.parentNode.parentNode.rowIndex;
        var index = index-2;
        var startTime="";
        var endTime="";
        $.CurrentNavtab.find(':input').each(function() {
            var $input = $(this), inputName = 'meetingArrangement['+index+'].startTime',inputOrgid =  'meetingArrangement['+index+'].endTime';
            var name = $input.attr("name");


            if (name == (inputName)) {

                startTime=$input.val();
            }
            if (name == (inputOrgid)) {
                endTime=$input.val();
            }
        });
        $(r).lookup({id:'findaddress', url:'<%=basePath %>weeklyView/select-meetingroom.do?startTime='+startTime+'&endTime='+endTime+'&docId=meetingArrangement['+index+'].callLeaderName&group='+index, title:'地点',width:1000,height:800});

    }

    function deleteRow(r)
    {
        var i=r.parentNode.parentNode.rowIndex;
        var row = i-2;

        var rowIdIndex = document.getElementById('meetingArrangement1['+row+'].rowId');
        if(rowIdIndex!=null){
            var rowId = rowIdIndex.value;
            if(rowId!="0"){

                $.ajax({
                    url:"<%=basePath%>weeklyWork/removeWeek.do",
                    type:"post",
                    dataType:"json",
                    data:{'rowId':rowId},
                    success:function(data){

                    }
                });
            }
        }

        document.getElementById('tabledit1').deleteRow(i);
    }

    function save(r)
    {
        var i=r.parentNode.parentNode.rowIndex;
        var row = i-2;
        var rowId = document.getElementById('meetingArrangement1['+row+'].rowId').value;
        var startTime = document.getElementById('meetingArrangement1['+row+'].startTime').value;
        var endTime = document.getElementById('meetingArrangement1['+row+'].endTime').value;
        var title = document.getElementById('meetingArrangement1['+row+'].title').value;
        var callLeaderName = document.getElementById('meetingArrangement1['+row+'].callLeaderName').value;
        var callUsersName = document.getElementById('meetingArrangement1['+row+'].callUsersName').value;
        var useOrgName = document.getElementById('meetingArrangement1['+row+'].useOrgName').value;
        var meetingRoomName = document.getElementById('meetingArrangement1['+row+'].meetingRoomName').value;
        var auditorName = document.getElementById('meetingArrangement1['+row+'].auditorName').value;
        var fileName = document.getElementById('meetingArrangement1['+row+'].remark').value;
        if(rowId==""||startTime==""||title==""||callLeaderName==""||meetingRoomName==""||auditorName==""){
            $(this).alertmsg('error',"不能为空");
            return;
        }
        if(rowId!=null){
            $.ajax({
                url:"<%=basePath%>weeklyWork/inform-save.do",
                type:"post",
                dataType:"json",
                data:{
                    'rowId':rowId,
                    'startTime':startTime,
                    'endTime':endTime,
                    'title':title,
                    'callLeaderName':callLeaderName,
                    'callUsersName':callUsersName,
                    'useOrgName':useOrgName,
                    'meetingRoomName':meetingRoomName,
                    'auditorName':auditorName,
                    'fileName':fileName
                },
                success:function(data){
                    if(data.statusCode=="200"){
                        $(this).navtab('refresh');
                    }else if(data.statusCode=="300") {
                        $(this).alertmsg('info',data.message);
                    }
                }
            });

        }
    }




</script>