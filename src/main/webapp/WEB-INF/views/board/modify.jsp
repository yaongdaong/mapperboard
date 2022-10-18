<%--
  Created by IntelliJ IDEA.
  User: hrkim
  Date: 2022-10-17
  Time: 오후 4:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
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

    <button type="submit" data-oper="modify" class="btn">Modify</button>
    <button type="submit" data-oper="remove" class="btn">Remove</button>
    <button type="submit" data-oper="list" class="btn">List</button>
</form>


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
                self.location = "/board/list";
                return;
            }
            formObj.submit();
        });
    });
</script>
</body>
</html>
