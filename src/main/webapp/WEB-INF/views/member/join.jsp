<%--
  Created by IntelliJ IDEA.
  User: hrkim
  Date: 2022-10-14
  Time: 오후 3:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
  <title>회원가입</title>
</head>
<%@ include file="../include/nav.jsp" %>
<body>
<div class="container">
<form action="join" method="post">
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">아이디</label>
    <input type="text"  name="userid" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">비밀번호</label>
    <input type="password" name="passwd" class="form-control" id="exampleInputPassword1">
  </div>
  <div class="d-grid gap-2 d-md-flex justify-content-md-end">
    <button type="submit" class="btn btn-primary">로그인</button>
  </div>
</form>
</div>
<%--<form action="join" method="post">--%>
<%--  <input name="userid">아이디--%>
<%--  <input name="passwd">비밀번호--%>
<%--  <input type="submit">회원가입--%>
<%--</form>--%>
</body>
</html>
