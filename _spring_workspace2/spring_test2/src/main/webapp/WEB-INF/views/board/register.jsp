<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../layout/header.jsp"></jsp:include> 

<form action="/board/register" method="post" enctype="multipart/form-data">
	<div class="mb-3">
	  <label for="title" class="form-label">Title</label>
	  <input type="text" name="title" class="form-control" id="title" placeholder="title">
	</div>
	<div class="mb-3">
	  <label for="writer" class="form-label">Writer</label>                       
	  <input type="text" name="writer" class="form-control" id="writer" placeholder="writer">
	</div>
	<div class="mb-3">
	  <label for="content" class="form-label">Content</label>
	  <textarea name="content" class="form-control" id="content" rows="3"></textarea>
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
	
	<button type="submit" class="btn btn-primary" id="regBtn">Register</button>
</form>
<script src="/resources/js/boardRegister.js"></script>
<jsp:include page="../layout/footer.jsp"></jsp:include> 