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
<form action="join" method="post">
  <input name="userid">아이디
  <input name="passwd">비밀번호
  <input type="submit">회원가입
</form>
</body>
</html>
