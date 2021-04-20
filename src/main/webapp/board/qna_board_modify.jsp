<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시물 수정</title>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/qna_board_modify.css" >
	<script type="text/javascript">
		function modifyboard(){
			modifyform.submit();
		}	
	</script>
</head>
<body>
	<section id="writeForm">
		<h2>게시판 글 수정</h2>
		<form action="boardModifyPro.do" method="post" name="modifyform">
			<input type="hidden" name="BOARD_NUM" value="${article.board_num }" />
			<input type="hidden" name="page" value="${page }" />
			<table>
				<tr>
					<td class="td_left">
						<label for="BOARD_NAME">글쓴이</label>
					</td>
					<td class="td_right">
						<input type="text" name="BOARD_NAME" id="BOARD_NAME" value="${article.board_name }" />
					</td>
				</tr>
				<tr>
					<td class="td_left">
						<label for="BOARD_PASS">비밀번호</label>
					</td>
					<td class="td_right">
						<input type="password" name="BOARD_PASS" id="BOARD_PASS" />
					</td>
				</tr>
				<tr>
					<td class="td_left">
						<label for="BOARD_SUBJECT">제목</label>
					</td>
					<td class="td_right">
						<input type="text" name="BOARD_SUBJECT" id="BOARD_SUBJECT" value="${article.board_subject }" />
					</td>
				</tr>
				<tr>
					<td class="td_left">
						<label for="BOARD_CONTENT">내용</label>
					</td>
					<td class="td_right">
						<textarea id="BOARD_CONTENT" name="BOARD_CONTENT" cols="40" rows="15">
							${article.board_content }
						</textarea>
					</td>
				</tr>
			</table>
			<section id = "commandCell">
				<a href="javascript:modifyboard()">[수정]</a>&nbsp;&nbsp;
				<a href="javascript:history.go(-1)">[뒤로가기]</a>
			</section>
		</form>
	</section>
</body>
</html>