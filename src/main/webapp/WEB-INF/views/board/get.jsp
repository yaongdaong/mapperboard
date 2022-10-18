<%--
  Created by IntelliJ IDEA.
  User: hrkim
  Date: 2022-10-17
  Time: 오후 2:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<div class="form-group">
    <label>Bno</label>
    <input class="form-control" name="bno" value="<c:out value="${board.bno}"/>" readonly="readonly">
</div>
<div class="form-group">
    <label>Title</label>
    <input class="form-control" name="title" value="<c:out value="${board.title}"/>" readonly="readonly">
</div>
<div class="form-group">
    <label>Content</label>
    <textarea class="form-control" rows="3" name="content" readonly="readonly">
       <c:out value="${board.content}"/>
   </textarea>
</div>
<div class="form-group">
    <label>Writer</label>
    <input class="form-control" name="writer" value="<c:out value="${board.writer}"/>" readonly="readonly">
</div>

<button data-oper="modify" class="btn" type="submit" onclick="location.href='/board/modify?bno=<c:out value="${board.bno}"/>'">Modify</button>
<button data-oper="list" class="btn" onclick="location.href='/board/list'">List</button>

<form id="operForm" action="/board/modify" method="get">
    <input type="hidden" id="bno" name="bno" value="<c:out value="${board.bno}"/>">
    <input type="hidden" name="pageNum" value="<c:out value="${cri.pageNum}"/>">
    <input type="hidden" name="amount" value="<c:out value="${cri.amount}"/>">
</form>
</body>
</html>
