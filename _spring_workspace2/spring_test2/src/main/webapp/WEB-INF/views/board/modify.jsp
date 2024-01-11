<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<jsp:include page="../layout/header.jsp"></jsp:include> 

<div class="container-md">
<br>
<h2>Modify Page</h2>
<br>
<c:set value="${bdto.bvo }" var="bvo" />
<form action="/board/modify" method="post" enctype="multipart/form-data">


	<table class="table">
		<tr>
			<th>Bno</th>
			<td><input type="text" name="bno" class="form-control" id="bno" value="${bvo.bno }" readonly="readonly"></td>
		</tr>
		<tr>
			<th>Title</th>
			<td><input type="text" name="title" class="form-control" id="title" value="${bvo.title }"></td>
		</tr>
		<tr>
			<th>Writer</th>
			<td><input type="text" name="writer" class="form-control" id="writer" value="${bvo.writer }" readonly="readonly"></td>
		</tr>
		<tr>
			<th>Content</th>
			<td><textarea name="content" class="form-control" id="content" rows="3">${bvo.content }</textarea></td>
		</tr>
		<tr>
			<th>Reg_date</th>
			<td><input type="text" name="reg_date" class="form-control" id="regAt" value="${bvo.regAt }" readonly="readonly"></td>
		</tr>
		<tr>
			<th>mod_at</th>
			<td><input type="text" name="read_count" class="form-control" id="modAt" value="${bvo.modAt }" readonly="readonly"></td>
		</tr>
		<tr>
			<th>Read_count</th>
			<td><input type="text" name="read_count" class="form-control" id="readCount" value="${bvo.readCount }" readonly="readonly"></td>
		</tr>
		<tr>
			<th>cmt_qty</th>
			<td><input type="text" name="read_count" class="form-control" id="cmtQty" value="${bvo.cmtQty }" readonly="readonly"></td>
		</tr>
		<tr>
			<th>has_file</th>
			<td><input type="text" name="read_count" class="form-control" id=hasFile" value="${bvo.hasFile }" readonly="readonly"></td>
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
  							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-image" viewBox="0 0 16 16">
							  <path d="M8.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
							  <path d="M12 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zM3 2a1 1 0 0 1 1-1h8a1 1 0 0 1 1 1v8l-2.083-2.083a.5.5 0 0 0-.76.063L8 11 5.835 9.7a.5.5 0 0 0-.611.076L3 12V2z"/>
							</svg>
  						</div>
  					</c:otherwise>
  				</c:choose>
  				<div class="ms-2 me-auto">
  					<div class="fw-bold">${fvo.fileName }</div>
  					<span class="badge rounded-pill text-bg-primary">${fvo.fileSize }Byte</span>
  					<button type="button" data-uuid=${fvo.uuid } class="btn btn-sm btn-outline-danger file-x">X</button>
  				</div>
  			</li>
  		</c:forEach>
  		</ul>
	</div>
	
	<!-- file 입력 라인 추가 -->
	<div class="mb-3">
	  <label for="file" class="form-label">fileUpload</label>                       
	  <input type="file" name="files" class="form-control" id="files" multiple="multiple" style="display:none">
	  <!-- 파일 버튼 트리거 사용하기 위해서 주는 버튼 -->
	  <button type="button" class="btn btn-primary" id="trigger">FileUpload</button>
	</div>
		<!-- 첨부파일 표시될 영역 -->
	<div class="mb-3" id="fileZone">
		
	</div>
	
	
	<button type="submit" class="btn btn-success" id="regBtn">수정</button>
	<a href="/board/list"><button type="button" class="btn btn-primary">리스트로 이동</button></a>
</form>
</div>

<script src="/resources/js/boardModify.js"></script>
<script src="/resources/js/boardRegister.js"></script>
<jsp:include page="../layout/footer.jsp"></jsp:include> 