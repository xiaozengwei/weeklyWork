<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<script>
    function callback(json) {
        console.log(json.row_ides)
        var rowId=json.row_ides;
        for(var i=0;i<rowId.length;i++){
            console.log("#"+rowId[i])
            $("#"+rowId[i]).remove();
        }
    }
    $(function () {
        var uploader = new plupload.Uploader({
            runtimes : 'html5,flash,silverlight,html4',
            //触发文件选择对话框的按钮，为那个元素id
            browse_button : 'pickfiles',
            //服务器端的上传页面地址
            url : '<%=basePath%>weeklyWork/fileupload.do',
            //swf文件，当需要使用swf方式进行上传时需要配置该参数
            flash_swf_url : '../js/Moxie.swf',
            //silverlight文件，当需要使用silverlight方式进行上传时需要配置该参数
            silverlight_xap_url : '../js/Moxie.xap',
            //是否可以在文件浏览对话框中选择多个文件
            multi_selection:true,
            filters : {
                mime_types : [ //只允许上传图片
                    { title : "Image files", extensions : "jpg,gif,png,doc,docx,pdf" }
                ],
                max_file_size : '50mb', //最大只能上传50mb的文件
                prevent_duplicates : true //不允许选取重复文件
            },
            init: {
                PostInit: function() {
                    document.getElementById('uploadfiles').onclick = function() {
                        uploader.start();
                        return false;
                    };
                },
                FilesAdded:function(up,files){
                    plupload.each(files, function(file) {
                        document.getElementById('upload-file-list').value = file.name ;
                    });
                },
                FileUploaded:function(up,file,response){
                    console.log(JSON.parse(response.response).AttachEntity)
                    var user=JSON.parse(response.response).user
                    var AttachEntity=JSON.parse(response.response).AttachEntity
                    var tbBody=document.getElementById("tbBody")
                    var tr=document.createElement("tr")
                    tr.setAttribute("id", AttachEntity.rowId)
                    var text=null
                    for(var i=0;i<5;i++) {
                        var td = document.createElement("td")
                        td.setAttribute("align","center")
                        if(i==0){
                            td.innerHTML='<input type="checkbox" class="icheckbox_minimal-purple"  style="bottom: 0px;" data-toggle="icheck" name="ids" value='+AttachEntity.rowId+'/>'
                        }
                        else if(i==1) {
                            text = document.createTextNode(file.name);
                        }else if(i==2){
                            text = document.createTextNode(file.lastModifiedDate);
                        }else if(i==3){
                            text = document.createTextNode(user.userName);
                        }else {
                            text = document.createTextNode(file.type);
                        }
                        if(i!=0){
                            td.appendChild(text)
                        }
                        tr.appendChild(td)
                    }
                    tbBody.appendChild(tr);
//                    $("#uploadfiles").bjuiajax('refreshlayout', { target:$("#tabelRe")});
//                    $("#uploadfiles").dialog('refresh')

                },
                Error: function(up, err) {
                    $.CurrentDialog.alertmsg("error", err.message);
                }
            }
        });

        uploader.init();

    })
</script>
<base href="<%=basePath %>">
<div class="bjui-pageContent">
    <form action="<%=basePath%>weeklyWork/weeklyWork-save.do" method="post" data-toggle="validate" data-reloadNavtab="true" onsubmit="return check(this)">
        <input type="hidden" name="rowId"  value="${weeklyReport.rowId}" >
        <table class="table table-condensed table-hover">
            <tbody>
            <tr>
                <td>
                    <label class="control-label x90" style="width: 105px;">会议主题：</label>
                    <textarea name="title" readonly="readonly" data-toggle="autoheight" data-rule="required" >${weeklyReport.title}</textarea>
                </td>
            </tr>
            <tr>
                <td>
                    <label class="control-label x90" style="width: 105px;">开始时间：</label>
                    <input id="startTime" type="text" name="startTime" readonly="readonly"  value="<fmt:formatDate value="${weeklyReport.startTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" >
                </td>
            </tr>
            <tr>
                <td>
                    <label class="control-label x90" style="width: 105px;">结束时间：</label>
                    <input id="endTime" type="text" name="endTime"  readonly="readonly"  value="<fmt:formatDate value="${weeklyReport.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/>">
                </td>
            </tr>
            <tr>
                <td>
                    <label class="control-label x90" style="width: 105px;">会议室：</label>
                    <input type="text" name="meetingRoomName" readonly="readonly" value="${weeklyReport.meetingRoomName}">
                </td>
            </tr>
            <tr>
                <td>
                    <label class="control-label x90" style="width: 105px;">承办部门：</label>
                    <input type="hidden" name="useOrgId"  value="${weeklyReport.useOrgId}" >
                    <input type="text" name="useOrgName"  readonly="readonly" value="${weeklyReport.useOrgName}">
                </td>
            </tr>
            <tr>
                <td>
                    <label class="control-label x90" style="width: 105px;">召集领导：</label>
                    <input type="hidden" name="callLeaderId"  value="${weeklyReport.callLeaderId}" >
                    <input type="text" name="callLeaderName"  readonly="readonly" value="${weeklyReport.callLeaderName}">
                </td>
            </tr>
            <tr>
                <td>
                    <label class="control-label x90" style="width: 105px;">出席人员：</label>
                    <input type="hidden" name="callUsersId"  value="${weeklyReport.callUsersId}" >
                    <input type="text" name="callUsersName"  readonly="readonly" value="${weeklyReport.callUsersName}">
                </td>
            </tr>
            <tr>
                <td>
                    <label class="control-label x90" style="width: 105px;">出席机构：</label>
                    <input type="hidden" name="callOrgsId"  value="${weeklyReport.callOrgsId}" >
                    <input type="text" name="callOrgsName"  readonly="readonly" value="${weeklyReport.callOrgsName}">
                </td>
            </tr>
            <tr>
                <td>
                    <label class="control-label x90" style="width: 105px;">备注：</label>
                    <input type="text" name="remark" readonly="readonly" value="${weeklyReport.remark}">
                </td>
            </tr>
            <tr>
                <td id="columnArticleTitlePicForm">
                    <table width="90%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="15%"><label  class="control-label x90" style="width: 105px;">文件名称：</label></td>
                            <td>
                                <button type="button" class="btn-blue" data-url="<%=basePath%>weeklyWork/fileDownload.do" data-toggle="doexportchecked" data-confirm-msg="确定要下载吗？" data-icon="download" data-idname="delids" data-group="ids">下载选中文件</button>
                            </td>
                        </tr>
                    </table>
                    <table id="tabelRe" class="table table-bordered table-hover table-striped table-top" >
                        <tbody id="tbBody">
                        <tr>
                            <td width="5%" align="center"><input type="checkbox" class="checkboxCtrl" data-group="ids" data-toggle="icheck"></td>
                            <td align="center" width="30%">文件名称</td>
                            <td align="center" width="35%">上传时间</td>
                            <td align="center" width="15%">上传人</td>
                            <td align="center" width="10%">操作</td>
                        </tr>
                        <c:forEach items="${fileRecordList}" var="fileRecord" varStatus="status">
                            <tr id="${fileRecord.rowId}">
                                <td align="center"><input type="checkbox" name="ids" data-toggle="icheck" value="${fileRecord.rowId}"></td>
                                <td align="center">${fileRecord.fileName }</td>
                                <td align="center">${fileRecord.uploadTime}</td>
                                <td align="center">${fileRecord.uploadUserId}</td>
                                <td align="center">${fileRecord.fileType}</td>
                            </tr>
                        </c:forEach>
                        </tbody>

                    </table>
                </td>
            </tr>


            </tbody>
        </table>
    </form>

</div>
<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close">关闭</button></li>
    </ul>
</div>
