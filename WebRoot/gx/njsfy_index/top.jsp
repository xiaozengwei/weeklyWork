<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<script src="<%=request.getContextPath()%>/gx/BJUI/js/jquery-1.7.2.min.js"></script>

<link href="<%=request.getContextPath()%>/gx/njsfy_index/images/css.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/gx/njsfy_index/images/demo.css" type="text/css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/gx/njsfy_index/images/zTreeStyle.css" type="text/css">
<script src="<%=request.getContextPath()%>/gx/njsfy_index/js/jquery.ztree.core.js"></script>
<%--<link rel="stylesheet" href="<%=request.getContextPath()%>/gx/njsfy_index/js/jquery.lightbox.css" type="text/css"></link>
<script type="text/javascript" src="<%=request.getContextPath()%>/gx/njsfy_index/js/jquery.lightbox.min.js"></script>--%>
<style>
    /*  ul.ztree {
          margin-left: 0px;
          margin-top: -2px;
          border: 1px solid #617775;
          background: #f0f6e4;
          width: 270px;
          height: 500px;
          overflow-y: scroll;
          overflow-x: auto;
      }*/
</style>
<script>
    /*  //图片放大预览
     jQuery(document).ready(function($){
     $('.lightbox').lightbox();
     });*/
</script>
<script>
    var rowIdList = new Array();
    function allClick() {
        var selectedCheckList = $(".selectedCheck");
        for (var i = 0; i < selectedCheckList.length; i++) {
            if ($("#allselected").is(':checked')) {
                $(selectedCheckList[i]).attr("checked", true);
                rowIdList.push($(selectedCheckList[i]).val());
            } else {
                $(selectedCheckList[i]).attr("checked", false);
                rowIdList.length = 0;
            }
        }
    }
    function selectedOne(rowId) {

        if ($("#" + rowId).is(':checked')) {
            $("#" + rowId).attr("checked", true);
            rowIdList.push($("#" + rowId).val());
        } else {
            $("#" + rowId).attr("checked", false);
            var index = rowIdList.indexOf($("#" + rowId).val());
            if (index > -1) {
                rowIdList.splice(index, 1);
            }

        }
    }
    function downloadAttach() {
        if (rowIdList.length > 0) {
            location.href = "<%=basePath%>njsfy-index/fileDownload-attach.do?rowIdList=" + rowIdList;
        }

    }
    /* function lookAttach(rowId) {
     location.href="<%=basePath%>njsfy-index/fileDownload-attach.do?rowIdList="+rowId;

     }*/
</script>

<!-- for doc end -->
<div class="detail">
    <div class="drugxx">
        <div class="drugname">
            <div class="drug">${medicineInstance.medicineName}
                <c:if test="${medicineInstance.medicineGuige!=null}">
                    (${medicineInstance.medicineGuige})
                </c:if>
                </div>
            <div class="drugfirm">厂商：${medicineInstance.changShang}</div>
        </div>
        <div class="drugprice">

            <div class="stock">
                <div class="detail_img"><img src="<%=request.getContextPath()%>/gx/njsfy_index/images/img_stock.png"
                                             width="52" height="52"/></div>
                <div class="detail_word">
                    <div><span class="font18">156</span> 盒
                    </div>
                    <div>库存量</div>
                </div>
            </div>
            <div class="price">
                <div class="detail_img"><img src="<%=request.getContextPath()%>/gx/njsfy_index/images/img_price.png"
                                             width="52" height="52"/></div>
                <div class="detail_word">
                    <div><span class="font18">${medicineInstance.price}</span> 元</div>
                    <div>价格</div>
                </div>
            </div>
        </div>
        <div class="category">
            <span class="lactation_z pregnancy">妊娠期危害等级：${medicineInstance.brqAqdj}</span>
            <span class="lactation_z expense">哺乳期危险等级：${medicineInstance.yqAqdj}</span>
            <span class="lactation_z lactation">医保类型：${medicineInstance.ybType}</span>
            <%-- <span class="lactation_z lactation">是否皮试：${medicineInstance.isPs==null}</span>--%>

            <c:if test="${medicineInstance.isJy=='是'}">
                <span class="lactation_z medicine" style="background: green;">基药</span>
            </c:if>
            <c:if test="${medicineInstance.isGwy=='是'}">
                <span class="lactation_z risk" style="background: red;">高危药品</span>
            </c:if>
            <c:if test="${medicineInstance.isPs=='是'}">
                <span class="lactation_z risk" style="">需要皮试</span>
            </c:if>
        </div>
    </div>
</div>





