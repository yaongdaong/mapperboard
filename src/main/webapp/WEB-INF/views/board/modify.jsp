<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <!-- JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
<form role="form" action="/board/modify" method="post">
    <div class="form-group">
        <label>Bno</label>
        <input class="form-control" name="bno" value="<c:out value="${board.bno}"/>" readonly="readonly">
    </div>

    <div class="form-group">
        <label>Title</label>
        <input class="form-control" name="title" value="<c:out value="${board.title}"/>">
    </div>

    <div class="form-group">
        <label>Content</label>
        <textarea class="form-control" rows="3" name="content">
       <c:out value="${board.content}"/>
   </textarea>
    </div>

    <div class="form-group">
        <label>Writer</label>
        <input class="form-control" name="writer" value="<c:out value="${board.writer}"/>" readonly="readonly">
    </div>

    <div class="form-group">
        <label>RegDate</label>
        <input class="form-control" name="regDate"
               value="<fmt:formatDate pattern = "yyyy/MM/dd" value="${board.regdate}"/>" readonly="readonly">
    </div>

    <button class="btn btn-primary" type="submit" data-oper="modify" class="btn">Modify</button>
    <button class="btn btn-secondary" type="submit" data-oper="remove" class="btn">Remove</button>
    <button class="btn btn-success" type="submit" data-oper="list" class="btn">List</button>

    <input type="hidden" name="pageNum" value="<c:out value="${cri.pageNum}"/>">
    <input type="hidden" name="amount" value="<c:out value="${cri.amount}"/>">
</form>

</div>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        var formObj = $("form");
        $('button').on("click", function (e) {
            e.preventDefault();
            var operation = $(this).data("oper");
            console.log(operation);
            if (operation === 'remove') {

                formObj.attr("action", "/board/remove");
            } else if (operation === 'list') {
                //move to list
                formObj.attr("action", "/board/list").attr("method", "get");
                var pageNumTag = $("input[name='pageNum']").clone();
                var amountTag = $("input[name='amount']").clone();
                formObj.empty();
                formObj.append(pageNumTag);
                formObj.append(amountTag);
            }
            formObj.submit();
        });
    });
</script>
</body>
</html>
