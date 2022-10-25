<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%--
  Created by IntelliJ IDEA.
  User: hrkim
  Date: 2022-10-14
  Time: 오후 5:09
  To change this template use File | Settings | File Templates.
--%>

<html>
<head>
    <title>Title</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
            crossorigin="anonymous"></script>
</head>
<%@ include file="../include/nav.jsp" %>
<body>
<div class="container">
<table class="table table-bordered">
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
            <td><a class="move" href='<c:out value="${board.bno}"/>'><c:out value="${board.title}"/></a></td>
            <td><c:out value="${board.content}"></c:out></td>
            <td><c:out value="${board.writer}"></c:out></td>
            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"></fmt:formatDate></td>
        </tr>
    </c:forEach>
</table>

<%--페이징처리--%>
<nav aria-label="Page navigation example">
    <ul class="pagination">
        <c:if test="${pageMaker.prev}">
            <li class="page-item"><a class="page-link" href="${pageMaker.startPage-1}">Previous</a></li>
        </c:if>
        <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
            <li class="page-item ${pageMaker.cri.pageNum == num? "active":""}"><a class="page-link" href="${num}">${num}</a></li></c:forEach>
        <c:if test="${pageMaker.next}">
            <li class="page-item"><a class="page-link" href="${pageMaker.endPage+1}">Next</a></li>
        </c:if>
    </ul>
</nav>

<%--<div class="pull-right">--%>
<%--    <ul class="pagination">--%>
<%--        <c:if test="${pageMaker.prev}">--%>
<%--            <li class="paginate_button previous"><a href="${pageMaker.startPage-1}">Previous</a></li>--%>
<%--        </c:if>--%>

<%--        <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">--%>
<%--            <li class="paginate_button ${pageMaker.cri.pageNum == num? "active":""}"><a href="${num}">${num}</a></li>--%>
<%--        </c:forEach>--%>

<%--        <c:if test="${pageMaker.next}">--%>
<%--            <li class="paginate_button next"><a href="${pageMaker.endPage+1}">Next</a></li>--%>
<%--        </c:if>--%>
<%--    </ul>--%>
<%--</div>--%>


<form id="actionForm" action="/board/list" method="get">
    <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
    <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
</form>


<%--모달--%>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
</div>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        var result = '<c:out value="${result}"/>';
        checkModal(result);
        history.replaceState({}, null, null);

        function checkModal(result) {
            if (result === '' || history.state) {
                return;
            }
            if (parseInt(result) > 0) {
                $(".modal-body").html(
                    "게시글" + parseInt(result) + "번이 등록되었습니다.");
            }
            $("#myModal").modal("show");
        }

        $("#regBtn").on("click", function () {
            self.location = "/board/write";
        });
        var actionForm = $("#actionForm");

        $(".move").on("click", function (e) {
            e.preventDefault();
            actionForm.append("<input type='hidden' name='bno' value='" +
                $(this).attr("href") + "'>"
            );
            actionForm.attr("action", "/board/get");
            actionForm.submit();
        })

        $(".page-item a").on("click", function (e) {
        // $(".paginate_button a").on("click", function (e) {
            e.preventDefault();
            console.log("click");
            actionForm.find("input[name='pageNum']").val($(this).attr("href"));
            actionForm.submit();
        });
    });


</script>


</body>
</html>
