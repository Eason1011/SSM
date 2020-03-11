<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="t" uri="http://www.nwnu.cn/common/"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>欢迎！</title>
	<link rel="stylesheet" href="plug-in/bootstrap-3.3.7-dist/css/bootstrap.css" />
</head>
<script type="text/javascript">
function saveStudent(){	
	alert($('#addStudentForm').serialize());
  $.post("insertStudent",$('#addStudentForm').serialize(),
  	function(data){
	  if(data=="OK"){
		  alert("操作成功！");
		  window.location.reload();
		  clearFormData();
	  }else{
		  alert("操作失败！");
	  }
  	}
  );
}
function updateStudent(id){	
	$.ajax({url: "getStudentById", 
		type:"get",
		data:{"id":id},
		success: function(data){
       		//数据回显
       		$("#addStudentForm #id").val(data.id);
       		$("#addStudentForm #clazzId").val(data.clazzId);
       		$("#addStudentForm #code").val(data.code);
       		$("#addStudentForm #name").val(data.name);
       		$("#addStudentForm #sex").val(data.sex);
       		$("#addStudentForm #birthday").val(data.birthday);
       		$("#addStudentForm #nation").val(data.nation);       		
    	}
	});
}
function clearFormData(){
	$("#addStudentForm #id").val("");
	$("#addStudentForm #clazzId").val("");
	$("#addStudentForm #code").val("");
	$("#addStudentForm #name").val("");
	$("#addStudentForm #sex").val("");
	$("#addStudentForm #birthday").val("");
	$("#addStudentForm #nation").val("");
}
function clearQueryForm(){	
	$("#queryForm #clazzId").val("");
	$("#queryForm #code").val("");
	$("#queryForm #name").val("");
	$("#queryForm #sex").val("");	
	$("#queryForm #nation").val("");
}
function deleteStudent(id){	
	var r = confirm("你确定删除吗");
	if (r == true) {
		$.post("deleteStudent",{"id":id},
			  	function(data){
				  if(data=="OK"){
					  alert("删除学生成功！");
					  window.location.reload();
				  }else{
					  alert("删除学生失败！");
					  
				  }
			  	}
			  );
	} else {
	}
  
}
</script>
<body>
<div class="alert alert-info">
	<span>学生管理功能</span>
	<span class="pull-right">
		 您好！${user.name}
		<a href="logout">退出登录</a>
	</span>
</div>

<div class="nav">
	<nav class="navbar navbar-inverse" role="navigation">
		<div class="container-fluid">
	    <div class="navbar-header">
	        <a class="navbar-brand" href="#">学生管理</a>
	    </div>
	    <div>
	        <ul class="nav navbar-nav">
	            <li class="active"><a href="#">班级管理</a></li>
	            <li><a href="#">系统管理</a></li>
	        </ul>
	    </div>
		</div>
	</nav>
</div>


<div class="panel panel-default">
    <div class="panel-body">
    <form action="student" method="get" id="queryForm" name="queryForm" class="form-inline"> 
        学院：<select name="clazzId" id="clazzId" class="form-control" >
        	  <option value="">请选择</option>
				<c:forEach var="item" items="${clazzList}">
					<option value="${item.id}"<c:if test="${item.id==student.clazzId}">selected="selected"</c:if>>${item.name}</option>
				</c:forEach>									
			</select>
    	<div class="input-group input-group-sm">
  		<span class="input-group-addon" id="sizing-addon3">学号：</span>
  		<input type="text"  name="code" class="form-control" id="code"  value="${student.code}" />
		</div>
        <div class="input-group input-group-sm">
  		<span class="input-group-addon" id="sizing-addon3">姓名：</span>
  		<input type="text" name="name" class="form-control" id="name"  value="${student.name}" />
		</div>
         体温是否正常：<select name="sex" class="form-control" id="sex">
        		<option value="">请选择</option>
				<c:forEach var="item" items="${sexList}">
					<option value="${item.itemCode}" <c:if test="${item.itemCode==student.sex}">selected="selected"</c:if>>${item.itemName}</option>
				</c:forEach>			
			   </select>
        是否今天从外地返校：<select name="nation" class="form-control" id="nation">
        		<option value="">请选择</option>
				<c:forEach var="item" items="${nationList}">
					<option value="${item.itemCode}" <c:if test="${item.itemCode==student.nation}">selected="selected"</c:if>>${item.itemName}</option>
				</c:forEach>	
			   </select>
		<button class="btn btn-primary btn-sm" type="submit">查询</button>
		<button class="btn btn-danger btn-sm" type="button" onclick="clearQueryForm()">清除</button>
		</form>
    </div>
</div>

<!-- 按钮触发模态框 -->
<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#addStudent">添加</button>
<!-- 模态框（Modal） -->
<div class="modal fade" id="addStudent" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">疫情上报</h4>
            </div>
            <div class="modal-body">
            <form action="" method="post" onsubmit="return false" id="addStudentForm">
            <input id="id" name="id" type="hidden" value="" />
			       		<div class="form-group">
			       			<label for="">学院</label>
			       			<select name="clazzId" id="clazzId">
								<c:forEach var="item" items="${clazzList}">
									<option value="${item.id}">${item.name}</option>
								</c:forEach>								
								</select>
			       		</div>
			       		<div class="form-group">
			       			<label for="">学号</label>
			       			<input type="text" name="code" class="form-control" id="code">
			       		</div>
			       		<div class="form-group">
			       			<label for="">姓名</label>
			       			<input type="text" name="name" class="form-control" id="name">
			       		</div>
			       		<div class="form-group">
			       			<label for="">是否今天从外地返校</label>
			       			<select name="sex" class="form-control" id="sex">
			       				<c:forEach var="item" items="${sexList}">
			       					<option value="${item.itemCode}">${item.itemName}</option>
			       				</c:forEach>
			       			</select>
			       			
			       		</div>
			       		<div class="form-group">
			       			<label for="">生日</label>
			       			<input type="date" name="birthday" class="form-control" id="birthday">
			       		</div>
			       		<div class="form-group">
			       			<label for="">体温是否正常</label>
			       			<select name="nation" class="form-control" id="nation">
			       				<c:forEach var="group" items="${nationList}">
			       					<option value="${group.itemCode}">${group.itemName}</option>
			       				</c:forEach>
			       			</select>
			       		</div>
			       		<div class="form-group">
			       			<input value="提交" class="btn btn-success" onclick="saveStudent()">
			       			<input type="reset" value="重置" class="btn btn-danger">
			       		</div>
			       	</form>


            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<div class="cont">
	<table class="table">
	    <thead>
	        <tr>
	        	<th>学院</th>
	            <th>学号</th>
	            <th>姓名</th>
	            <th>是否今天从外地返校</th>
	            <th>生日</th>
	            <th>体温是否正常</th>
	            <th>上报日期</th>
	            <th>创建人</th>
	            <th>操作</th>
	        </tr>
	    </thead>
	    <tbody>
	    	<c:forEach items="${page.rows}" var="student">
		        <tr class="active">
		            <td>${student.clazzId}</td>
		            <td>${student.code}</td>
		            <td>${student.name}</td>
		            <td>${student.sex}</td>
		            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${student.birthday}" /></td>
		            <td>${student.nation}</td>
		            <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${student.createDate}" /></td>
		            <td>${student.createName}</td>
		            <td>
		            	<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#addStudent" onclick="updateStudent(${student.id})">修改</button>
						<button type="button" class="btn btn-danger" onclick="deleteStudent(${student.id})">删除</button>
		            </td>
		        </tr>
	       </c:forEach>
	    </tbody>
	</table>
	
	<t:page url="student" />
</div>
<br>
	

</body>


<script src="plug-in/jquery-3.3.1/jquery-3.3.1.min.js"></script>
<script src="plug-in/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
</html>
