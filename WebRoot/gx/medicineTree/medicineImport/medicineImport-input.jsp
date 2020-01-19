<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<base href="<%=basePath %>">
<div class="bjui-pageContent">
    <form action="<%=basePath%>njsfy-medicineImport/medicineImport-save.do" method="post" data-toggle="validate" data-reloadNavtab="true">
        <input type="hidden" name="rowId"  value="${medicineType.rowId}" >
        <table class="table table-condensed table-hover">
            <tbody>
            <tr>
                <td  align="center"><h3>药品添加</h3></td>
            </tr>
            <tr>
                <td>
                    <label class="control-label x90" style="width: 105px;">药品类别：</label>
                    <input type="text" name="medicineTypeName"  value="${medicineType.medicineTypeName}" data-rule="required" size="20">
                </td>
            </tr>
            <tr>
                <td>
                    <label class="control-label x90" style="width: 105px;">父级药品类别：</label>
                    <input type="hidden" name="medicineParentTypeId" value="${medicineType.medicineParentTypeId}">
                    <input type="text" name="medicineParentTypeName"  readonly="readonly" value="${medicineType.medicineParentTypeName}" data-toggle="lookup" data-url="<%=basePath %>njsfy-medicineImport/medicineImport-type-list.do"  data-title="父级药品类别:" >
                </td>
            </tr>
            </tbody>
        </table>
    </form>

</div>
<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close">关闭</button></li>
        <li><button type="submit" class="btn-default">保存</button></li>
    </ul>
</div>