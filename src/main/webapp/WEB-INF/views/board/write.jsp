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
  <title>글쓰기</title>
</head>
<%@ include file="../include/nav.jsp" %>
<body>
<form action="write" method="post">
  <input name="title">제목
  <textarea name="content" cols="50" rows="10">내용</textarea>
  <button type="submit">제출</button>
</form>
</body>
</html>
