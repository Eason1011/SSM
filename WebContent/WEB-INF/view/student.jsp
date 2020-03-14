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
	<title>西北师范大学疫情上报系统</title>
	<link rel="stylesheet" href="plug-in/bootstrap-3.3.7-dist/css/bootstrap.css" />
</head>
<script type="text/javascript">
function saveStudent(){	
	alert($('#addStudentForm').serialize());
  $.post("insertStudent",$('#addStudentForm').serialize(),
  	function(data){
	  if(data=="OK"){
		  alert("信息修改成功！");
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
					  alert("删除学生疫情信息成功！");
					  window.location.reload();
				  }else{
					  alert("删除学生疫情信息失败！");
					  
				  }
			  	}
			  );
	} else {
	}
  
}
</script>
<body>
<div style="width: 100%;background: #fff;height: 88px;box-shadow: 1px 2px 6px #e1e1e1;z-index: 1;position: relative;">
	<div style="float: left;height: 88px;width: 460px;margin-left: 120px;">
		<p style="background:url(plug-in/system/images/login.jpg) no-repeat; width: 210px;height:88px;float: left;background-size:210px 86px; ">
				<a href=""></a>
		</p>
		<a style="width: 240px;display: block;height: 80px;float: right;">
				<img src="plug-in/system/images/font.png" style="height:80px;width:240px;" alt="">
		</a>
	</div>			
		<div style="float:right;padding-top:30px;padding-right:60px;">
			<span class="pull-right">
		 	您好！${user.name}
				<a href="logout">退出登录</a>
			</span>
		</div>
			
		
	</div>
<div class="alert alert-success alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  <strong>温馨提示：</strong> 您可以根据以下不同信息来搜索您需要查看的疫情信息
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
  		<input type="text" style="width:145px;" name="name" class="form-control" id="name"  value="${student.name}" />
		</div>
         是否今天从外地返校：<select name="sex" class="form-control" id="sex">
        		<option value="">请选择</option>
				<c:forEach var="item" items="${sexList}">
					<option value="${item.itemCode}" <c:if test="${item.itemCode==student.sex}">selected="selected"</c:if>>${item.itemName}</option>
				</c:forEach>			
			   </select>
        体温是否正常：<select name="nation" class="form-control" id="nation">
        		<option value="">请选择</option>
				<c:forEach var="item" items="${nationList}">
					<option value="${item.itemCode}" <c:if test="${item.itemCode==student.nation}">selected="selected"</c:if>>${item.itemName}</option>
				</c:forEach>	
			   </select>
		<button class="btn btn-primary btn-sm" type="submit">查询</button>
		<button class="btn btn-danger btn-sm" type="button" onclick="clearQueryForm()">清除</button>
		<a id="export" class="btn btn-info btn-sm" type="button">导出</a>
		</form>
    </div>
</div>

<!-- 按钮触发模态框 -->
<!--  <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#addStudent">添加</button>
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
	<table class="table"  id="tableExcel">
	    <thead>
	        <tr>
	        	<th>学院</th>
	            <th>学号</th>
	            <th>姓名</th>
	            <th>是否今天从外地返校</th>
	            <th>体温是否正常</th>
	            <th>上报日期</th>
	            <th>学院负责老师</th>
	            <th>学院电话</th>
	            <th>操作</th>
	        </tr>
	    </thead>
	    <tbody>
	    	<c:forEach items="${page.rows}" var="student">
		        <tr class="active">
		            <td >${student.clazzName}</td>
		            <td>${student.code}</td>
		            <td>${student.name}</td>
		            <td>${student.sex}</td>
		            <td>${student.nation}</td>
		            <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${student.createDate}" /></td>
		            <td>${student.clazzTeacher}</td>
		            <td>${student.clazzPhone}</td>
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


<script>
//导出数据
$("#export").click(function () {
    tableToExcel();
})

var tableToExcel = (function () {
    var uri = 'data:application/vnd.ms-excel;base64,'
    , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><meta charset="UTF-8"><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>'
    , base64 = function (s) { return window.btoa(unescape(encodeURIComponent(s))) }
    , format = function (s, c) { return s.replace(/{(\w+)}/g, function (m, p) { return c[p]; }) }
    return function () {
        //根据ID获取table表格HTML
        var table = document.getElementById("tableExcel");
        var ctx = { worksheet: 'Worksheet', table: table.innerHTML };
        document.getElementById("export").href = uri + base64(format(template, ctx));
        document.getElementById("export").download = '学生疫情表.xls';
    }
})()
</script>
</html>
