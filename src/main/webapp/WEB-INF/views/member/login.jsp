<%--
  Created by IntelliJ IDEA.
  User: hrkim
  Date: 2022-10-14
  Time: 오후 2:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>로그인</title>
</head>
<%@ include file="../include/nav.jsp" %>
<body>
    <form action="login" method="post">
        <input name="userid">아이디
        <input name="passwd">비밀번호
        <input type="submit">로그인
    </form>
</body>
</html>
