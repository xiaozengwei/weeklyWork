<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%
    String path = request.getContextPath();
    String basePath = request.getContextPath()+"/";
%>
<style>
    .redbg{  display:inline-block;width:15px; height:15px; margin-top:5px; cursor: pointer;}
    .greenbg{ background: #090; display:inline-block;width:15px; height:15px; margin-top:5px;  cursor: pointer;}
</style>
<base href="<%=basePath %>">
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="<%=basePath%>notice/select-meetingroom.do?startTime=${sTime}&endTime=${eTime}" method="post">
        <input type="hidden" name="pageSize" value="${page.pageSize}">
        <input type="hidden" name="pageCurrent" value="${page.pageCurrent}">
        <input type="hidden" id="sTime" name="sTime" value="${sTime}"/>
        <input type="hidden" id="eTime" name="eTime" value="${eTime}"/>
        <div class="bjui-searchBar">
            <table class="table table-bordered " data-selected-multi="true">
                <tr>
                    <td class="searchTitle" width="20%"  align="center">日期</td>
                    <td width="30%">
                        <select name="filter_EQS_aYear" data-toggle="selectpicker">
                            <c:forEach items="${yearList}" var="y">
                                <option value="${y}" ${filter_EQS_aYear eq y?'selected="selected"':''}>${y}</option>
                            </c:forEach>
                        </select>年
                        <select name="filter_EQS_aWeek" data-toggle="selectpicker">
                            <c:forEach items="${weekList}" var="w">
                                <option value="${w}" ${filter_EQS_aWeek eq w?'selected="selected"':''} ${wk eq w?'selected="selected"':''}>${w}</option>
                            </c:forEach>
                        </select> 周
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center"> <button type="submit" class="btn-default" data-icon="search">查询</button>&nbsp;
                        <a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">清空查询</a></td>
                </tr>
            </table>
        </div>
        <%--<div class="bjui-searchBar">
            <table class="table table-bordered " data-selected-multi="true">
                <tr>
                    <td class="searchTitle" width="20%"  align="center">日期</td>
                    <td width="30%">
                        &lt;%&ndash;<select name="filter_EQS_CYear" data-toggle="selectpicker">
                            <option value="2018">2018</option>
                            <option value="2017">2017</option>
                        </select>&ndash;%&gt;
                            <input type="text" name="filter_EQS_CYear" value="${param.filter_EQS_CYear}"/>年
                        &lt;%&ndash;<select name="filter_EQS_CWeek" data-toggle="selectpicker">
                            <option value="8">8</option>
                            <option value="9">9</option>
                        </select>&ndash;%&gt; 周
                    </td>
                    <td class="searchTitle" width="20%"  align="center">办公地点</td>
                    <td>
                        <select name="" data-toggle="selectpicker">
                            <option value="">全部</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="searchTitle"  align="center">会议室</td>
                    <td>
                        <select name="" data-toggle="selectpicker">
                            <option value="">全部</option>
                        </select>
                    </td>
                    <td colspan="2" align="center"> <button type="submit" class="btn-default" data-icon="search">查询</button>&nbsp;
                        <a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">清空查询</a></td>
                </tr>
            </table>
        </div>--%>

    </form>
</div>
<div class="bjui-pageContent" id="outdiv">
    <div style="padding:5px 0px; float:left;"><%--<button type="submit" class="btn-default" data-icon="check-circle">确定</button>--%>
        <%--<input type="checkbox" name="lookupType" value="1" data-toggle="icheck" data-label="追加" checked>--%>
        <%--<button type="button" class="btn-blue" data-toggle="lookupback" data-lookupid="ids" data-warn="请至少选择一个地点" data-icon="check-square-o">确定</button>--%>
    </div>
    <div style="padding:5px 0px;  float:right; line-height:30px "><span class="greenbg"></span> 已申请会议 <span class="redbg"></span> </div>
    <table class="table table-bordered" data-selected-multi="true" id="metTab">
        <thead>
        <tr>
            <th  align="center" width="3%"></th>
            <th align="center" >会议室</th>
            <th align="center" width="8%">时间</th>
            <c:forEach items="${dateList}" var="dt">
                <th align="center" width="11%">${dt}</th>
            </c:forEach>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${meetList}" var="meet">
            <tr>
                <td rowspan="2" align="center"><input type="radio" name="ids" data-toggle="icheck" value="{meetingRoomName:'${meet.meetingRoomName}'}"></td>
                <td rowspan="2" align="center">${meet.meetingRoomName}</td>

                <td align="center">上午</td>
                <td align="center" onmouseover="javascript:show('${meet.meetingRoomName}',this,'m');" onmouseout=hide(this)>${meet.MMonday eq '1'?'<div id="te"><span class="greenbg" title=""></span></div>':''}${meet.MMonday eq '2'?'<div><span class="redbg"></span></div>':''}</td>
                <td align="center" onmouseover="javascript:show('${meet.meetingRoomName}',this,'m');" onmouseout=hide(this)>${meet.MTuesday eq '1'?'<div id="te1"><span class="greenbg"></span></div>':''}${meet.MTuesday eq '2'?'<div><span class="redbg"></span></div>':''}</td>
                <td align="center" onmouseover="javascript:show('${meet.meetingRoomName}',this,'m');" onmouseout=hide(this)>${meet.MWednesday eq '1'?'<div><span class="greenbg"></span></div>':''}${meet.MWednesday eq '2'?'<div><span class="redbg"></span></div>':''}</td>
                <td align="center" onmouseover="javascript:show('${meet.meetingRoomName}',this,'m');" onmouseout=hide(this)>${meet.MThursday eq '1'?'<div><span class="greenbg"></span></div>':''}${meet.MThursday eq '2'?'<div><span class="redbg"></span></div>':''}</td>
                <td align="center" onmouseover="javascript:show('${meet.meetingRoomName}',this,'m');" onmouseout=hide(this)>${meet.MFriday eq '1'?'<div><span class="greenbg"></span></div>':''}${meet.MFriday eq '2'?'<div><span class="redbg"></span></div>':''}</td>
                <td align="center" onmouseover="javascript:show('${meet.meetingRoomName}',this,'m');" onmouseout=hide(this)>${meet.MSaturday eq '1'?'<div><span class="greenbg"></span></div>':''}${meet.MSaturday eq '2'?'<div><span class="redbg"></span></div>':''}</td>
                <td align="center" onmouseover="javascript:show('${meet.meetingRoomName}',this,'m');" onmouseout=hide(this)>${meet.MSunday eq '1'?'<div><span class="greenbg"></span></div>':''}${meet.MSunday eq '2'?'<div><span class="redbg"></span></div>':''}</td>

            </tr>
            <tr>
                <td align="center">下午</td>
                <td align="center" onmouseover="javascript:show('${meet.meetingRoomName}',this,'a');" onmouseout=hide(this)>${meet.AMonday eq '1'?'<div><span class="greenbg"></span></div>':''}${meet.AMonday eq '2'?'<div><span class="redbg"></span></div>':''}</td>
                <td align="center" onmouseover="javascript:show('${meet.meetingRoomName}',this,'a');" onmouseout=hide(this)>${meet.ATuesday eq '1'?'<div><span class="greenbg"></span></div>':''}${meet.ATuesday eq '2'?'<div><span class="redbg"></span></div>':''}</td>
                <td align="center" onmouseover="javascript:show('${meet.meetingRoomName}',this,'a');" onmouseout=hide(this)>${meet.AWednesday eq '1'?'<div><span class="greenbg"></span></div>':''}${meet.AWednesday eq '2'?'<div><span class="redbg"></span></div>':''}</td>
                <td align="center" onmouseover="javascript:show('${meet.meetingRoomName}',this,'a');" onmouseout=hide(this)>${meet.AThursday eq '1'?'<div><span class="greenbg"></span></div>':''}${meet.AThursday eq '2'?'<div><span class="redbg"></span></div>':''}</td>
                <td align="center" onmouseover="javascript:show('${meet.meetingRoomName}',this,'a');" onmouseout=hide(this)>${meet.AFriday eq '1'?'<div><span class="greenbg"></span></div>':''}${meet.AFriday eq '2'?'<div><span class="redbg"></span></div>':''}</td>
                <td align="center" onmouseover="javascript:show('${meet.meetingRoomName}',this,'a');" onmouseout=hide(this)>${meet.ASaturday eq '1'?'<div><span class="greenbg"></span></div>':''}${meet.ASaturday eq '2'?'<div><span class="redbg"></span></div>':''}</td>
                <td align="center" onmouseover="javascript:show('${meet.meetingRoomName}',this,'a');" onmouseout=hide(this)>${meet.ASunday eq '1'?'<div><span class="greenbg"></span></div>':''}${meet.ASunday eq '2'?'<div><span class="redbg"></span></div>':''}</td>

            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div   id="myMeetDiv"   style="position:absolute;display:none;">
        <table width="240px" height="101px" border="0" cellpadding="0" cellspacing="0" style="border:1px solid #e5973e; border-collapse:collapse; "  bgcolor="#DFF8FF">
            <tr  >
                <td align="left" class="xxtitle"><span class="hytitle">主题：</span><span id="zt"></span></td>

            <%--<tr >--%>
                <%--<td align="left" class="xxtitle"><span class="hytitle">申请人：</span><span id="sqr"></span></td>--%>

            <%--</tr>--%>
            <tr  >
                <td align="left" class="xxtitle"><span class="hytitle">时间：</span><span id="sj"></span></td>

            </tr>
        </table>

    </div>
    <div style="padding:5px 0px; width:100%; text-align:center;"><button type="button" class="btn-blue" data-toggle="lookupback" data-lookupid="ids" data-warn="请至少选择一个地点" data-icon="check-square-o">确定</button></div>
</div>
<script>



    function show(metname,obj,dat) {
        var fg=null;
        var t = null;
        var time = null;
        var test = document.getElementsByTagName('td')[obj.cellIndex];
        if (dat == "m") {
            t = $("#metTab",$.CurrentDialog).find("tr").eq(0).find("th").eq(obj.cellIndex).text();
        }else if(dat=="a"){
            t = $("#metTab",$.CurrentDialog).find("tr").eq(0).find("th").eq(obj.cellIndex+2).text();
        }
        time = t.substring(0,t.length-3);
        $.ajax({
            async : false,
            type: 'POST',
            url:'<%=basePath%>notice/meet-main.do?dataTime='+time+"&meetName="+encodeURIComponent(metname)+"&dateType="+dat,
            dataType: "json",
            cache: false,
            error : function(data,XMLHttpRequest, textStatus, errorThrown) {

            },
            success: function(data) {
                fg= data.title;
                var title = data.title;
                var userName = data.user;
                var start = data.start;
                var end = data.end;
                document.getElementById("zt").innerHTML=title;
//                document.getElementById("sqr").innerHTML=userName;
                document.getElementById("sj").innerHTML="从"+start+"到"+end;
            }
        })
        var objDiv = $("#myMeetDiv",$.CurrentDialog);

        var s = $("#outdiv",$.CurrentDialog).scrollTop();
        var X = event.clientX;
        var Y = event.clientY-230+s;
//        var X = objDiv.offset().top;
//        var Y = objDiv.offset().left;
        if(fg!=""){
            $(objDiv).css("display","block");
            $(objDiv).css("left", X+"px");

            $(objDiv).css("top", Y+"px");
            $(objDiv).css("background-color","#fae6b0");

            // console.log("X="+$("#outdiv",$.CurrentDialog).scrollTop());


        }

    }

    function hide(obj) {

        var objDiv = $("#myMeetDiv",$.CurrentDialog);

        $(objDiv).css("display", "none");

    }

    $('input[name="ids"]').on('ifChanged', function(e) {
        var checked = $(this).is(':checked'), val = $(this).val();
        var start = $("#sTime",$.CurrentDialog).val();
        var end = $("#eTime",$.CurrentDialog).val();
        if(start==''||end==""){
//            $(this).alertmsg('info', '请选择有效时间段！', {displayMode:'slide', displayPosition:'topcenter', okName:'确定', title:'错误提示'});
//            var rad = $("input[name=ids]");
//            rad.iCheck('uncheck');
        }else {
            if (checked)
                $.ajax({
                    async: false,
                    type: 'POST',
                    url: '<%=basePath%>notice/find-used-meet.do?start=' + start + "&meetName=" + encodeURIComponent(val) + "&end=" + end,
                    dataType: "json",
                    cache: false,
                    error: function (data, XMLHttpRequest, textStatus, errorThrown) {

                    },
                    success: function (data) {
                        var flag = data.flag;
                        if (flag == "1") {

                        } else {
                            $(this).alertmsg('info', '当前时间段已有会议室安排，请重新选择！', {displayMode:'slide', displayPosition:'topcenter', okName:'确定', title:'错误提示'});
                            var rad = $("input[name=ids]");
                            rad.iCheck('uncheck');
                        }
                    }
                })
        }
    })

    /**
     * 隐藏alert提示窗口的网页地址
     * */
    var wAlert = window.alert;
    window.alert = function (message) {
        try {
            var iframe = document.createElement("IFRAME");
            iframe.style.display = "none";
            iframe.setAttribute("src", 'data:text/plain,');
            document.documentElement.appendChild(iframe);
            var alertFrame = window.frames[0];
            var iwindow = alertFrame.window;
            if (iwindow == undefined) {
                iwindow = alertFrame.contentWindow;
            }
            iwindow.alert(message);
            iframe.parentNode.removeChild(iframe);
        }
        catch (exc) {
            return wAlert(message);
        }
    }



</script>