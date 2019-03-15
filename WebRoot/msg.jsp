<%@page import="com.krry.CmsUtil"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
request.setCharacterEncoding("utf-8");
String title = request.getParameter("title");
String author = request.getParameter("author");
String content = request.getParameter("content");
String template = request.getParameter("template");
String link = "";
if(template!=null){
	Map<String,String> values = new HashMap<String,String>();
	values.put("##title##", title);
	values.put("##author##", author);
	values.put("##content##", content);
	String fileName = new Date().getTime()+"";
	String templatePath = application.getRealPath("/template/"+template);
	String htmlPath = application.getRealPath("/"+fileName+".html");
	boolean flag = CmsUtil.getHtmlByTemplate(templatePath, htmlPath, values);
	if(flag){
		link = "<a class='suc animated rotateInUpRight' target='_blank' href='"+path+"/"+fileName+".html'>发布成功，点我哦~~~~</a>";
	}else{
		link = "<a class='suc animated rotateInUpRight'>发布失败~~~~</a>";
	}
	out.print(link);
}
%>