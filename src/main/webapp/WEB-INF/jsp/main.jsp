<%@ page pageEncoding="UTF-8"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- ① -->
<!DOCTYPE html>
<html lang="${pageContext.response.locale.language}"> <!-- ② -->
<head>
<%@ include file="/WEB-INF/jspf/head.jspf"%>
<title>${title}</title> 
</head>
<body >
    <section class="container">
		<h1><%=request.getAttribute("title")%></h1> 
		<div><fmt:message key="main.welcome.msg"/></div> <!-- ③ -->
		<div><fmt:message key="common.test.msg"/></div> <!-- ③ -->
		<div>${message}</div>
		<div>${nowDate}</div>
		<a href="/post/list" role="button" class="btn btn-info">
			<fmt:message key="common.List"/></a>
		<a href="/post/write">
			<button type="button" class="btn btn-success">
				<fmt:message key="common.Write"/></button>
		</a>
	</section>
	
	<%@ include file="/WEB-INF/jspf/footer.jspf"%>
</body>
</html>
