<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="en">
<head>        
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
    <!--[if gt IE 8]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <![endif]-->
    
    <title>知识管理--运维管理系统</title>

    <link rel="icon" type="image/ico" href="favicon.ico"/>
    <link href="${contextPath }/resources/css/icons.css" rel="stylesheet" type="text/css" />
    <link href="${contextPath }/resources/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="${contextPath }/resources/css/ui.css" rel="stylesheet" type="text/css" />
    <link href="${contextPath }/resources/css/pnotify.css" rel="stylesheet" type="text/css" />
    <link href="${contextPath }/resources/css/stylesheet.css" rel="stylesheet" type="text/css" />
    <link href="${contextPath }/resources/css/styling.css" rel="stylesheet" type="text/css" />
    <link href="${contextPath }/resources/css/validation.css" rel="stylesheet" type="text/css" />
    <link href="${contextPath }/resources/css/mycss.css" rel="stylesheet" type="text/css" />
    <!--[if lt IE 8]>
        <link href="${contextPath }/resources/css/ie7.css" rel="stylesheet" type="text/css" />
    <![endif]-->    
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/jquery/jquery-1.10.2.min.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/jquery/jquery-ui-1.10.1.custom.min.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/jquery/jquery-migrate-1.2.1.min.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/jquery/jquery.mousewheel.min.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/cookie/jquery.cookies.2.2.0.min.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/bootstrap.min.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/dataTables/jquery.dataTables.min.js'></script>    
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/highlight/jquery.highlight-4.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/pnotify/jquery.pnotify.min.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/scrollup/jquery.scrollUp.min.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/validation/languages/jquery.validationEngine-zh-CN.js' charset='utf-8'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/plugins/validation/jquery.validationEngine.js' charset='utf-8'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/pm-common.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/activiti-form.js'></script>
    <script type='text/javascript' src='${contextPath }/resources/js/pm-workflow.js'></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="${contextPath }/resources/js/html5shiv.js"></script>
      <script src="${contextPath }/resources/js/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript">
    	var ctx = "${contextPath}";
        $(document).ready(function () {
            $("#eventTable").dataTable({
            	"oLanguage": {
         			"sUrl": "${contextPath}/resources/json/Chinese.json"
     			}
            });
            $(".header").load("${contextPath}/header?t="+pm_random());
            $(".menu").load("${contextPath}/menu?t="+pm_random(), function () { $("#node_${moduleId}").addClass("active"); });
            $(".breadLine .buttons").load("${contextPath}/contentbuttons?t="+pm_random());
            $(".confirm").bind("click",function(){
               	if(!confirm("确定要执行该操作?"))
               		return false;
            });
            pm_workflow_inittracedialog(600,380);
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
                    <li><a href="${contextPath }/knowledge/search">知识管理</a> <span class="divider">></span></li>       
                    <li class="active">知识管理控制台</li>
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
                    <div class="col-md-9">                    
                        <div class="head clearfix">
                            <div class="isw-grid"></div>
                            <h1>
                                <c:if test="${not empty status }">
                            		${status.codeName }知识
                            	</c:if>
                            	<c:if test="${empty status }">
                            	待处理知识
                            	</c:if>
                            </h1>  

                            <ul class="buttons">    
                            	<li>
                                    <a href="${contextPath }/knowledge/add" class="isw-text_document tipb" title="新知识"></a>
                                </li>                       
                                <li>
                                    <a href="#" class="isw-settings tipl" title="操作 "></a>
                                    <ul class="dd-list">
                                    	<li><a href="${contextPath}/knowledge/add" role="button" data-toggle="modal"><span class="isw-ok"></span> 创建新知识</a></li>
                                        <li><a href="${contextPath}/knowledge/list" ><span class="isw-list"></span> 待处理知识</a></li>
                                        <li><a href="#" onclick="pm_refresh()"><span class="isw-refresh"></span> 刷新</a></li>
                                    </ul>
                                </li>
                            </ul>                             
                        </div>
                        <div class="block-fluid table-sorting clearfix">
                            <table class="table" id="eventTable">
                                <thead>
                                	<tr>
										<th>标题</th>
										<th width="100px">关键字</th>
										<th width="100px">提交者</th>
										<th width="110px">提交时间</th>
										<th width="120px">流程步骤</th>
										<th width="70px">状态</th>
										<th width="90px">操作</th>
									</tr>
                                </thead>
                                <tbody>
                                	<c:forEach items="${list}" var="knowledge">
									<c:set var="task" value="${tasks[knowledge.processInstanceId]}" />
									<c:set var="mytask" value="${mytasks[knowledge.processInstanceId]}" />
									<tr>
										<td><a href="${contextPath }/knowledge/detail/${knowledge.id}" target=_blank>${knowledge.title }</a></td>
										<td>${knowledge.keyword }</td>
										<td>${knowledge.applyUserName }</td>
										<td><fmt:formatDate value="${knowledge.applyTime }" pattern="MM/dd HH:mm:ss" /></td>
										<td>
											<c:if test="${not empty task }">
												<a class="lnk_trace" href='#' pid="${knowledge.processInstanceId }" pdid="${task.processDefinitionId }" title="点击查看流程图">
													${task.name }
												</a>
											</c:if>
										</td>
										<td>${knowledge.statusName }</td>
										<td>
											<c:if test="${!knowledge.locked }">
												<a class="confirm" href='${contextPath }/knowledge/manage/${knowledge.id}/publish'><span class="glyphicon glyphicon-share"></span> 发布申请</a><br>
											</c:if>
											<c:if test="${knowledge.status=='04' }">
												<a class="confirm" href='${contextPath }/knowledge/manage/${knowledge.id}/modify'><span class="glyphicon glyphicon-share"></span> 修改申请</a><br>
												<a class="confirm" href='${contextPath }/knowledge/manage/${knowledge.id}/delete'><span class="glyphicon glyphicon-share"></span> 删除申请</a><br>
											</c:if>
											<c:if test="${!knowledge.locked }">
										 		<a href='${contextPath }/knowledge/update/${knowledge.id}'><span class="glyphicon glyphicon-edit"></span> 修改</a><br>
										 	</c:if>
										 	<c:if test="${knowledge.status=='01' }">
										 		<a href='${contextPath }/knowledge/delete/${knowledge.id}' class="confirm"><span class="glyphicon glyphicon-remove"></span> 删除</a>
										 	</c:if>
										 	<c:if test="${not empty mytask}">
												<a href="#" onclick="act_form_openTaskDialog('知识管理','${mytask.id}','/knowledge/list')"><span class="glyphicon glyphicon-edit"></span> 办理</a>
											</c:if>
										</td>
									</tr>
								</c:forEach>   
                                </tbody>
                            </table>
                        </div>
                    </div>  
                  
                
                    <div class="col-md-3">
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
                                		<li><a href="${contextPath }/knowledge/list/${code.code}">${code.codeName }</a>
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
                                    <li><a href="${contextPath }/knowledge/add">创建新知识</a></li>
                                    <li><a href="${contextPath }/knowledge/list">待处理知识</a></li>
                                </ul>                                                
                            </div>                     

                        </div>
                    </div> 
               
                </div>
                <div class="dr"><span></span></div>
            </div>
            <!--workplace end-->
        </div>   
        <!-- 动态表单 -->
        <div class="modal fade" id="dynamicForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"></div>
    	<!-- 动态表单 end -->
    </div>
</body>

</html>