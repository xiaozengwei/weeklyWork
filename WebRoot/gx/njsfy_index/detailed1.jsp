<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script src="<%=request.getContextPath()%>/gx/njsfy_index/js/jquery-1.7.2.min.js"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/gx/njsfy_index/js/lightbox-plus-jquery.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/gx/njsfy_index/js/jquery.lightbox.css" type="text/css"></link>


<link href="<%=request.getContextPath()%>/gx/njsfy_index/images/css.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/gx/njsfy_index/images/demo.css" type="text/css">

<link rel="stylesheet" href="<%=request.getContextPath()%>/gx/njsfy_index/images/zTreeStyle.css" type="text/css">
<script src="<%=request.getContextPath()%>/gx/njsfy_index/js/jquery.ztree.core.js"></script>



<style>
    ul.ztree {
        margin-left: 0px;
        margin-top: -2px;
        border: 1px solid #617775;
        background: #f0f6e4;
        width: 270px;
        height: 550px;
        overflow-y: scroll;
        overflow-x: auto;
    }
</style>

<script>
    var rowIdList=new Array();
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
<div class="detail">
    <div class="drugxx">
        <div class="drugname">
            <div class="drug">${medicineInstance.medicineName}</div>
            <div class="drugfirm">厂商：${medicineInstance.changShang}</div>
        </div>
        <div class="drugprice">

            <div class="stock">
                <div class="detail_img"><img src="<%=request.getContextPath()%>/gx/njsfy_index/images/img_stock.png" width="52" height="52" /></div>
                <div class="detail_word">
                    <div><span class="font18">156</span> 盒
                    </div>
                    <div>库存量</div>
                </div>
            </div>
            <div class="price">
                <div class="detail_img"><img src="<%=request.getContextPath()%>/gx/njsfy_index/images/img_price.png" width="52" height="52" /></div>
                <div class="detail_word">
                    <div><span class="font18">${medicineInstance.price}</span> 元</div>
                    <div>价格</div>
                </div>
            </div>
        </div>
        <div class="category">
            <span class="lactation_z pregnancy">妊娠期危害分级：${medicineInstance.brqAqdj}</span>
            <span class="lactation_z lactation">哺乳期安全等级：${medicineInstance.yqAqdj}</span>
            <c:if test="${medicineInstance.isJy=='是'}">
                <span class="lactation_z medicine">基药</span>
            </c:if>
            <c:if test="${medicineInstance.isGwy=='是'}">
                <span class="lactation_z risk">高危药品</span>
            </c:if>
            <span class="lactation_z expense">医保类型：${medicineInstance.ybType}</span>
        </div>
    </div>
</div>
<div class="content">
    <div class="detail_left">
        <div class="content_wrap">
            <div class="zTreeDemoBackground left">
                <ul id="treeDemo" class="ztree"></ul>
            </div>
        </div>
    </div>
    <div class="detail_right">
        <div class="detail_contain">
            <div class="detail_title">
                <span class="line"></span>黑框警示
                <p class="explain">${medicineInstance.warn}</p>
            </div>
            <div class="detail_title">
                <span class="line"></span>适应症
                <p class="explain">${medicineInstance.syz}</p>
            </div>
            <div class="detail_title">
                <span class="line"></span>用法用量
                <p class="explain">${medicineInstance.yfyl}</p>
            </div>
            <div class="detail_title">
                <span class="line"></span>特殊存储条件
                <p class="explain">${medicineInstance.tsCcTj}</p>
            </div>
            <div class="detail_title">
                <span class="line"></span>超说明书使用
                <p class="explain">${medicineInstance.cSmSy}</p>
            </div>
        </div>
        <div class="detail_contain" style="margin-top:20px;">
            <div class="detail_title">
                <span class="line"></span>附件
                <input name="" type="button" value="下载选中" class="button" onclick="downloadAttach()" style="float: right;"/>
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
                                <a  href="<%=basePath%>njsfy-index/fileDownload-attach.do?rowIdList=${bean.rowId}" data-lightbox="image-1" data-title="My caption">
                                    <img  src="<%=basePath%>njsfy-index/fileDownload-attach.do?rowIdList=${bean.rowId}" width="40" height="40" />
                                </a>

                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
</div>

<script>
    var jsont=null;
    $(function(){

        $.ajax({
            url:'<%=basePath%>njsfy-index/medicineTree-tree.do',
            type:'get',
            async:false,
            cache:false,
            dataType:'json',
            success:function(json){
                jsont = json;
                console.log(jsont.length)
            }
        });
    });
</script>
<SCRIPT type="text/javascript">
    <!--
    var setting = {
        data: {
            key: {
                title:"title"
            },
            simpleData: {
                enable: true
            }
        },
        callback: {
            beforeClick: beforeClick,
            onClick: onClick
        }
    };

    /*  var zNodes =[
     { id:1, pId:0, name:"普通的父节点", t:"我很普通，随便点我吧", open:true},
     { id:11, pId:1, name:"叶子节点 - 1", t:"我很普通，随便点我吧"},
     { id:12, pId:1, name:"叶子节点 - 2", t:"我很普通，随便点我吧"},
     { id:13, pId:1, name:"叶子节点 - 3", t:"我很普通，随便点我吧"},
     { id:2, pId:0, name:"NB的父节点", t:"点我可以，但是不能点我的子节点，有本事点一个你试试看？", open:true},
     { id:21, pId:2, name:"叶子节点2 - 1", t:"你哪个单位的？敢随便点我？小心点儿..", click:false},
     { id:22, pId:2, name:"叶子节点2 - 2", t:"我有老爸罩着呢，点击我的小心点儿..", click:false},
     { id:23, pId:2, name:"叶子节点2 - 3", t:"好歹我也是个领导，别普通群众就来点击我..", click:false},
     { id:3, pId:0, name:"郁闷的父节点", t:"别点我，我好害怕...我的子节点随便点吧...", open:true, click:false },
     { id:31, pId:3, name:"叶子节点3 - 1", t:"唉，随便点我吧"},
     { id:32, pId:3, name:"叶子节点3 - 2", t:"唉，随便点我吧"},
     { id:33, pId:3, name:"叶子节点3 - 3", t:"唉，随便点我吧"}
     ];*/

    var log, className = "dark";
    function beforeClick(treeId, treeNode, clickFlag) {
        className = (className === "dark" ? "":"dark");
        showLog("[ "+getTime()+" beforeClick ]&nbsp;&nbsp;" + treeNode.name );
        return (treeNode.click != false);
    }
    function onClick(event, treeId, treeNode, clickFlag) {

        /*  console.log("treeNode：",treeNode.id);
         $.ajax({
         url:"<%=basePath%>njsfy-index/medicine-instance.do?rowId="+treeNode.id,
         type:'get',
         async:false,
         cache:false,
         dataType:'json',
         success:function(json){
         $("#div1").load("/try/ajax/demo_test.txt");
         console.log(json)
         }
         });*/
        location.href="<%=basePath%>njsfy-index/medicine-instance.do?rowId="+treeNode.id;

    }
    function showLog(str) {
        if (!log) log = $("#log");
        log.append("<li class='"+className+"'>"+str+"</li>");
        if(log.children("li").length > 8) {
            log.get(0).removeChild(log.children("li")[0]);
        }
    }
    function getTime() {
        var now= new Date(),
            h=now.getHours(),
            m=now.getMinutes(),
            s=now.getSeconds();
        return (h+":"+m+":"+s);
    }

    $(document).ready(function(){
        $.fn.zTree.init($("#treeDemo"), setting, jsont);
    });

</SCRIPT>

<script >
    jQuery(document).ready(function($){
        $("img").click(function(){
            lightbox();
        });
    });
</script>
