<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script src="<%=request.getContextPath()%>/gx/njsfy_index/js/jquery-1.7.2.min.js"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/gx/njsfy_index/js/lightbox.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/gx/njsfy_index/js/jquery.lightbox.css" type="text/css"></link>


<link href="<%=request.getContextPath()%>/gx/njsfy_index/images/css.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/gx/njsfy_index/images/demo.css" type="text/css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/gx/njsfy_index/images/zTreeStyle.css" type="text/css">
<script src="<%=request.getContextPath()%>/gx/njsfy_index/js/jquery.ztree.core.js"></script>

<style>
  /*  ul.ztree {
        margin-left: 0px;
        margin-top: -2px;
        border: 1px solid #617775;
        background: #f0f6e4;
        width: 270px;
        height: 550px;
        overflow-y: scroll;
        overflow-x: auto;
    }*/
</style>

<script>
    var rowIdList=new Array();
    function yulan(rowId) {
        window.open('<%=basePath%>/gx/njsfy_index/js/pdfjs/web/viewer.html?file=' +encodeURIComponent('<%=basePath%>njsfy-index/fileDownload-attach.do?rowIdList='+rowId));
    }
    function allClick() {
        var selectedCheckList=$(".selectedCheck");
        for(var i=0;i<selectedCheckList.length;i++){
            if($("#allselected").is(':checked')){
                $(selectedCheckList[i]).attr("checked",true);
                rowIdList.push($(selectedCheckList[i]).val());
            }else{
                $(selectedCheckList[i]).attr("checked",false);
                rowIdList.length=0;
            }
        }
    }
    function selectedOne(rowId) {

        if($("#"+rowId).is(':checked')){
            $("#"+rowId).attr("checked",true);
            rowIdList.push($("#"+rowId).val());
        }else{
            $("#"+rowId).attr("checked",false);
            var index = rowIdList.indexOf($("#"+rowId).val());
            if (index > -1) {
                rowIdList.splice(index, 1);
            }

        }
    }
    function downloadAttach() {
        if(rowIdList.length>0){
            location.href="<%=basePath%>njsfy-index/fileDownload-attach.do?rowIdList="+rowIdList;
        }
    }
    function lookAttach(rowId) {
        location.href="<%=basePath%>njsfy-index/fileDownload-attach.do?rowIdList="+rowId;
    }
</script>
<style>


</style>


<!-- for doc end -->


<div class="detail_contain">
    <div class="detail_title">
        <span class="line"></span>黑框警示
        <p class="explain">${medicineInstance.warn==null?"暂无信息":medicineInstance.warn}</p>
    </div>
    <div class="detail_title">
        <span class="line"></span>适应症
        <p class="explain">${medicineInstance.syz==null?"暂无信息":medicineInstance.syz}</p>
    </div>
    <div class="detail_title">
        <span class="line"></span>用法用量
        <p class="explain">${medicineInstance.yfyl==null?"暂无信息":medicineInstance.yfyl}</p>
    </div>
    <div class="detail_title">
        <span class="line"></span>特殊存储条件
        <p class="explain">${medicineInstance.tsCcTj==null?"暂无信息":medicineInstance.tsCcTj}</p>
    </div>
    <div class="detail_title">
        <span class="line"></span>超说明书使用
        <p class="explain">${medicineInstance.cSmSy==null?"暂无信息":medicineInstance.cSmSy}</p>
    </div>
</div>
<div class="detail_contain" style="margin-top:20px;">
    <div class="detail_title">
        <span class="line"></span>附件
        <input name="" type="button" value="下载选中" class="button" onclick="downloadAttach()" style="float: right;margin-right: 46px;"/>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="fjtable" align="center">
            <tr class="fjtitle">
                <td><input id="allselected" name="Fruit" type="checkbox" value="" onclick="allClick()"/> </td>
                <td>序号</td>
                <td>附件名称</td>
                <td>上传时间</td>
                <td>操作</td>
            </tr>
            <c:forEach items="${attachmentList}" var="bean" varStatus="status">
                <tr>
                    <td align="center"><input   id="${bean.rowId}" class="selectedCheck" name="Fruit" type="checkbox" value="${bean.rowId}" onclick="selectedOne('${bean.rowId}')"/> </td>
                    <td align="center">${status.index+1}</td>
                    <td align="center">${bean.fileName}</td>
                    <td align="center">${bean.uploadTime}</td>
                    <td align="center">
                            <%--   <c:if test="${(status.index)==0}">--%>
                           <%--<a  href="<%=basePath%>njsfy-index/fileDownload-attach.do?rowIdList=${bean.rowId}" data-lightbox="image-1" width="200" height="200" data-title="My caption">
                                <img  class="tImg" src="<%=basePath%>njsfy-index/fileDownload-attach.do?rowIdList=${bean.rowId}" width="40" height="40" />
                            </a>--%>
                                <button  class="button" onclick="yulan('${bean.rowId}')" >预览</button>
                               <%-- <a  href="<%=basePath%>/gx/njsfy_index/js/pdfjs/web/viewer.html?file=<%=basePath%>njsfy-index/fileDownload-attach.do?rowIdList=${bean.rowId}" >123</a>--%>

                      <%--  </c:if>--%>
                      <%--  <c:if test="${(status.index)!=0}">
                            123123
                        </c:if>
--%>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>

<script >
  /*  jQuery(document).ready(function($){
        $("img").click(function(){
           /!* alert("123");
            $('.tImg').lightbox();*!/
        });
    });*/
</script>
<script>
    lightbox.option({
        'fitImagesInViewport': false
    })
</script>




