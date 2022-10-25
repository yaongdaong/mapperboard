<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>글쓰기</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<%@ include file="../include/nav.jsp" %>
<body>
<div class="container">
    <form action="write" method="post">
        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">제목</label>
            <input type="text" name="title" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
        </div>
        <div class="mb-3">
            <label for="exampleInputPassword1" class="form-label">작성자</label>
            <input type="text" name="writer" class="form-control" id="exampleInputPassword1"
                   value="${sessionScope.member}" readonly>
        </div>
        <div class="mb-3">
            <label class="form-label">내용</label>
            <textarea class="form-control" name="content" placeholder="Leave a comment here"
                      id="floatingTextarea"></textarea>
        </div>
        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
            <button type="submit" class="btn btn-primary">제출</button>
        </div>
    </form>

</div>
</body>
</html>
