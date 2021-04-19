<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/list.css" >
<style>
#registForm{
	width: 500px;
	height: 600px;
	border: 1px solid red;
	margin: auto;
}

h2 {
	text-align: center;
}

h4 {
	text-align: center;
}

table {
	margin: auto;
	width: 800px;
	text-align: center;
	border-collapse: collapse;
}

td {
	border: 1px solid #d9d9d9;
}

span {
	color: red;
}
#tr_top {
	border-top: 2px solid red;
	border-bottom: 2px solid red;
	background: #f2f2f2;
	text-align: center;
}

#listForm {
	margin: auto;
	width: 80%;
	height: 400px;	
}

#pageList {
	margin: auto;
	width: 500px;
	text-align: center;
}

#emptyArea {
	margin: auto;
	width: 500px;
	text-align: center;
}
</style>
</head>
<body>
<%-- ${articleList } --%>
	<!-- 게시판 리스트 -->
	<section id="listForm">
		<h2>
			글  목록
		</h2>
		<h4><a href="boardWriteForm.do">게시판 글쓰기</a></h4>
		<table>
			<tr id="tr_top">
				<td>번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>날짜</td>
				<td>조회수</td>
			</tr>
			<c:forEach var="board" items="${articleList }">
				<tr>
					<td>${board.board_num }</td>
					<td>
					<a href="boardDetail.do?board_num=${board.board_num }&page=${pageInfo.page }">
					${board.board_subject }</a>
					</td>
					<td>${board.board_name }</td>
					<td>${board.board_date }</td>
					<td>${board.board_readcount }</td>
				</tr>
			</c:forEach>
		</table>
	</section>
	<h4>${pageInfo }</h4>
	<%-- <section id="pageList">
			<c:if test="${pageInfo.page <= 1 }">
				[이전]&nbsp;
			</c:if>
			<c:if test="${pageInfo.page > 1 }">
				<a href="boardList.do?page=${pageInfo.page - 1 }">[이전]</a>&nbsp;
			</c:if>
			<c:forEach var="a" begin="1" end="${pageInfo.endPage }">
				<c:if test="${a == pageInfo.page }">
					<span>[${a}]</span>&nbsp;
				</c:if>
				<c:if test="${a ne pageInfo.page }">
					<a href="boardList.do?page=${a }">[${a }]</a>&nbsp;
				</c:if>
			</c:forEach>
				
			<c:if test="${pageInfo.page >= pageInfo.maxPage }">
				[다음]&nbsp;
			</c:if>
			<c:if test="${pageInfo.page < pageInfo.maxPage }">
				<a href="boardList.do?page=${pageInfo.page + 1 }">[다음]</a>&nbsp;
			</c:if>
	</section> --%>
	<c:choose>
		<c:when test="${fn:length(articleList) != 0 && pageInfo.listCount > 0 }">
			<section id="pageList">
				<c:choose>
					<c:when test="${pageInfo.page <= 1 }">
						[이전]&nbsp;
					</c:when>
					<c:otherwise>
						<a href="boardList.do?page=${pageInfo.page - 1 }">[이전]</a>&nbsp;
					</c:otherwise>
				</c:choose>
				
				<c:forEach var="a" begin="1" end="${pageInfo.endPage }">
					<c:choose>
						<c:when test="${a == pageInfo.page }">
							<span>[${a }]</span>&nbsp;
						</c:when>
						<c:otherwise>
							<a href="boardList.do?page=${a }">[${a }]</a>&nbsp;
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<c:choose>
					<c:when test="${pageInfo.page >= pageInfo.maxPage }">
						[다음]&nbsp;
					</c:when>
					<c:otherwise>
						<a href="boardList.do?page=${pageInfo.page + 1 }">[다음]</a>&nbsp;
					</c:otherwise>
				</c:choose>
			</section>
		</c:when>
		<c:otherwise>
			<section>등록된 글이 없습니다.</section>
		</c:otherwise>
	</c:choose>
</body>
</html>