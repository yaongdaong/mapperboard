<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

<nav class="navbar navbar-expand-lg bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="${path}/">Home</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
      <div class="navbar-nav">
        <c:choose>
          <c:when test="${sessionScope.member != null}">
            <a class="nav-link" href="${path}/board/write">글쓰기</a>
            <a class="nav-link" href="${path}/board/list">게시판</a>
            <a class="nav-link" href="${path}/logout">로그아웃</a>
          </c:when>
          <c:otherwise>
            <a class="nav-link" href="${path}/login">로그인</a>
            <a class="nav-link" href="${path}/join">회원가입</a>
          </c:otherwise>
        </c:choose>
            </div>
    </div>
  </div>
</nav>

<hr>