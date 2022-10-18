<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: hrkim
  Date: 2022-10-14
  Time: 오후 5:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
<table>
    <thead>
    <tr>
        <th>번호</th>
        <th>제목</th>
        <th>내용</th>
        <th>글쓴이</th>
        <th>작성일</th>
    </tr>
    </thead>

<c:forEach items="${list}" var="board">
    <tr>
        <td><c:out value="${board.bno}"></c:out></td>
        <td><a href='/board/get?bno=<c:out value="${board.bno}"/>'><c:out value="${board.title}"></c:out></a></td>
        <td><c:out value="${board.content}"></c:out></td>
        <td><c:out value="${board.writer}"></c:out></td>
        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"></fmt:formatDate></td>
    </tr>
</c:forEach>
</table>

<%--모달--%>
<div class="modal fade" id="moModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aire-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                <h4 class="modal-title" id="myModalLabel">Modal title</h4>
            </div>
            <div class="modal-body">
                <p>처리가 완료되었습니다.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">
    $(document).ready(function(){
        var result = '<c:out value="${result}"/>';
        checkModal(result);

        function checkModal(result){
            if(result===''){
                return;
            }
            if(parseInt(result)>0){
                $(".modal-body").html("게시글"+parseInt(result)+"번이 등록되었습니다.");
            }
            $("#myModal").modal("show");
        }
    });
</script>
</body>
</html>
