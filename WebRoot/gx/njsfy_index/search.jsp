<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>南京市妇幼</title>
    <script type="text/javascript" src="<%=request.getContextPath()%>/gx/njsfy_index/js/jquery-1.7.2.min.js"></script>
    <link href="<%=request.getContextPath()%>/gx/njsfy_index/images/css.css" rel="stylesheet">
</head>
<style>
    .selected{  font-weight:bold; color:#fff; background:#739d39;}

</style>
<script type="text/javascript">
    function getMedicineInstance(rowId) {
        window.open("<%=basePath%>njsfy-index/medicine-instance.do?rowId="+rowId);
      /*  location.href="<%=basePath%>njsfy-index/medicine-instance.do?rowId="+rowId;*/
    }
    function getChangShangMedicine(changShangName) {
        /*window.open("<%=basePath%>njsfy-index/medicine-changshang-instance.do?changShangName="+changShangName);*/
        window.open("<%=basePath%>njsfy-index/home.do?changShangName="+changShangName);

    }
    function getYqAqdjMedicine(yqAqdj) {
        window.open("<%=basePath%>njsfy-index/home.do?yqAqdj="+yqAqdj);

    }
    function change1() {
        $(" #two2 ").val("")
        $(" #three3 ").val("")

    }
    function change2() {
        $(" #one1 ").val("")
        $(" #three3 ").val("")
    }
    function change3() {
        $(" #two2 ").val("")
        $(" #one1 ").val("")
    }

    $(function(){
        $(".bodys p").not(":first").hide();
        $(".searchbox ul li").mouseover(function(){
            var index = $(this).index();
            if(index==0){
                $(this).find("a").addClass("style1");
                $("li").eq(1).find("a").removeClass("style2");
                $("li").eq(2).find("a").removeClass("style3");
                $("li").eq(3).find("a").removeClass("style4");

            }
            if(index==1){
                $(this).find("a").addClass("style2");
                $("li").eq(0).find("a").removeClass("style1");
                $("li").eq(2).find("a").removeClass("style3");
                $("li").eq(3).find("a").removeClass("style4");

            }
            if(index==2){
                $(this).find("a").addClass("style3");
                $("li").eq(0).find("a").removeClass("style1");
                $("li").eq(1).find("a").removeClass("style2");
                $("li").eq(3).find("a").removeClass("style4");

            }

            var index=$(this).index();
            $(".bodys p").eq(index).show().siblings().hide();
        });
    });

</script>
<body>
<div class="detail">
    <!--查询-->
    <div class="searchbox" style="padding-top:50px">
        <ul class="border1">
            <li><a href="#" class="style1">药品名称</a></li>
            <li><a href="#">用量</a></li>
            <li><a href="#">适应症</a></li>
        </ul>
        <div class="bodys">
            <form action="<%=basePath%>njsfy-index/home.do" method="post">
                <p>
                    <input type="text" onchange="change1()" name="searchMedicine" value="" id="one1" class="one" placeholder="如：阿司匹林" />
                    <button type="submit" class="one1"><img src="<%=request.getContextPath()%>/gx/njsfy_index/images/img_search.png" align="absmiddle" width="38" height="38" />  查询</button>
                </p>
                <p>
                    <input type="text" onchange="change2()" name="searchYl" value="" id="two2" class="two" placeholder="如：一日一次" />
                    <button type="submit" class="two2"><img src="<%=request.getContextPath()%>/gx/njsfy_index/images/img_search.png" align="absmiddle" width="38" height="38" />  查询</button>
                </p>
                <p>
                    <input type="text" onchange="change3()" name="searchSyz" value="" id="three3" class="three" placeholder="如：感冒" />
                    <button type="submit" class="three3 "><img src="<%=request.getContextPath()%>/gx/njsfy_index/images/img_search.png" align="absmiddle" width="38" height="38" />  查询</button>
                </p>


            </form>
        </div>
    </div>
    <!--查询-->
</div>
<!--列表-->
<div class="content">
    <div class="searchC">
        <div class="result">
            <div class="resulttitle"><img src="<%=request.getContextPath()%>/gx/njsfy_index/images/img_searchs.png" width="30" height="30" align="absmiddle" /> 查询结果</div>


            <div class="resultnumber">搜索到符合 <span class="red">${serachName}</span> 的结果约<span class="red">${count}</span>条</div>
        </div>
        <c:set var="bol" scope="session" value="${count}"/>
        <c:if test="${bol !=0}">
            <!--列表内容-->
            <div class="resulttable" style="clear:both">
                <ul class="list">
                    <c:if test="${bolC=='bol'}">
                        <c:forEach items="${medicineInstanceList}" var="bean" varStatus="status">
                            <li onclick="getChangShangMedicine('${bean.changShang}')">
                                <div >
                                    <h3 class="resultlink" ><a  >${bean.changShang} </a> </h3>
                                </div>
                                <div class="fr"> </div>
                            </li>
                        </c:forEach>
                    </c:if>
                    <c:if test="${bolAnQuan=='bol'}">
                        <c:forEach items="${medicineInstanceList}" var="bean" varStatus="status">
                            <li onclick="getYqAqdjMedicine('${bean.yqAqdj}')">
                                <div >
                                    <h3 class="resultlink" ><a  >哺乳期危险等级</a> </h3>
                                    <p> <b>哺乳期危险等级：</b>${bean.yqAqdj}</p>
                                </div>
                                <div class="fr"> </div>
                            </li>
                        </c:forEach>
                    </c:if>
                    <c:if test="${bolC!='bol' && bolAnQuan!='bol'}">
                        <c:forEach items="${medicineInstanceList}" var="bean" varStatus="status">
                            <li onclick="getMedicineInstance('${bean.rowId}')">
                                <div >
                                    <h3 class="resultlink" ><a  >${bean.changShang} </a> </h3>
                                    <p> <b>通用名：</b>${bean.medicineName}&nbsp;&nbsp;&nbsp;&nbsp; <b></b> <br/>
                                        <b>适应症：</b>${bean.syz}</p>
                                </div>
                                <div class="fr"> </div>
                            </li>
                        </c:forEach>
                    </c:if>

                </ul>
                <br/>
            </div>
            <!--分页-->
            <div class="i20">

            </div>
            <c:if test="${bolC!='bol' && bolAnQuan!='bol'}">
                <!--列表内容-->
                <div class="pager">
                    <a href="<%=basePath%>njsfy-index/chage-number.do?number=1"> &lt;&lt; </a>
                    <a href="<%=basePath%>njsfy-index/chage-number.do?number=${curNumber}&bolL=bolL"> &lt; </a>
                        <%-- <h1>${curNumber}</h1>--%>
                    <c:forEach var="i" begin="1" end="${pageAllCount}">
                        <c:if test="${(curNumber) ==i}">
                            <a href="<%=basePath%>njsfy-index/chage-number.do?number=${i}&bolNum=bol" class="selected"> ${i} </a>
                        </c:if>
                        <c:if test="${(curNumber) !=i}">
                            <a href="<%=basePath%>njsfy-index/chage-number.do?number=${i}&bolNum=bol"> ${i} </a>
                        </c:if>
                    </c:forEach>
                    <a href="<%=basePath%>njsfy-index/chage-number.do?number=${nextNumber}&bolR=bolR" > &gt;</a>
                    <a href="<%=basePath%>njsfy-index/chage-number.do?number=${pageAllCount}&bolRR=bolRR"> &gt;&gt; </a>
                </div>

            </c:if>

        </c:if>
        <c:if test="${bol ==0}">

        </c:if>


    </div>
</div>
</body>
</html>
