<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path"
       value="${pageContext.request.contextPath}" />
<div>
  <a href="${path}/">main</a>
  <a href="${path}/login">로그인</a>
  <a href="${path}/join">회원가입</a>
  <a href="${path}/board/write">글쓰기</a>
  <a href="${path}/board/list">게시판</a>
</div>
<hr>