<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!doctype html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<meta name="Keywords" content="关键词,关键词">
		<meta name="Description" content="网页描述">
		<title>Java实现cms核心技术之网页静态化 --krry</title>
		<link rel="stylesheet" href="css/animate.css"/>
		<link rel="stylesheet" type="text/css" href="css/sg.css" />
		<style type="text/css">
			*{margin:0;padding:0}
			body{background:url("images/3.jpg");background-size:cover;font-size:12px;font-family:"微软雅黑";}
			h1{text-align:center;margin-top:50px;color:#fff;text-shadow:1px 2px 2px red;font-size:26px;}
			.suc{font-size:22px;top:60px;position:absolute;text-decoration:none;color:#FF4F4F;left:87px;}
			/*box start*/
			.box{width:500px;margin:10px auto;text-align:center;}
			.box span{font-size:18px;color:#f60;}
			.box .in{margin-top:26px;outline:none;border:0;text-indent:1em;font-size:14px;font-family:"微软雅黑";}
			.box .sel{width:123px;height:20px;}
			.box .title,.author{width:182px;height:26px;}
			.box .con{float:left;margin-top:25px;margin-left:37px;}
			.box .content{height:166px;width:352px; padding:10px;text-indent:0;margin-right:37px;}
			.box .sub{width:426px;height:34px;font-size:16px;color:#fff;background:#6c0;cursor:pointer;transition:.5s;border-radius:5px;}
			.box .sub:hover{background:#f60;transition:.5s;}
			/*end box*/
		</style>
	</head>
	<body>
		<div class="jk" style="float:left;"></div>
		<h1>Java实现cms核心技术之网页静态化 --krry</h1>
		<!-- box start -->
		<div class="box">
			<span>请选择模板：</span>
			<select class="in sel" name="template">
				<option>-请选择-</option>
				<option class="op2" value="detail.tpl">新闻发布模板</option>
			</select> <br>
			<span>标题：</span><input type="text" class="in title" name="title"/><br>
			<span>作者：</span><input type="text" class="in author" name="author"/><br>
			<span class="con">内容：</span><textarea class="in content" name="content"></textarea><br>
			<input type="button" value="提交数据" class="in sub"/>
		</div>
		<!-- end box -->
		
		<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
		<script src="js/sg.js"></script>
		<script src="js/sgutil.js"></script>
		<script type="text/javascript">
			$(function(){
				var flag = true;
				$(".sub").click(function(){
					flag = true;
					fn();
				});
				
				function fn(){
					var temp = $(".op2").attr("value");
					var ti = $(".title").val();
					var au = $(".author").val();
					var con = $(".content").val();
					if($(".sel").val() == "-请选择-"){
						$.tmDialog.alert({open:"top",content:"请选择模板！！",title:"出错啦"});
						flag = false;
					}
					if(!ti){
						$.tmDialog.alert({open:"top",content:"请输入标题！！",title:"出错啦"});
						flag = false;
					}
					if(!au){
						$.tmDialog.alert({open:"top",content:"请输入作者！！",title:"出错啦"});
						flag = false;
					}
					if(!con){
						$.tmDialog.alert({open:"top",content:"请输入内容！！",title:"出错啦"});
						flag = false;
					}
					
					//ajax中数据的获取只能在data中设置，不能再name中获取
					if(flag){
						$.ajax({
							url:"msg.jsp",
							type:"post",
							data:{template:temp,title:ti,author:au,content:con},
							success:function(data){
								setTimeout(function(){
									$(".jk").html(data);
								},5000);
							}
						});
					}
				}
			});
		</script>
	</body>
</html>
