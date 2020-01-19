<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<style>
   /* td {
        padding: 8px;
        line-height: 1.428571429;
        vertical-align: top;
        border-top: 0px solid #bfbfbf;
        
    }*/

    label{
        font-size: 13px;
       
    }

</style>
<script>
    //    function callback(json) {
    //        console.log(json.lastRowId)
    //        var tbBody=document.getElementById("tbBody")
    //        var list=json.lastRowId
    //        for(var i=0;i<list.length;i++){
    //            tbBody.removeChild(document.getElementById(list[i]))
    //        }
    //    }

    $(function () {
        //请求参数
        var list = {};
        //
        $.ajax({
            //请求方式
            type: "POST",
            //请求的媒体类型
            contentType: "application/json;charset=UTF-8",
            //请求地址
            url: "http://127.0.0.1/admin/list/",
            //数据，json字符串
            data: JSON.stringify(list),
            //请求成功
            success: function (result) {
                console.log(result);
            },
            //请求失败，包含具体的错误信息
            error: function (e) {
                console.log(e.status);
                console.log(e.responseText);
            }
        });
    });

    $(function () {
        var uploader = new plupload.Uploader({
            runtimes: 'html5,flash,silverlight,html4',
            //触发文件选择对话框的按钮，为那个元素id
            browse_button: 'pickfiles',
            //服务器端的上传页面地址
            url: '<%=basePath%>njsfy-medicineInstance/fileupload-attach.do?columnId=${columnId}',
            //swf文件，当需要使用swf方式进行上传时需要配置该参数
            flash_swf_url: '../js/Moxie.swf',
            //silverlight文件，当需要使用silverlight方式进行上传时需要配置该参数
            silverlight_xap_url: '../js/Moxie.xap',
            //是否可以在文件浏览对话框中选择多个文件
            multi_selection: true,
            filters: {
                mime_types: [ //只允许上传图片
                    {title: "video files", extensions: "png,jpg"}
                ],
                max_file_size: '100mb', //最大只能上传50mb的文件
                prevent_duplicates: true //不允许选取重复文件
            },
            init: {
                PostInit: function () {
                    document.getElementById('uploadfiles').onclick = function () {
                        uploader.start();
                        return false;
                    };
                },
                FilesAdded: function (up, files) {
                    plupload.each(files, function (file) {
                        document.getElementById('upload-file-list').value = file.name;
                    });
                },
                FileUploaded: function (up, file, response) {
                    console.log(JSON.parse(response.response).AttachEntity)
                    var user = JSON.parse(response.response).user
                    var AttachEntity = JSON.parse(response.response).AttachEntity
                    var tbBody = document.getElementById("tbBody")
                    var tr = document.createElement("tr")
                    tr.setAttribute("data-id", AttachEntity.rowId)
                    var text = null
                    for (var i = 0; i < 5; i++) {
                        var td = document.createElement("td")
                        td.setAttribute("align", "center")
                        if (i == 0) {
                            td.innerHTML = '<input type="checkbox" class="icheckbox_minimal-purple"  style="bottom: 0px;" data-toggle="icheck" name="ids" value=' + AttachEntity.rowId + '/>'
                        }
                        else if (i == 1) {
                            text = document.createTextNode(file.name);
                        } else if (i == 2) {
                            text = document.createTextNode(file.lastModifiedDate);
                        } else if (i == 3) {
                            text = document.createTextNode(user.userName);
                        } else {
                            text = document.createTextNode(file.type);
                        }
                        if (i != 0) {
                            td.appendChild(text)
                        }
                        tr.appendChild(td)
                    }
                    tbBody.appendChild(tr);
//                    $("#uploadfiles").bjuiajax('refreshlayout', { target:$("#tabelRe")});
//                    $("#uploadfiles").dialog('refresh')

                },
                Error: function (up, err) {
                    $.CurrentDialog.alertmsg("error", err.message);
                }
            }
        });

        uploader.init();

    })
</script>
<base href="<%=basePath %>">
<div class="bjui-pageContent">
    <c:set var="bol_a" scope="session" value="${bol_a}"/>
    <c:if test="${bol_a =='a'}">
    <form action="<%=basePath%>njsfy-medicineInstance/medicineInstance-save.do?columnId=${columnId}" method="post"
          data-toggle="validate" data-reloadNavtab="false">

        </c:if>
        <c:if test="${bol_a !='a'}">
        <form action="<%=basePath%>njsfy-medicineInstance/medicineInstance-save.do?columnId=${columnId}" method="post"
              data-toggle="validate" data-reloadNavtab="true">
            </c:if>
            <input type="hidden" name="rowId" value="${medicineInstance.rowId}">
            <table class="table table-condensed table-hover table1">
                <tbody>
                <tr>
                    <td style=" border: 0;">
                        <label class="control-label x90" style="width: 105px;">类别：</label>
                    </td>
                    <td style=" border: 0;">
                        <input type="hidden" name="medicineType"  value="${medicineInstance.medicineType}" >
                        <input type="text" name="medicineTypeName"  readonly="readonly" value="${medicineInstance.medicineTypeName}" data-toggle="lookup" data-url="<%=basePath %>njsfy-medicineInstance/lookup-medicineType-list.do"  size="20" data-title="请选择章节:" >
                    </td>
                    <td style=" border: 0;">
                        <label class="control-label x90" style="width: 105px;">药品名称：</label>
                    </td>
                    <td style=" border: 0;">
                        <input type="text" name="medicineName"  value="${medicineInstance.medicineName}" data-rule="required" size="20">
                    </td>
                </tr>

                <tr>
                    <td style=" border: 0;">
                        <label class="control-label x90" style="width: 105px;">药品规格：</label>
                    </td>
                    <td style=" border: 0;">
                        <input type="text" name="medicineGuige"  value="${medicineInstance.medicineGuige}" data-rule="required" size="20">
                    </td>
                    <td style=" border: 0;">
                        <label class="control-label x90" style="width: 105px;">价格：</label>
                    </td>
                    <td style=" border: 0;">
                        <input type="number" name="price"  value="${medicineInstance.price}" data-rule="required" size="20">
                    </td>
                    <td style=" border: 0;">
                        <label class="control-label x90" style="width: 105px;">单位：</label>
                    </td>
                    <td style=" border: 0;">
                        <input type="text" name="ext2" value="${medicineInstance.ext2}"
                               size="20">
                    </td>
                </tr>


                <tr>
                    <td style=" border: 0;">
                        <label class="control-label x90" style="width: 105px;">厂商：</label>
                    </td>
                    <td style=" border: 0;">
                        <input type="text" name="changShang"  value="${medicineInstance.changShang}" data-rule="required" size="20">
                    </td>
                    <td style=" border: 0;">
                        <label class="control-label x90" style="width: 105px;">药品所属目录：</label>
                    </td>
                    <td style=" border: 0;">
                        <input type="text" name="ypSsMl"  value="${medicineInstance.ypSsMl}" data-rule="required" size="20">
                    </td>
                </tr>
                <tr>
                    <td style=" border: 0;">
                        <label class="control-label x90" style="width: 105px;">警示：</label>
                    </td>
                    <td style=" border: 0;" colspan="5">
                        <textarea name="warn"  data-toggle="autoheight" style="width: 100%" >${medicineInstance.warn}</textarea>
                    </td>
                </tr>
                <tr >
                    <td style=" border: 0;">
                        <label class="control-label x90" style="width: 105px;">适应症：</label>
                    </td>
                    <td style=" border: 0;" colspan="5">
                        <textarea name="syz"  data-toggle="autoheight" style="width: 100%" >${medicineInstance.syz}</textarea>
                    </td>
                </tr>
                <tr >
                    <td style=" border: 0;">
                        <label class="control-label x90" style="width: 105px;">用法用量：</label>
                    </td>
                    <td style=" border: 0;" colspan="5">
                        <textarea name="yfyl"  data-toggle="autoheight" style="width: 100%">${medicineInstance.yfyl}</textarea>


                    </td>
                </tr>

                <tr>
                    <td style=" border: 0;">
                        <label class="control-label x90" style="width: 130px;">哺乳期安全等级：</label>
                    </td>
                    <td style=" border: 0;">
                        <select name="brqAqdj" data-toggle="selectpicker">
                            <option value="A" ${medicineInstance.brqAqdj eq 'A' ? 'selected="selected"':'' }>A</option>
                            <option value="B" ${medicineInstance.brqAqdj eq 'B' ? 'selected="selected"':'' }>B</option>
                            <option value="C" ${medicineInstance.brqAqdj eq 'C' ? 'selected="selected"':'' }>C</option>
                        </select>
                    </td>
                    <td style=" border: 0;">
                        <label class="control-label x90" style="width: 105px;">妊娠期危害分级：</label>
                    </td>
                    <td style=" border: 0;">
                        <select name="yqAqdj" data-toggle="selectpicker">
                            <option value="A" ${medicineInstance.yqAqdj eq 'A' ? 'selected="selected"':'' }>A</option>
                            <option value="B" ${medicineInstance.yqAqdj eq 'B' ? 'selected="selected"':'' }>B</option>
                            <option value="C" ${medicineInstance.yqAqdj eq 'C' ? 'selected="selected"':'' }>C</option>
                        </select>
                    </td>
                    <td style=" border: 0;">
                        <label class="control-label x90" style="width: 105px;">医保类别：</label>
                    </td>
                    <td style=" border: 0;">
                        <select name="ybType" data-toggle="selectpicker">
                            <option value="A" ${medicineInstance.ybType eq 'A' ? 'selected="selected"':'' }>A</option>
                            <option value="B" ${medicineInstance.ybType eq 'B' ? 'selected="selected"':'' }>B</option>
                            <option value="C" ${medicineInstance.ybType eq 'C' ? 'selected="selected"':'' }>C</option>
                        </select>
                    </td>


                </tr>
                <tr>
                    <td style=" border: 0;">
                        <label class="control-label x90" style="width: 105px;">是否高危药：</label>
                    </td>
                    <td style=" border: 0;">
                        <input type="radio" name="isGwy"  value="是"  ${medicineInstance.isGwy eq '是' ? 'checked="checked"':'' } data-toggle="icheck" data-label="是">
                        <input type="radio" name="isGwy"  value="否"  ${medicineInstance.isGwy eq '否' ? 'checked="checked"':'' } data-toggle="icheck" data-label="否">
                        <%--   <select name="isGwy" data-toggle="selectpicker">
                               <option value="是" ${medicineInstance.isGwy eq '是' ? 'selected="selected"':'' }>是</option>
                               <option value="否" ${medicineInstance.isGwy eq '否' ? 'selected="selected"':'' }>否</option>
                           </select>--%>
                    </td>
                    <td style=" border: 0;">
                        <label class="control-label x90" style="width: 105px;">是否基药：</label>
                    </td>
                    <td style=" border: 0;">
                        <input type="radio" name="isJy"  value="是"  ${medicineInstance.isJy eq '是' ? 'checked="checked"':'' }  data-toggle="icheck" data-label="是">
                        <input type="radio" name="isJy"  value="否"  ${medicineInstance.isJy eq '否' ? 'checked="checked"':'' }  data-toggle="icheck" data-label="否">
                        <%--  <select name="isJy" data-toggle="selectpicker">
                              <option value="是" ${medicineInstance.isJy eq '是' ? 'selected="selected"':'' }>是</option>
                              <option value="否" ${medicineInstance.isJy eq '否' ? 'selected="selected"':'' }>否</option>
                          </select>--%>
                    </td>
                    <td style=" border: 0;">
                        <label class="control-label x90" style="width: 105px;">是否皮试：</label>
                    </td>
                    <td style=" border: 0;">
                        <input type="radio" name="isPs"  value="是"  ${medicineInstance.isPs eq '是' ? 'checked="checked"':'' }  data-toggle="icheck" data-label="是">
                        <input type="radio" name="isPs"  value="否"  ${medicineInstance.isPs eq '否' ? 'checked="checked"':'' }  data-toggle="icheck" data-label="否">
                        <%--  <select name="isJy" data-toggle="selectpicker">
                              <option value="是" ${medicineInstance.isJy eq '是' ? 'selected="selected"':'' }>是</option>
                              <option value="否" ${medicineInstance.isJy eq '否' ? 'selected="selected"':'' }>否</option>
                          </select>--%>
                    </td>

                </tr>
                <tr >
                    <td style=" border: 0;" >
                        <label class="control-label x90" style="width: 105px;">特殊存储条件：</label>
                    </td>
                    <td style=" border: 0;" colspan="5">
                        <textarea name="tsCcTj"  data-toggle="autoheight" style="width: 100%">${medicineInstance.tsCcTj}</textarea>
                    </td>

                </tr>
                <tr>
                    <td style=" border: 0;">
                        <label class="control-label x90" style="width: 105px;">超说明使用：</label>
                    </td>
                    <td style=" border: 0;" colspan="5">
                        <textarea name="cSmSy"  data-toggle="autoheight" style="width: 100%">${medicineInstance.cSmSy}</textarea>
                    </td>
                </tr>

                <tr>
                    <td style=" border: 0;" id="columnArticleTitlePicForm" colspan="6">
                        <table width="90%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td style=" border: 0;"><label class="control-label x90" style="width: 105px;">文件名称：</label></td>
                                <td style=" border: 0;">
                                    <input id="upload-file-list" size="36" readonly="readonly"/>
                                    <button id="pickfiles" class="btn-default " data-icon="hand-pointer-o">浏览</button>
                                </td>
                                <td style=" border: 0;">
                                    <button id="uploadfiles" class="btn-blue" data-icon="upload">上传</button>
                                </td>
                                <td style=" border: 0;">
                                    <button type="button" class="btn-red"
                                            data-url="<%=basePath%>njsfy-medicineInstance/delete-attach.do"
                                            data-toggle="doajaxchecked" data-confirm-msg="确定要删除选中项吗？" data-icon="remove"
                                            data-idname="delids" data-group="ids">删除选中文件
                                    </button>
                                </td>
                                <td style=" border: 0;">
                                    <button type="button" class="btn-blue"
                                            data-url="<%=basePath%>njsfy-medicineInstance/fileDownload-attach.do"
                                            data-toggle="doexportchecked" data-confirm-msg="确定要下载吗？"
                                            data-icon="download" data-idname="delids" data-group="ids">下载选中文件
                                    </button>
                                </td>
                            </tr>
                        </table>
                        <table id="tabelRe" class="table table-bordered table-hover table-striped table-top">
                            <tbody id="tbBody">
                            <tr>
                                <td style=" border: 0;" width="5%" align="center"><input type="checkbox" class="checkboxCtrl"
                                                                     data-group="ids" data-toggle="icheck"></td>
                                <td style=" border: 0;" align="center" width="30%">文件名称</td>
                                <td style=" border: 0;" align="center" width="35%">上传时间</td>
                                <td style=" border: 0;" align="center" width="15%">上传人</td>
                                <td style=" border: 0;" align="center" width="10%">操作</td>
                            </tr>
                            <%--<c:forEach items="${fileRecordList}" var="fileRecord" varStatus="status">--%>
                            <%--<tr data-id="${fileRecord.rowId}">--%>
                            <%--<td style=" border: 0;" align="center"><input type="checkbox" name="ids" data-toggle="icheck" value="${fileRecord.rowId}"></td>--%>
                            <%--<td style=" border: 0;" align="center">${fileRecord.fileName }</td>--%>
                            <%--<td style=" border: 0;" align="center">${fileRecord.uploadTime}</td>--%>
                            <%--<td style=" border: 0;" align="center">${fileRecord.uploadUserName}</td>--%>
                            <%--<td style=" border: 0;" align="center">${fileRecord.fileType}</td>--%>
                            <%--</tr>--%>
                            <%--</c:forEach>--%>
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
        <li>
            <button type="button" class="btn-close">关闭</button>
        </li>
        <li>
            <button type="submit" class="btn-default">保存</button>
        </li>
    </ul>
</div>
<%--
<script type="text/javascript">
    var editorOption = {
        toolbars: [[
            'fullscreen',  '|', 'undo', 'redo', '|',
            'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', '|',
            'rowspacingtop', 'rowspacingbottom', 'lineheight', '|',
            'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',
            'directionalityltr', 'directionalityrtl', 'indent', '|',
            'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
            'link', 'unlink', 'anchor', '|', 'imagenone', 'imageleft', 'imageright', 'imagecenter', '|',
            'simpleupload', 'insertimage', 'emotion', 'scrawl',  'insertframe',   'pagebreak', 'template', 'background', '|',
            'horizontal', 'date', 'time', 'spechars', 'snapscreen', 'wordimage', '|',
            'inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow', 'deleterow', 'insertcol', 'deletecol', 'mergecells', 'mergeright', 'mergedown', 'splittocells', 'splittorows', 'splittocols', 'charts', '|',
            'searchreplace', 'drafts'
        ]],
        elementPathEnabled: false,
        charset:"utf-8"
        ,initialFrameWidth:920 //初始化编辑器宽度,默认1000
        ,initialFrameHeight:500 //初始化编辑器高度,默认320

    };
    var ue = new baidu.editor.ui.Editor(editorOption);
    ue.render("container");
    ue.ready(function() {
        ue.focus(true);
    });
</script>--%>
