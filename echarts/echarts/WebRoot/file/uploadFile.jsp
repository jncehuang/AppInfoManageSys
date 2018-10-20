<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="userForm" name="userForm" 
	method="post" action="${pageContext.request.contextPath }/addFile.html" 
		enctype="multipart/form-data">
		<div>
			个人照片： <input type="file" name="uploadFile" id="uploadFile" />
		</div>
		<div>
			工作照片： <input type="file" name="uploadFile" id="uploadFile" />
		</div>		
		<div>
			<input type="submit">
		</div>
	</form>
</body>
</html>