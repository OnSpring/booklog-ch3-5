<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%> <!-- ① -->
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/jspf/head.jspf"%>
<title>Post Form</title>
</head>
<body>
	<section class="container">
		<h2><fmt:message key="common.Write"/></h2>
		<hr />
		<%-- ② --%><sf:form method="post" 
			action="${requestScope['javax.servlet.forward.servlet_path']}"
			commandName="post"><%-- ③ --%>
			<fieldset class="form-group">
				<label for="formBookTitle"><fmt:message key="common.BookTitle"/></label>
				<sf:input id="formBookTitle" type="text" class="form-control"
					name="bookTitle"  path="bookTitle" 
					placeholder="Title input" /> <%-- ④ rm: value="${post.bookTitle}" --%>
				<sf:errors path="bookTitle" /> <!-- ⑤ -->
			</fieldset>
			<fieldset class="form-group">
				<label for="formContent"><fmt:message key="common.Content"/></label>
				<sf:textarea id="formContent" class="form-control" name="content"
					rows="3" path="content"></sf:textarea> <!-- ⑥ rm: ${post.content} -->
				<sf:errors path="content" />
			</fieldset>
			<input type="submit" class="btn btn-primary" value="<fmt:message key="common.Save"/>" />
		</sf:form>
	</section>
	<%@ include file="/WEB-INF/jspf/footer.jspf"%>
</body>
</html>
