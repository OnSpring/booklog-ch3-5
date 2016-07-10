<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/jspf/head.jspf"%>
<title>${post.bookTitle}</title>
</head>
<body>
	<section class="container">
		<article>
			<h2>${post.bookTitle}</h2>
			<hr />
			<div>${post.content}</div>
			<div>
				<fmt:formatDate value="${post.createdAt}" type="both" />
			</div>
		</article>
		<a href="/post/list">
			<button type="button" class="btn btn-info">
				<fmt:message key="common.List" />
			</button>
		</a> <a href="/post/${post.id}/edit">
			<button type="button" class="btn btn-warning">
				<fmt:message key="common.Edit" />
			</button>
		</a> <a href="/post/${post.id}/delete" id="delete">
			<button type="button" class="btn btn-danger">
				<fmt:message key="common.Delete" />
			</button>
		</a>

		<hr>
		
		<div id="comment_list"></div>
		<br>
		<form action="/comments" method="post" id="comment_form">
			<input type="hidden" name="postId" value="${post.id}">
			<div class="media">
				<div class="media-body">
					<textarea name="content" class="form-control" rows="2"></textarea>
					<h5 class="media-heading">
						<input type="text" name="userName" value="">
					</h5>
				</div>
				<div class="media-right">
					<button class="btn" type="submit">
						<fmt:message key="common.Save" />
					</button>
				</div>
			</div>
		</form>

	</section>
	<%@ include file="/WEB-INF/jspf/footer.jspf"%>
	<script src="/webjars/mustachejs/mustache.min.js"></script><!-- ① -->
	<script id="template" type="x-tmpl-mustache">
{{#.}}
<div class="media">
  <div class="media-body">
	{{{content}}}<br>
	<h5 class="media-heading" style="display: inline-block;">{{userName}}</h5> on {{createdAt}}
	<button type="button" class="btn btn-danger btn-sm" onclick="if(!confirm('<fmt:message key="post.delete.btn.msg"/>')){return false;} deleteComment({{postId}}, {{id}});"><fmt:message key="common.Delete" /></button>
    <br>
  </div>
</div>
{{/.}}
</script>
	<script type="text/javascript">
		$("#delete").click(function() {
			if (!confirm('<fmt:message key="post.delete.btn.msg"/>')) {
				return false;
			}
		});

		$("#comment_form").submit(function(event) {
			var form = $(this);
			$.ajax({
				type : form.attr('method'),
				url : form.attr('action'),
				data : form.serialize(),
				dataType : 'json',
				success : function(data, status) {
					loadComment();
					form[0].reset();
				},
				error : function(data, status) {
					alert(data.responseJSON.message);
				}
			});
			event.preventDefault();
		});

		var template = $('#template').html();
		Mustache.parse(template);
		function loadComment() {
			$.ajax({
				type : "GET",
				url : "/comments",
				data : "postId=${post.id}",
				dataType : 'json',
				cache : false,
				success : function(data, status) {
					$('#comment_list').html(Mustache.render(template, data));
				},
				error : function(data, status) {
					alert("error");
				}
			}).always(function() {
			});
		}

		function deleteComment(postId, commentId) {
			$.ajax({
				type : "DELETE",
				url : "/comments/" + commentId + "?postId=" + postId,
				dataType : 'json',
				success : function(data, status) {
					loadComment();
				},
				error : function(data, status) {
					alert(data.responseJSON.message);
				}
			});
		}
		
		loadComment();
	</script>

</body>
</html>
