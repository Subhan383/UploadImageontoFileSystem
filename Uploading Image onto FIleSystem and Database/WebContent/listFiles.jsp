<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="org.studyeasy.hibernate.entity.Files" %>
    <%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Listing the Images</title>
</head>
<%! String form;int fileId; %>





<body>
<h1>Listing images</h1>
<table border="1">
<tr>
<th>Preview</th>
<th>Available Information</th>
<th>Update Information</th>
<th>Available Action</th>
<%

String path=(String) request.getAttribute("path");
List<Files> files= (List<Files>) request.getAttribute("files");
for(Files file: files){
	out.print("<tr><td><img src="+path+file.getFileName()+" height='200'></td>");
	out.print("<td><ul>"+"<li>File ID: "+file.getId()+"</li>"+"<li>File name: "+file.getFileName()+"</li>"
			+"<li>File Label: "+file.getLabel()+"</li>"+"<li>File Caption: "+file.getCaption()+"</li>"+"</ul></td>");
	fileId=file.getId();
	String form="<form action='ImageUpload' method='post'>"+
            "Label: <input type='text' name='label'/><br/><br/> "+"Caption: <input type='text' name='caption' /><br/><br/>"+
            "<input type='hidden' name='fileId' value='"+fileId+"'/>"+"<input type='hidden' name='action' value='updateInformation'/>"+"<input type='hidden' name='fileName' value='"+file.getFileName()+"'/>"+"<input type='submit' value='update'>"+"</form>";
    out.print("<td>"+form+"</td>"); 
    out.print("<td><ul><li><a href='"+request.getContextPath()+"/ImageUpload?action=viewImage&fileId="+file.getId()+"'>View Image</a></li>");
    out.print("<li><a href='"+request.getContextPath()+"/ImageUpload?action=deleteImage&fileId="+file.getId()+"' onclick=\"if(!confirm('Are you sure to delete the image?')) return false\">Delete Image</a></li></ul></td></tr>");
}

%>
</table>
</body>
</html>