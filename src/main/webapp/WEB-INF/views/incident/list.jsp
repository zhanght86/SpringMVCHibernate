<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page import="com.cngc.pm.service.UserService"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils,org.springframework.web.context.WebApplicationContext"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
    <!--[if gt IE 8]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <![endif]-->
    
    <title>事件管理--运维管理系统</title>

    <link href="${contextPath }/resources/css/icons.css" rel="stylesheet" type="text/css" />
    <link href="${contextPath }/resources/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="${contextPath }/resources/css/fullcalendar.css" rel="stylesheet" type="text/css" />
    <link href="${contextPath }/resources/css/ui.css" rel="stylesheet" type="text/css" />
    <link href="${contextPath }/resources/css/uniform.default.css" rel="stylesheet" type="text/css" />
    <link href="${contextPath }/resources/css/validation.css" rel="stylesheet" type="text/css" />
    <link href="${contextPath }/resources/css/mCustomScrollbar.css" rel="stylesheet" type="text/css" />
    <link href="${contextPath }/resources/css/cleditor.css" rel="stylesheet" type="text/css" />
    <link href="${contextPath }/resources/css/fancybox/jquery.fancybox.css" rel="stylesheet" type="text/css" />
    <link href="${contextPath }/resources/css/elfinder.min.css" rel="stylesheet" type="text/css" />
    <link href="${contextPath }/resources/css/elfinder.css" rel="stylesheet" type="text/css" />
    <link href="${contextPath }/resources/css/multi-select.css" rel="stylesheet" type="text/css" />
    <link href="${contextPath }/resources/css/pnotify.css" rel="stylesheet" type="text/css" />
    <link href="${contextPath }/resources/css/ibutton.css" rel="stylesheet" type="text/css" />
    <link href="${contextPath }/resources/css/stepy.css" rel="stylesheet" type="text/css" />
    <link href="${contextPath }/resources/css/tagsinput.css" rel="stylesheet" type="text/css" />
    <link href="${contextPath }/resources/css/dataTables.css" rel="stylesheet" type="text/css" />
    <link href="${contextPath }/resources/css/stylesheet.css" rel="stylesheet" type="text/css" />
    <link href="${contextPath }/resources/css/styling.css" rel="stylesheet" type="text/css" />
    <link href="${contextPath }/resources/css/mycss.css" rel="stylesheet" type="text/css" />
	<link href="${contextPath }/resources/css/stylesheets2.css" rel="stylesheet" type="text/css" />
    <link rel='stylesheet' type='text/css' href='${contextPath }/resources/css/fullcalendar.print.css' media='print' />
    
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/jquery/jquery-1.10.2.min.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/jquery/jquery-ui-1.10.1.custom.min.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/jquery/jquery-migrate-1.2.1.min.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/jquery/jquery.mousewheel.min.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/cookie/jquery.cookies.2.2.0.min.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/bootstrap.min.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/sparklines/jquery.sparkline.min.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/fullcalendar/fullcalendar.min.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/uniform/uniform.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/maskedinput/jquery.maskedinput-1.3.min.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/validation/languages/jquery.validationEngine-zh-CN.js' charset='utf-8'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/validation/jquery.validationEngine.js' charset='utf-8'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/animatedprogressbar/animated_progressbar.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/qtip/jquery.qtip-1.0.0-rc3.min.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/cleditor/jquery.cleditor.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/dataTables/jquery.dataTables.min.js'></script>    
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/fancybox/jquery.fancybox.pack.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/multiselect/jquery.multi-select.js'></script>
    <script type="text/javascript" src="${contextPath }/resources/js/plugins/elfinder/elfinder.min.js"></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/highlight/jquery.highlight-4.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/pnotify/jquery.pnotify.min.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/ibutton/jquery.ibutton.min.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/scrollup/jquery.scrollUp.min.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/pm-common.js'></script>   
    <!-- <script type='text/javascript' src='${contextPath }/resources/js/pm-workflow.js'></script> -->
    <script type='text/javascript' src='${contextPath }/resources/js/pm-knowledge.js'></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="${contextPath }/resources/js/html5shiv.js"></script>
      <script src="${contextPath }/resources/js/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript">
    	var ctx = "${contextPath}";
    	
        $(document).ready(function () {
            $("#myTable").dataTable({
            	"oLanguage": {
         			"sUrl": "${contextPath}/resources/json/Chinese.json"
     			},
     			"bSort":false});
            $(".header").load("${contextPath}/header?t="+pm_random());
            $(".menu").load("${contextPath}/menu?t="+pm_random(), function () { $("#node_${moduleId}").addClass("active"); });
            $(".breadLine .buttons").load("${contextPath}/contentbuttons?t="+pm_random());
            $(".confirm").bind("click",function(){
               	if(!confirm("确定要执行该操作?"))
               		return false;
            });
            // 流程跟踪
            $("#b_popup_trace").dialog({
                autoOpen: false,
                width: 800,
                height: 400,
                buttons: { "关闭": function () { $(this).dialog("close") } }
            });
         // 巡检结果对话框初始化
            $("#b_popup_incident").dialog({
                autoOpen: false,
                width: 1150,
                height: 700,
                buttons: { "关闭": function () { $(this).dialog("close") } }
            });
            $(".lnk_trace").click(function () {
            	var src= ctx+ '/diagram-viewer/index.html?processDefinitionId=' 
    			+ $(this).attr('pdid') + '&processInstanceId=' + $(this).attr('pid');
            	$("#trace_content").html("<iframe src='"+ src +"' width='100%' height='265'/>");
            	$("#b_popup_trace").dialog('open');
            });    
        });
        
        function view(id) {
        	var src= ctx+ '/incident/view/'+id;
        	$("#incident_content").html("<iframe src='"+ src +"' width='100%' height='550'/>");
        	 
        	$("#b_popup_incident").dialog('open');
        	return false;
        }
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
                    <li><a href="${contextPath }/incident/list">事件管理</a> <span class="divider">></span></li>       
                    <li class="active">事件控制台</li>
                </ul>

                <ul class="buttons"></ul>

            </div>
            <!--breadline end-->

            <!--workplace-->
            <div class="workplace">             

				<div class="alert alert-danger hide">                
                    <h4>错误!</h4>请至少选择一项
                </div> 
                <div class="row">
                    <div class="col-md-10">                    
                        <div class="head clearfix">
                            <div class="isw-grid"></div>
                            <h1>
                            	<c:if test="${not empty status }">
                            		[ ${status.codeName } ] 事件
                            	</c:if>
                            	<c:if test="${empty status }">
                            	待处理事件
                            	</c:if>
                            </h1>  

                            <ul class="buttons">
                                <li>
                                    <a href="${contextPath }/incident/add" class="isw-plus tipb" title="创建新事件"></a>
                                </li>                            
                                <li>
                                    <a href="#" class="isw-settings tipl" title="操作 "></a>
                                    <ul class="dd-list">
                                    	<li><a href="${contextPath }/incident/list"><span class="isw-plus"></span> 创建新事件</a></li>
                                        <li><a href="${contextPath }/incident/list"><span class="isw-list"></span> 查看待处理事件</a></li>
                                        <li><a href="${contextPath }/incident/mydealedlist"><span class="isw-pin"></span> 跟踪处理过的事件</a></li>
                                        <li><a href="${contextPath }/incident/search"><span class="isw-zoom"></span> 历史事件查询</a></li>
                                        <li><a href="#" onclick="pm_refresh()"><span class="isw-refresh"></span> 刷新</a></li>
                                    </ul>
                                </li>
                            </ul>                             
                        </div>
                        <div class="block-fluid table-sorting clearfix">
                            <table class="table" id="myTable">
                                <thead>
                                    <tr>
                                    	<th width="70px">流水号</th>
                                        <th>摘要</th>
                                        <th>服务部门</th>
                                        <th width="70px">申请人</th>
                                        <th width="60px">受派者</th>
                                        <th width="100px">流程步骤</th>
                                        <th width="70px">申请时间</th>
                                        <th width="70px">要求完成时间</th>
                                        <th width="50px">状态</th> 
                                        <th width="90px">操作</th>                                    
                                    </tr>
                                </thead>
                                <%
                                	WebApplicationContext wac =  WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
                                	UserService  userService = (UserService)wac.getBean("userServiceImpl");
                                %>
                                <tbody>
                                	<c:forEach items="${list }" var="incident">
                                	<c:set var="username" value="${incident.applyUser }"></c:set>
                                	<c:if test="${not empty mytasks[incident.processInstanceId] }">
	                                	<c:set var="task" value="${mytasks[incident.processInstanceId]}" />
	                                    <tr>
	                                    	<td>${incident.processInstanceId }</td>
	                                        <td>
	                                        	<c:if test="${incident.priority == '02' || incident.priority == '01' }">
	                                        	<span class="label label-danger tipb" title="优先级:${incident.priorityName }">${incident.priorityName }</span>
	                                        	</c:if>
	                                        	<c:if test="${incident.priority == '04' || incident.priority == '03' }">
	                                        	<span class="label label-warning tipb" title="优先级:${incident.priorityName }">${incident.priorityName }</span>
	                                        	</c:if>
	                                        	
	                                        	<a href="#" title="查看详情" class="tipr" onclick="javascript:view(${incident.id});">${incident.abs }</a>
	                                        </td>
	                                        <td><%=(userService.getTopGroupByUser(userService.getByUsername(pageContext.getAttribute("username").toString()))).getGroupName() %></td>
	                                        <td>${incident.applyUserName }</td>
	                                        <td>${incident.currentDelegateUserName }</td>
	                                        <td>
												<a class="lnk_trace tipb" href="#" pid="${incident.processInstanceId }" pdid="${task.processDefinitionId }" title="点击查看流程图">
													${task.name }
												</a>
											</td>
	                                        <td><fmt:formatDate value="${incident.applyTime }" pattern="yyyy-MM-dd HH:mm" /></td>
	                                        <td><fmt:formatDate value="${incident.finishTime }" pattern="yyyy-MM-dd HH:mm" /></td>
	                                        <td>${incident.statusName }</td>
	                                        <td>
	                                        	<c:if test="${empty task.assignee }">
													<a class="claim confirm" href="${contextPath }/workflow/task/claim/${task.id}"><span class="glyphicon glyphicon-edit"></span> 签收</a>
												</c:if>
												<c:if test="${not empty task.assignee }">
	                                        		<a href="${contextPath }/incident/deal/${incident.id}/${task.id}"><span class="glyphicon glyphicon-edit"></span> 办理</a>
	                                        	</c:if>
	                                        	<c:if test="${not empty ROLE_MODIFY }">
	                                        		<a href="${contextPath }/incident/update/${incident.id}" title="修改"><span class="glyphicon glyphicon-pencil"></span> 修改</a>
	                                        	</c:if>
	                                        </td>
	                                    </tr>
                                    </c:if>
                                    <c:if test="${empty mytasks[incident.processInstanceId] }">
                                    	<c:if test="${not empty tasks[incident.processInstanceId] }">
                                    	<c:set var="task" value="${tasks[incident.processInstanceId]}" />
                                    		<tr>
                                    			<td>${incident.processInstanceId }</td>
		                                        <td>
		                                        	<c:if test="${incident.priority == '02' || incident.priority == '01' }">
	                                        	<span class="label label-danger tipb" title="优先级:${incident.priorityName }">${incident.priorityName }</span>
	                                        	</c:if>
	                                        	<c:if test="${incident.priority == '04' || incident.priority == '03'}">
	                                        	<span class="label label-warning tipb" title="优先级:${incident.priorityName }">${incident.priorityName }</span>
	                                        	</c:if>
		                                        	<a href="#" title="查看详情" class="tipr" onclick="javascript:view(${incident.id});">${incident.abs }</a>
		                                        </td>
		                                        <td><%=(userService.getTopGroupByUser(userService.getByUsername(pageContext.getAttribute("username").toString()))).getGroupName() %></td>
		                                        <td>${incident.applyUserName }</td>
		                                        <td>${incident.currentDelegateUserName }</td>
		                                        <td>
													<a class="lnk_trace" href='#' pid="${incident.processInstanceId }" pdid="${task.processDefinitionId }" title="点击查看流程图">
														${task.name }
													</a>
												</td>
		                                        <td><fmt:formatDate value="${incident.applyTime }" pattern="yyyy-MM-dd HH:mm" /></td>
		                                       <td><fmt:formatDate value="${incident.finishTime }" pattern="yyyy-MM-dd HH:mm" /></td>
		                                        <td>${incident.statusName }</td>
		                                        <td>
			                                        <c:if test="${not empty ROLE_MODIFY }">
		                                        		<a href="${contextPath }/incident/update/${incident.id}"><span class="glyphicon glyphicon-pencil"></span> 修改</a>
		                                        	</c:if>
		                                        	<a class="claim confirm" href="${contextPath }/incident/end-process/${task.id}" title="中止"><span class="glyphicon glyphicon-pencil"></span> 中止</a>
		                                        </td>
		                                    </tr>
                                    	</c:if>
                                    </c:if>
                                   </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>  

                    <div class="col-md-2">
                        <div class="head clearfix">
                            <div class="isw-list"></div>
                            <h1>操作</h1>
                        </div>
                        <div class="block-fluid accordion">
                            <h3>计数</h3>
                            <div>
                                <ul>
                                	<c:forEach items="${group }" var="code">
                                		<c:set var="id" value="${code.code }" />
                                		<li><a href="${contextPath }/incident/list/${code.code}">${code.codeName }</a>
                                		<span style="float:right;margin-right:20px;">
                                			<c:if test="${empty count[id] }">
                                			0
                                			</c:if>
                                			${count[id] }
                                		</span></li>
                                	</c:forEach>
                                </ul>                                              
                            </div>

                            <h3>功能</h3>
                            <div>
                                <ul>
                                    <li><a href="${contextPath }/incident/add">创建新事件</a></li>
                                    <li><a href="${contextPath }/incident/list">查看待处理事件</a></li>
                                    <li><a href="${contextPath }/incident/mydealedlist">跟踪处理过的事件</a></li>
                                    <li><a href="${contextPath }/incident/search">历史事件查询</a></li>
                                </ul>                                                
                            </div>                     

                        </div>
                    </div> 
                </div>
                
            </div>
            <!--workplace end-->
        </div> 
    </div>
    <!-- 流程跟踪 -->
   	<div class="dialog" id="b_popup_trace" style="display: none;" title="流程跟踪">
    	<div class="block dialog_block  uploads" id="trace_content">
		</div>
   	</div>
   	<!-- 查看详细信息 -->
    <div class="dialog" id="b_popup_incident" style="display: none;" title="查看事件详细信息">
	    <div class="block dialog_block" id="incident_content"></div>
    </div>
</body>

</html>
