<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="t" uri="http://www.nwnu.cn/common/"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>西北师范大学疫情上报系统</title>
<link rel="stylesheet" href="plug-in/system/css/style.css" />
<link rel="stylesheet" href="plug-in/bootstrap-3.3.7-dist/css/bootstrap.css" />
</head>
<script type="text/javascript">
function saveStudent(){	
	alert($('#addStudentForm').serialize());
  $.post("insertStudent",$('#addStudentForm').serialize(),
  	function(data){
	  if(data=="OK"){
		  alert("疫情信息上报成功！");
		  window.location.reload();
		  clearFormData();
	  }else{
		  alert("你的操作失败！");
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
	var r = confirm("你确定要删除吗");
	if (r == true) {
		$.post("deleteStudent",{"id":id},
			  	function(data){
				  if(data=="OK"){
					  alert("删除学生信息成功！");
					  window.location.reload();
				  }else{
					  alert("删除学生信息失败！");
					  
				  }
			  	}
			  );
	} else {
	}
  
}
</script>
<body>
	<div class="s_top">
		<div class="s_top_left">
			<p style="background:url(plug-in/system/images/login.jpg) no-repeat; width: 210px;height:88px;float: left;background-size:210px 86px; ">
				<a href=""></a>
			</p>
			<a class="s_top_img" href="">
				<img src="plug-in/system/images/font.png" style="height:80px;width:240px;" alt="">
			</a>
		</div>
		<div class="s_top_right">
			欢迎来到西北师范大学疫情上报系统！
			<a href="" class="s_top_a1">免费注册</a>
			<a href="" class="s_top_a2">帮助中心</a>
		</div>
	</div>


	<div class="s_cen">
		<div class="s_cen_top">
			<img src="plug-in/system/images/student.png" style="height:100%;width:30%;" alt="">
<!-- 按钮触发模态框 -->
<!-- 按钮触发模态框 -->
<button style="display:inline-block;" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#addStudent">添加</button>
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

<div class="alert alert-danger alert-dismissible" role="alert" style="display:inline-block;float:right;margin-top:20px;">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  <strong>温馨提示：</strong> 如果你填报的信息有误，请你联系学院负责老师进行修改！
</div>
		</div>
		<div class="s_cen_left">
			<img src="plug-in/system/images/cen_left.png" style="height:100%;width:100%;" alt="">
		</div>
		<div class="s_cen_right">
			<div class="s_cen_right1">
				<a href="" class="s_cen_a1">帐号登录</a>
				<span>|</span>
				<span href="" class="s_cen_a2">老师登录入口</span>
			</div>
			<form id="loginform" action="login" method="post">
				<div class="s_cen_right2">
				<div class="input-group input-group-lg s_cen_input1">
					<span class="input-group-addon glyphicon glyphicon-user"></span>
					<input id="code" type="text" name="code" class="form-control" placeholder="请输入用户名/邮箱/手机号" aria-describedby="sizing-addon1">
				</div>

				<div class="input-group input-group-lg s_cen_input1">
					<span class="input-group-addon glyphicon glyphicon-lock"></span>
					<input id="password" type="password" name="password" class="form-control" placeholder="密码" aria-describedby="sizing-addon1">
				</div>

				<div class="btn-group s_cen_input1" role="group">
					<button type="submit" class="btn btn-danger s_cen_input1">登录</button>
				</div>
				<div class="s_cen_right3">
				<div class="s_auto">
					<input type="checkbox" class="check" id="auto" name="remember" value="yes">
					<label for="auto">自动登录</label>	
				</div>
				<a class="s_right3_a1" href="">免费注册</a>
				<a class="s_right3_a2" href="">忘记密码</a>
				</div>
			</div>	
			</form>
			<div class="s_cen_right4">
				<img src="plug-in/system/images/s_login_more.jpg" alt="">
			</div>	
		</div>
	</div>




	<div class="s_footer" style="height: 90px;">
     <div class="s_foot">
          <p>© &nbsp;西北师范大学&nbsp; 2020 <a href="https://www.nwnu.edu.cn/">nwnu.edu.cn.com</a>  All &nbsp;Rights Reserved&nbsp;&nbsp;<a target="_blank" href="#">京ICP证110141号</a>&nbsp;&nbsp;京公网安备1101050188221</p>
          <p class="red">版权所有：IEason&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;github地址：<a href="https://github.com/Eason1011">github.com/Eason1011</a></p>
     </div>
</div>
</body>

<script src="plug-in/jquery-3.3.1/jquery-3.3.1.min.js"></script>
<script src="plug-in/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
</html>
