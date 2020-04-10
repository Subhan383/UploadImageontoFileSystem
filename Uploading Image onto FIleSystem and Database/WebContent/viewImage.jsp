<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="org.studyeasy.hibernate.entity.Files" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Image</title>
</head>
<body>
<%! Files file; String path; %>
<% file=(Files)request.getAttribute("file");
   path=(String)request.getAttribute("path");
%>
File ID: <%=file.getId() %> | File name: <%=file.getFileName() %>
<%
if(file.getLabel()!=null)
	out.print("| Label: "+ file.getLabel());
%>
<%
if(file.getCaption()!=null)
	out.print("| Caption: "+ file.getCaption());
%> 
|<a href="${pageContext.request.contextPath }">Home</a>
|<a href="${pageContext.request.contextPath }/ImageUpload?action=listingImages">List available images</a>
<hr/>
<img  src="<%=path+file.getFileName() %>">
</body>
</html>