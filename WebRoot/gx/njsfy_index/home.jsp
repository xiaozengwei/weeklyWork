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
    <script type="text/javascript">
        function medicineTypeShuoYing() {
            window.open("<%=basePath%>njsfy-index/medicineType-ShuoYing.do");
           /*location.href="<%=basePath%>njsfy-index/medicineType-ShuoYing.do";*/
        }
        function shiyingzheng() {
            window.open("<%=basePath%>njsfy-index/home.do?bolS=bol");
            /*location.href="<%=basePath%>njsfy-index/home.do?bolS=bol";*/
        }
        function changShang() {
            window.open("<%=basePath%>njsfy-index/home.do?bolC=bol");
            /*location.href="<%=basePath%>njsfy-index/home.do?bolS=bol";*/
        }
        function yunQiAnQuan() {
            window.open("<%=basePath%>njsfy-index/home.do?bolAnQuan=bol");
        }
        function gaoWei() {
            window.open("<%=basePath%>njsfy-index/home.do?bolGaoWei=bol");
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
</head>
<body>
<div class="searchbg">
    <div class="searchbox_bg">
        <!--查询-->
        <div class="searchbox">
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
</div>
<div class="content">
    <div class="contentrow">
        <div class="contentdiv" onclick="medicineTypeShuoYing()">
            <div class="content_pic"><img src="images/img_menu1.png" width="64" height="64" /></div>
            <div class="content_words">
                <p class="title">药物类别索引
                </p>
                <p class="titleC">药物目录索引
                </p>
            </div>
        </div>
    </div>
    <div class="contentrow">
        <div class="contentdiv" onclick="shiyingzheng()">
            <div class="content_pic"><img src="images/img_menu2.png" width="64" height="64" /></div>
            <div class="content_words">
                <p class="title">适应症索引
                </p>
                <p class="titleC">含适应症药物索引
                </p>
            </div>
        </div>
    </div>
    <div class="contentrow">
        <div class="contentdiv" onclick="yunQiAnQuan()">
            <div class="content_pic"><img src="images/img_menu3.png" width="64" height="64" /></div>
            <div class="content_words">
                <p class="title">哺乳期危险
                </p>
                <p class="titleC">该类药物索引
                </p>
            </div>
        </div>
    </div>
    <!--第二行-->
    <div class="contentrow">
        <div class="contentdiv" onclick="shiyingzheng()">
            <div class="content_pic"><img src="images/img_menu4.png" width="64" height="64" /></div>
            <div class="content_words">
                <p class="title">基本药物
                </p>
                <p class="titleC">基本药物目录索引
                </p>
            </div>
        </div>
    </div>
    <div class="contentrow">
        <div class="contentdiv" onclick="shiyingzheng()">
            <div class="content_pic"><img src="images/img_menu5.png" width="64" height="64" /></div>
            <div class="content_words">
                <p class="title">妊娠期危害分级
                </p>
                <p class="titleC">该类药物索引
                </p>
            </div>
        </div>
    </div>
  <%--  <div class="contentrow">
        <div class="contentdiv" onclick="changShang()">
            <div class="content_pic"><img src="images/img_menu5.png" width="64" height="64" /></div>
            <div class="content_words">
                <p class="title">妊娠期危害分级
                </p>
                <p class="titleC">处方药、非处方药（甲类非处方药、乙类非处方药）
                </p>
            </div>
        </div>
    </div>--%>
    <div class="contentrow">
        <div class="contentdiv" onclick="gaoWei()">
            <div class="content_pic"><img src="images/img_menu6.png" width="64" height="64" /></div>
            <div class="content_words">
                <p class="title">高危药品
                </p>
                <p class="titleC">高危药品目录索引
                </p>
            </div>
        </div>
    </div>
<div style="clear:both; display:block; width:100%; text-align:center; padding-top:20px;"><img src="<%=request.getContextPath()%>/gx/njsfy_index/images/logo(2).png" width="278" height="79" /></div>
</div>
</body>
</html>
