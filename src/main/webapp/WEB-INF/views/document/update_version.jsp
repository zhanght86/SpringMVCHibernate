<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>        
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
    <!--[if gt IE 8]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <![endif]-->
    
    <title>附件上传</title>

    <link rel="icon" type="image/ico" href="favicon.ico"/>
    
    <link href="${contextPath }/resources/css/stylesheets.css" rel="stylesheet" type="text/css" />
    <!-- <link type="text/css" rel="stylesheet" href="${contextPath }/resources/plupload/css/jquery-ui.min.css" /> -->
	<!-- <link type="text/css" rel="stylesheet" href="${contextPath }/resources/js/plugins/plupload/jquery.plupload.queue/css/jquery.plupload.queue.css" /> -->
	<link type="text/css" rel="stylesheet" href="${contextPath }/resources/plupload/js/jquery.plupload.queue/css/jquery.plupload.queue.css" />
	
    <!--[if lt IE 8]>
        <link href="${contextPath }/resources/css/ie7.css" rel="stylesheet" type="text/css" />
    <![endif]-->    
    <link rel='stylesheet' type='text/css' href='${contextPath }/resources/css/fullcalendar.print.css' media='print' />
    
   <script type='text/javascript' src='${contextPath }/resources/js/plugins/jquery/jquery-1.10.2.min.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/jquery/jquery-ui-1.10.1.custom.min.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/jquery/jquery-migrate-1.2.1.min.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/jquery/jquery.mousewheel.min.js'></script>
    
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/cookie/jquery.cookies.2.2.0.min.js'></script>
    
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/bootstrap.min.js'></script>
    
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/charts/jquery.flot.js'></script>    
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/charts/jquery.flot.stack.js'></script>    
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/charts/jquery.flot.pie.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/charts/jquery.flot.resize.js'></script>
    
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/sparklines/jquery.sparkline.min.js'></script>
    
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/fullcalendar/fullcalendar.min.js'></script>
    
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/uniform/uniform.js'></script>
    
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/maskedinput/jquery.maskedinput-1.3.min.js'></script>
    
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/validation/jquery.validationEngine.js' charset='utf-8'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/validation/languages/jquery.validationEngine-zh-CN.js' charset='utf-8'></script>
    
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/animatedprogressbar/animated_progressbar.js'></script>
    
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/qtip/jquery.qtip-1.0.0-rc3.min.js'></script>
    
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/cleditor/jquery.cleditor.js'></script>
    
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/dataTables/jquery.dataTables.min.js'></script>    
    
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/fancybox/jquery.fancybox.pack.js'></script>
    
    <!-- 
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/plupload/plupload.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/plupload/plupload.gears.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/plupload/plupload.silverlight.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/plupload/plupload.flash.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/plupload/plupload.browserplus.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/plupload/plupload.html4.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/plupload/plupload.html5.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/plupload/jquery.plupload.queue/jquery.plupload.queue.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/plupload/i18n/cn.js'></script>
     -->
    <script type='text/javascript' src='${contextPath }/resources/plupload/js/plupload.full.min.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/plupload/js/jquery.plupload.queue/jquery.plupload.queue.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/plupload/js/i18n/zh_CN.js'></script>   
        
    <script type="text/javascript" src="${contextPath }/resources/js/plugins/elfinder/elfinder.min.js"></script>
    
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/highlight/jquery.highlight-4.js'></script>
    
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/pnotify/jquery.pnotify.min.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/ibutton/jquery.ibutton.min.js'></script>
    
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/scrollup/jquery.scrollUp.min.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/tagsinput/jquery.tagsinput.min.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/multiselect/jquery.multi-select.js'></script>
    
    <script type='text/javascript' src='${contextPath }/resources/js/cookies.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/actions.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/charts.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/settings.js'></script>    
    <script type='text/javascript' src='${contextPath }/resources/js/faq.js'></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="${contextPath }/resources/js/html5shiv.js"></script>
      <script src="${contextPath }/resources/js/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript">
            $(document).ready(function () {
            	$(".header").load("${contextPath }/header");
                $(".menu").load("${contextPath }/menu", function () { $(".navigation > li:eq(5)").addClass("active"); });
                $(".breadLine .buttons").load("${contextPath }/contentbuttons");
                
                $("#document").validationEngine({promptPosition : "topLeft", scroll: true});
                
                $(function() {
            		$("#uploader").pluploadQueue({
            			// General settings
            			runtimes : 'gears,flash,silverlight,browserplus,html5,html4',
            			url : '${contextPath }/attachment/plupload',
            			max_file_size : '10mb',
            			unique_names : true,
            			chunk_size: '2mb',
            			// Specify what files to browse for
            			filters : [
            				{title : "文档", extensions : "xls,xlsx,doc,docx"}
            			],
            	
            			// Flash settings
            			flash_swf_url : '${contextPath }/resources/js/plugins/plupload/plupload.flash.swf',
            			// Silverlight settings
            			silverlight_xap_url : '${contextPath }/resources/js/plugins/plupload/plupload.silverlight.xap'
            		});
            		$('form').submit(function(e) {
            	        var uploader = $('#uploader').pluploadQueue();
            	        if (uploader.files.length > 0) {
            	            // When all files are uploaded submit form
            	            uploader.bind('StateChanged', function() {
            	                if (uploader.files.length === (uploader.total.uploaded + uploader.total.failed)) {
            	                    $('form')[0].submit();
            	                }
            	            });
            	            uploader.start();
            	        } else {
            				alert('请先上传数据文件.');
            			}
            	        return false;
                	});
            	});
            	
            });
    </script>
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
                    <li><a href="#">文档管理</a> <span class="divider">></span></li>         
                    <li class="active">文档信息</li>
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
                            <div class="isw-documents"></div>
                            <h1>文档信息录入</h1>
                        </div><c:url var="addAction" value="/document/update_version_commit" ></c:url>
						<form:form action="${addAction}" commandName="document">
						<form:hidden path="id"/>
                        <div class="block-fluid">                        
                          <div class="row-form clearfix">
                                <div class="col-md-2"><label>文档名称</label></div>
                                <div class="col-md-4">${document.name }</div>
                                <div class="col-md-2"><label>关键字</label></div>
                                <div class="col-md-4">${document.keywords }</div>
                            </div> 
                            <div class="row-form clearfix">
                             <div class="col-md-2"><label>密&nbsp;&nbsp;&nbsp;&nbsp;级</label></div>
                                <div class="col-md-4">${document.secretLevel.level }</div>
                                <div class="col-md-2"><label>编&nbsp;&nbsp;&nbsp;&nbsp;号</label></div>
                                <div class="col-md-4">${document.docNum }</div>
                            </div>
                            <div class="row-form clearfix">
                                <div class="col-md-2">
                                <label >所属类别</label>
                                </div>
                                <div class="col-md-7">${document.style.name }</div>
                            </div>
                            <div class="row-form clearfix">
                                <div class="col-md-2"><label>存放位置</label></div>
                                <div class="col-md-7">${document.deposit }</div>
                            </div>
                            <div class="row-form clearfix">
                                <div class="col-md-12">
                                <div id="uploader">
					<p>您的浏览器未安装 Flash, Silverlight, Gears, BrowserPlus 或者支持 HTML5 .</p>
				</div>
                                
								</div>
                            </div>

                            <div class="footer tar">
                               <input type="submit" class="btn btn-primary center-block" value="提 交" />
                            </div>                            
                        </div>
                        </form:form>
                    </div>
                    
                </div>

            </div>
            <!--workplace end-->
        </div>   
    </div>
    
</body>

</html>