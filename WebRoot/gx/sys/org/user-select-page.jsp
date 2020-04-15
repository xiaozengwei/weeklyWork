<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath %>">
<div class="bjui-pageHeader">
	<form id="pagerForm" data-toggle="ajaxsearch" action="<%=basePath%>sysorg/user-select-page.do" method="post">
		<input type="hidden" name="pageSize" value="${page.pageSize}">
		<input type="hidden" name="pageCurrent" value="${page.pageCurrent}">
		<input type="hidden" name="index" value="${index}">


		<div class="bjui-searchBar">
			<label>姓名/部门名称：</label><input type="text" value="${param.filter_LIKES_ext}" name="filter_LIKES_ext" size="10" />&nbsp;
			<button type="submit" class="btn-default" data-icon="search">查询</button>&nbsp;
			<%--<a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">清空查询</a>&nbsp;--%>
			<div class="pull-right">
				<button class="btn-blue " id="btn-user-select" type="button" style="margin-right:8px"  data-icon="check">确定</button>
			</div>
		</div>
	</form>
</div>
<div class="bjui-pageContent">
	<table data-toggle="tablefixed" id="layout-users-selected" data-width="100%">
		<thead>
		<tr>
			<th data-order-field="order">序号</th>
			<th data-order-field="orgName">姓名/部门名称</th>
			<th width="28">选择</th>

		</tr>
		</thead>
		<tbody>
		<%int count=1; %>
		<c:forEach items="${page.result}" var="org" varStatus="status">
			<tr>
				<td><%=count++ %></td>
				<td>${org.ext }</td>
				<td ><input type="checkbox" name="ids" data-toggle="icheck" value="{${org.roleId}: ${org.ext}}"></td>

			</tr>

		</c:forEach>

		</tbody>
	</table>
</div>

<%--<div class="bjui-pageFooter">--%>
	<%--<div class="pages">--%>
		<%--<span>每页&nbsp;</span>--%>
		<%--<div class="selectPagesize">--%>
			<%--<select data-toggle="selectpicker"--%>
					<%--data-toggle-change="changepagesize">--%>
				<%--<option value="10">10</option>--%>
				<%--<option value="15">15</option>--%>
				<%--<option value="20">20</option>--%>
				<%--<option value="25">25</option>--%>
			<%--</select>--%>
		<%--</div>--%>
		<%--<span>&nbsp;条，共 ${page.totalCount }条</span>--%>
	<%--</div>--%>
	<%--<div class="pagination-box" data-toggle="pagination" data-total="${page.totalCount }"--%>
		 <%--data-page-size="${page.pageSize }" data-page-current="${page.pageCurrent }"></div>--%>
<%--</div>--%>

<script>
    $(function(){


        //确定按钮
        $("#btn-user-select",$.CurrentDialog).on("click",function(){
            var select_opt = $(this).data("opt");//publish(普阅公文发布模块)/bringback(普通的选择带回)
            var users_selected_td = $(":checkbox:checked");
            var v_org_names ="";
            var v_org_ids = "";
            if(users_selected_td.length < 1){
                $(this).alertmsg('info', '请选择出席人员');
                return;
            }
            for(var i = 0;i < users_selected_td.length; i++) {
                var dept = users_selected_td[i];
                var val =   dept.value;
                val=val.replace("{","");

                val=val.replace("}","");
                var array = val.split(":");
                v_org_names+= array[1] +",";
                v_org_ids+= array[0] +",";
            }




            if(v_org_names.length >0 && v_org_names.indexOf(",") != -1){
                v_org_names = v_org_names.substring(0,v_org_names.length -1);
            }
            if(v_org_ids.length >0 && v_org_ids.indexOf(",") != -1){
                v_org_ids = v_org_ids.substring(0,v_org_ids.length -1);
            }
            $.CurrentNavtab.find(':input').each(function() {
                var $input = $(this);
                var name = $input.attr("name");
                if (name == "meetingArrangement[${index}].callUsersName") {
                    if($input.val()!=null&&!$input.val()==''){
                        $input.val($input.val()+','+v_org_names);
                    }else {
                        $input.val(v_org_names);
                    }
                }
                if (name == "meetingArrangement[${index}].callUsersId") {
                    $input.val(v_org_ids);
                }


            });


            $.CurrentDialog.dialog('closeCurrent');

        });









    });


</script>