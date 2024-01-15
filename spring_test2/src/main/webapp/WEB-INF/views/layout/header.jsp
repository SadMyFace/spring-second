<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
      
      
      	<!-- 홈, 게시반 보기 -->
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/board/list">게시판 보기</a>
        </li>
        
        
        <!-- 현재 인증한 사용자의 정보를 가져와서 해당 권한이 있는지 확인 -->
        <!-- 현재 사용자의 정보는 principal -->
        <!-- anyMatch() : stream 매칭 메서드(최소한 1개의 요소가 주어진 조건에 맞는지 조사) -->
        <sec:authorize access="isAuthenticated()">
        <sec:authentication property="principal.mvo.email" var="authEmail"/>
        <sec:authentication property="principal.mvo.nickName" var="authNick"/>
        <sec:authentication property="principal.mvo.authList" var="auths"/>
        
        
        <!-- 게시판 작성 -->
        <li class="nav-item">
          <a class="nav-link" href="/board/register">게시판 작성</a>
        </li>
        
        
        <c:choose>
        	<c:when test="${auths.stream().anyMatch(authVO -> authVO.auth.equals('ROLE_ADMIN')).get() }">
        		<li class="nav-item">
		          <a class="nav-link" href="/member/list">회원 리스트 ${authNick }(${authEmail }/ADMIN)</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="/member/modify">회원 정보 수정 ${authNick }(${authEmail })</a>
		        </li>
        	</c:when>
        	<c:otherwise>
        		<li class="nav-item">
		          <a class="nav-link" href="/member/modify">회원 정보 수정 ${authNick }(${authEmail })</a>
		        </li>
        	</c:otherwise>
        </c:choose>    
      
      
      	<!-- 로그아웃 -->
        <li class="nav-item">
          	<a class="nav-link" href="" id="logoutLink">로그아웃</a>
        </li>
        <form action="/member/logout" method="post" id="logoutForm">
        	<!-- 인증된(로그인한 계정의) 이메일 -->
        	<input type="hidden" name="email" value="${authEmail }">
        </form>
       	</sec:authorize>
       	     
        
        <!-- 로그인, 회원가입 -->
        <sec:authorize access="isAnonymous()">
	    <li class="nav-item">
	        <a class="nav-link" href="/member/login">로그인</a>
	    </li> 
	    <li class="nav-item">
	        <a class="nav-link" href="/member/register">회원가입</a>
	    </li> 
	    </sec:authorize>
      </ul>
    </div>
  </div>
</nav>
</head>

<script type="text/javascript">
document.getElementById('logoutLink').addEventListener('click', (e) =>{
    e.preventDefault();
    document.getElementById('logoutForm').submit();
    
})</script>

