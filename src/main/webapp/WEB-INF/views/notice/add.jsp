<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="en">
<head>        
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
    <!--[if gt IE 8]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <![endif]-->
    
    <title>运维公告管理--运维管理系统</title>

    <!-- <link rel="icon" type="image/ico" href="favicon.ico"/> -->
    <link href="${contextPath }/resources/css/icons.css" rel="stylesheet" type="text/css" />
    <link href="${contextPath }/resources/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="${contextPath }/resources/css/ui.css" rel="stylesheet" type="text/css" />
    <link href="${contextPath }/resources/css/pnotify.css" rel="stylesheet" type="text/css" />
    <link href="${contextPath }/resources/css/stylesheet.css" rel="stylesheet" type="text/css" />
    <link href="${contextPath }/resources/css/styling.css" rel="stylesheet" type="text/css" />
    <link href="${contextPath }/resources/css/mycss.css" rel="stylesheet" type="text/css" />
    <link href="${contextPath }/resources/js/plugins/select2/select2.css" rel="stylesheet" type="text/css" />
    <link href="${contextPath }/resources/css/uploadify.css" rel="stylesheet" type="text/css" />
    <link href="${contextPath }/resources/css/validation.css" rel="stylesheet" type="text/css" />
    <link href='${contextPath }/resources/js/plugins/jstree/jquery.treeview.css' rel="stylesheet" type="text/css" />
    <!--[if lt IE 8]>
        <link href="${contextPath }/resources/css/ie7.css" rel="stylesheet" type="text/css" />
    <![endif]-->    
   	<script type='text/javascript' src='${contextPath }/resources/js/plugins/jquery/jquery-1.10.2.min.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/jquery/jquery-ui-1.10.1.custom.min.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/jquery/jquery-migrate-1.2.1.min.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/jquery/jquery.mousewheel.min.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/cookie/jquery.cookies.2.2.0.min.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/bootstrap.min.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/validation/languages/jquery.validationEngine-zh-CN.js' charset='utf-8'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/validation/jquery.validationEngine.js' charset='utf-8'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/select2/select2.min.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/uniform/uniform.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/highlight/jquery.highlight-4.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/pnotify/jquery.pnotify.min.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/ibutton/jquery.ibutton.min.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/scrollup/jquery.scrollUp.min.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/uploadify/jquery.uploadify.min.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/jstree/jquery.treeview.js'></script>
      
    <script type='text/javascript' src='${contextPath }/resources/js/pm-common.js'></script>
    <%--<script type='text/javascript' src='${contextPath }/resources/js/pm-select.js'></script> //IE8+    --%>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="${contextPath }/resources/js/html5shiv.js"></script>
      <script src="${contextPath }/resources/js/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript">
    	var ctx = "${contextPath}";
        $(document).ready(function () {
          	$(".header").load("${contextPath }/header?t=" + pm_random());
            $(".menu").load("${contextPath }/menu?t=" + pm_random(), function () { $("#node_${moduleId}").addClass("active"); });
            $(".breadLine .buttons").load("${contextPath }/contentbuttons?t=" + pm_random());
          	
            //表单验证
            $("#validation").validationEngine({promptPosition : "topRight", scroll: true});

        });

    </script>
    <style type="text/css">
    	.uploadify-button-text {color:#fff !important;}
    	
    </style>
</head>
<body>
    <div class="wrapper"> 

        <!--header-->
        <div class="header"></div>
        <!--header end-->
        
        <!--menu-->
        <div class="menu"></div>
        <!--menu end-->

        <div class="content">
            <!--breadline-->
            <div class="breadLine">
                <ul class="breadcrumb">
                    <li><a href="#">运维管理系统</a> <span class="divider">></span></li>
                    <li><a href="${contextPath }/notice/list">运维公告管理</a> <span class="divider">></span></li>   
                    <c:if test="${not empty notice.id }" >     
                    	<li class="active">修改公告信息</li>
                    </c:if>
                    <c:if test="${empty notice.id }" >     
                    	<li class="active">创建新公告</li>
                    </c:if>
                </ul>
                <ul class="buttons"></ul>
            </div>
            <!--breadline end-->

            <!--workplace-->
            <div class="workplace">

                <div class="row">
                	<div class="col-md-1"></div>
	                <div class="col-md-10">
	                        <div class="head clearfix">
	                            <div class="isw-empty_document"></div>
	                            <h1>运维公告录入</h1>
	                        </div>
	                        <c:url var="addAction" value="/notice/save" ></c:url>
	                        <form:form action="${addAction}" commandName="notice" method="post" id="validation">
	                        <form:hidden path="id" />
	                        <div class="block-fluid">                        
	                            <div class="row-form clearfix">
	                                <div class="col-md-1"><form:label path="title">标题:</form:label></div>
	                                <div class="col-md-11"><form:input path="title" class="validate[required,maxSize[50]]"></form:input></div>
	                             </div>
	                            <div class="row-form clearfix">
	                                <div class="col-md-1"><form:label path="content">内容:</form:label></div>
	                                <div class="col-md-11"><form:textarea path="content" class="validate[required,maxSize[255]]"></form:textarea>
	                                </div>
	                            </div>
                                                 
	                            <div class="footer">
	                                <button class="btn btn-primary center-block"> 保 存 </button>
	                            </div>                            
	                        </div>
	                   		</form:form>
	                    </div>
	                <div class="col-md-1"></div>
                </div>

            </div>
            <!--workplace end-->
        </div>  
    </div>

</body>
</html>
