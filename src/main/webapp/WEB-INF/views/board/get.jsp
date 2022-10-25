<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <!-- CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <!-- JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
            crossorigin="anonymous"></script>
</head>
<%@ include file="../include/nav.jsp" %>
<body>
<div class="container">
    <div class="form-group">
        <label>Bno</label>
        <input class="form-control" id="boardBno" name="bno" value="<c:out value="${board.bno}"/>" readonly="readonly">
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
    <c:if test="${sessionScope.member eq board.writer}">
        <button type="submit" class="btn btn-primary" data-oper="modify"
                onclick="location.href='/board/modify?bno=<c:out value="${board.bno}"/>'">수정
        </button>
    </c:if>
    <button type="button" class="btn btn-secondary" data-oper="list" onclick="location.href='/board/list'">목록</button>

    <form id="operForm" action="/board/modify" method="get">
        <input type="hidden" id="bno" name="bno" value="<c:out value="${board.bno}"/>">
        <input type="hidden" name="pageNum" value="<c:out value="${cri.pageNum}"/>">
        <input type="hidden" name="amount" value="<c:out value="${cri.amount}"/>">
    </form>

    <%--댓글창--%>
    <div class="input-group mb-3">
        <input type="text" class="form-control" placeholder="댓글을 입력하세요." aria-label="댓글을 입력하세요."
               aria-describedby="button-addon2" id="reply">
        <button class="btn btn-outline-secondary" type="button" id="addReplyBtn">입력</button>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <i class="fa fa-comments fa-fw"></i>Reply
                </div>
                <div class="panel-body">
                    <ul class="chat" id="replyData">
                        <c:forEach items="${replyList}" var="replyList">
                            <li class="left clearfix" data-rno=${replyList.rno}>
                                <div>
                                    <div class="header">
                                        <strong class="primary-font">${replyList.replyer}</strong>
                                        <small class="pull-right text-muted">${replyList.updateDate}</small>
                                    </div>
                                    <p id="selectReply${replyList.rno}">${replyList.reply}</p>
                                </div>
                            </li>
                            <button class="btn btn-primary modifyReply" type="button"
                                    data-rno=${replyList.rno}>수정
                            </button>
                            <button class="btn btn-secondary removeReply" type="button"
                                    data-rno=${replyList.rno}>삭제
                            </button>
                        </c:forEach>
                    </ul>
                </div>
                <div class="panel-footer">

                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="/static/js/reply.js"></script>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>

    // 댓글 등록
    $("#addReplyBtn").on("click", function (e) {
        e.preventDefault();
        var reply = {
            reply: $("#reply").val(),
            bno: $("#boardBno").val(),
            replyer: <c:out value="${sessionScope.member}"/>
        }
        console.log("reply : " + reply)
        replyService.add(reply);
        location.reload();
    });

    // 댓글수정
    $(".modifyReply").one("click", function (e) {
        let num = $(this).attr("data-rno");
        let reply_text = document.getElementById("selectReply" + num).innerHTML;
        let html = "<textarea>" + reply_text + "</textarea>";
        html += "<button id='modifySave" + num + "'>완료</buttonid>";
        $("#selectReply" + num).html(html);
        e.preventDefault();
        $("#modifySave" + num).on("click", function () {
            console.log("adfadfadsf : " + $("#selectReply" + num + " > textarea").val());
            var reply = {
                reply: $("#selectReply" + num + " > textarea").val(),
                bno: $("#boardBno").val(),
                replyer: <c:out value="${sessionScope.member}"/>,
                rno: num
            }
            replyService.update(JSON.stringify(reply));
            location.reload();
        })
    });


    //댓글삭제
    $(".removeReply").on("click", function (e) {
        let num = $(this).attr("data-rno");
        let id = "#selectReply" + num;

        replyService.remove(num, function (result) {
            alert(result);
            location.reload();
        });
    });

</script>
</body>
</html>
