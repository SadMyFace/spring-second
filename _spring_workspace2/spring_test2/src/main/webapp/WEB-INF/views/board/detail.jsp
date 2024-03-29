<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<jsp:include page="../layout/header.jsp"></jsp:include> 

<div class="container-md">
<br>
<h2>Detail Page</h2>
<br>
	<c:set value="${bdto.bvo }" var="bvo" />
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
			<th>mod_at</th>
			<td>${bvo.modAt }</td>
		</tr>
		<tr>
			<th>Read_count</th>
			<td>${bvo.readCount }</td>
		</tr>
		<tr>
			<th>cmt_qty</th>
			<td>${bvo.cmtQty }</td>
		</tr>
		<tr>
			<th>has_file</th>
			<td>${bvo.hasFile }</td>
		</tr>
	</table>
	
	<!-- file line -->
	<c:set value="${bdto.flist }" var="flist" />
	<div class="col-12">
		<label for="f" class="form-label">File</label>
		<ul class="list-group list-group-flush">
  		<c:forEach items="${flist }" var="fvo">
  			<li class="list-group-item">
  				<c:choose>
  					<c:when test="${fvo.fileType == 1 }">
  						<div>
  							<img alt="" src="/upload/${fvo.saveDir }/${fvo.uuid}_th_${fvo.fileName}">
  						</div>
  					</c:when>
  					<c:otherwise>
  						<div>
  							<!-- 일반 파일 표시할 아이콘 -->
  							<a href="/upload/${fvo.saveDir }/${fvo.uuid}_${fvo.fileName}" download="${fvo.fileName }">
	  							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-image" viewBox="0 0 16 16">
								  <path d="M8.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
								  <path d="M12 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zM3 2a1 1 0 0 1 1-1h8a1 1 0 0 1 1 1v8l-2.083-2.083a.5.5 0 0 0-.76.063L8 11 5.835 9.7a.5.5 0 0 0-.611.076L3 12V2z"/>
								</svg>
							</a>
  						</div>
  					</c:otherwise>
  				</c:choose>
  				<div class="ms-2 me-auto">
  					<div class="fw-bold">${fvo.fileName }</div>
  					<span class="badge rounded-pill text-bg-primary">${fvo.fileSize }Byte</span>
  				</div>
  			</li>
  		</c:forEach>
  		</ul>
	</div>
	
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
	let bnoVal = `<c:out value="${bdto.bvo.bno}" />`;
	console.log(bnoVal);
</script>

<script src="/resources/js/boardComment.js"></script>
<script type="text/javascript">
	spreadCommentList(bnoVal);
</script>
<jsp:include page="../layout/footer.jsp"></jsp:include> 