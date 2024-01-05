<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<jsp:include page="../layout/header.jsp"></jsp:include> 

<div class="container-md">
<br>
<h2>Detail Page</h2>
<br>
	<c:set value="${BoardVO }" var="bvo" />
	<table class="table">
		<tr>
			<th>Bno</th>
			<td>${bvo.bno }</td>
		</tr>
		<tr>
			<th>Title</th>
			<td>${bvo.title }</td>
		</tr>
		<tr>
			<th>Writer</th>
			<td>${bvo.writer }</td>
		</tr>
		<tr>
			<th>Content</th>
			<td>${bvo.content }</textarea></td>
		</tr>
		<tr>
			<th>Reg_date</th>
			<td>${bvo.regAt }</td>
		</tr>
		<tr>
			<th>Read_count</th>
			<td>${bvo.modAt }</td>
		</tr>
		<tr>
			<th>Read_count</th>
			<td>${bvo.readCount }</td>
		</tr>
		<tr>
			<th>Read_count</th>
			<td>${bvo.cmtQty }</td>
		</tr>
		<tr>
			<th>Read_count</th>
			<td>${bvo.hasFile }</td>
		</tr>
	</table>
	
	<a href="/board/list"><button type="button" class="btn btn-primary">리스트로 이동</button></a>
	<a href="/board/modify?bno=${bvo.bno }"><button type="button" class="btn btn-success">수정</button></a>
	<a href="/board/remove?bno=${bvo.bno }"><button type="button" class="btn btn-danger">삭제</button></a>
</div>


<jsp:include page="../layout/footer.jsp"></jsp:include> 