<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="layout/header.jsp"/>
<h1>
	Hello world!  
</h1>
<p> The time on the server is ${serverTime }.</p>

<a href="/board/register"><button>Register Board</button></a>

<jsp:include page="layout/footer.jsp"/>