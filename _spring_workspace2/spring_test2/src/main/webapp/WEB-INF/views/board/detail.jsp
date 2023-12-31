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
	
	<a href="/board/list"><button type="button" class="btn btn-outline-primary">리스트로 이동</button></a>
	<a href="/board/modify?bno=${bvo.bno }"><button type="button" class="btn btn-outline-success">수정</button></a>
	<a href="/board/remove?bno=${bvo.bno }"><button type="button" class="btn btn-outline-danger">삭제</button></a>
	
	<br>
	<hr>
	
	<!-- 댓글 등록 라인 -->
	<div class="input-group mb-3">
	  <span class="input-group-text" id="cmtWriter">${bvo.writer }</span>
	  <input type="text" class="form-control" id="cmtText" aria-label="Amount (to the nearest dollar)">
	  <button type="button" class="btn btn-outline-success" id="cmtPostBtn">Post</button>
	</div>
	<!-- 댓글 표시 라인 -->
	<ul class="list-group">
	  <li class="list-group-item" id="cmtListArea"> 
	  	<div class="mb-3">
	  		<div class="fw-bold">Writer</div>
	  		content
	  	</div>
	  	<span class="badge text-bg-warning">modAt</span>
	  </li>
	</ul>
	
	<!-- 댓글 더보기 버튼 -->
	<div>
		<button type="button" class="btn btn-outline-dark" id="moreBtn" data-page="1" style="visibility:hidden">MORE+</button>
	</div>
	
	<!-- 모달창 라인 -->
	<div class="modal" id="myModal" tabindex="-1">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">Writer</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <div class="input-group mb-3">
	        	<input type="text" class="form-control" id="cmtTextMod">
		        <button type="button" class="btn btn-primary" id="cmtModBtn">Post</button>
	        </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>
	
</div>

<script type="text/javascript">
	let bnoVal = `<c:out value="${bvo.bno}" />`;
	console.log(bnoVal);
</script>

<script src="/resources/js/boardComment.js"></script>
<script type="text/javascript">
	spreadCommentList(bnoVal);
</script>
<jsp:include page="../layout/footer.jsp"></jsp:include> 