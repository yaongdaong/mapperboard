//댓글 등록
var replyService = (function () {
    function add(reply, callback, error) {
        console.log("add reply.............");

        $.ajax({
            type: 'post',
            url: '/replies/new',
            data: JSON.stringify(reply),
            contentType: "application/json",
            success: function (result) {
                console.log(result.replyDate);
                if(result!=0){
                        var tag =
                            '<li className="left clearfix" data-rno='+result.rno+'>'+
                            '<div>'+
                            '<div className="header">'+
                            '<strong className="primary-font">'+result.replyer+'</strong>'+
                            '<small className="pull-right text-muted">'+result.replyDate+'</small>'+
                            '</div>'+
                            '<p>'+result.reply+'</p>'+
                            '</div>'+
                            '</li>';
                        $("#replyData").append(tag);
                }
            },
            error: function (xhr, status, er) {
                if (error) {
                    error(er);
                }
            }
        })
    }

    // 댓글 조회
    function getList(param, callback, error) {
        var bno = param.bno;
        var page = param.page || 1;

        $.getJSON("/replies/pages/"+ bno + "/" + page+".json",
            function (data){
                if (callback) {
                    //callback(data);
                    callback(data.replyCnt, data.list);
                }
        }).fail(function (xhr, status, err) {
        if (error) {
            error();
            }
        });
    }

    // 댓글 삭제
    function remove(rno, callback, error) {
        $.ajax({
            type: 'delete',
            url: '/replies/' + rno,
            success: function (deleteResult, status, xhr) {
                if (callback) {
                    callback(deleteResult);
                }
            }, error: function (xhr, status, er) {
                if (error) {
                    error(er);
                }
            }
        });
    }

    // 댓글 수정
    function update(reply, callback, error) {
        console.log("js reply : " + reply)
        let test = JSON.parse(reply)
        console.log("RNO: " + test.rno);

        $.ajax({
            type: 'put',
            url: '/replies/' + test.rno,
            data: reply,
            contentType: "application/json; charset=utf-8",
            success: function (result, status, xhr) {
                console.log("댓글등록완료"+result);
                if(result!=0){
                    var tag =
                        '<li className="left clearfix" data-rno='+result.rno+'>'+
                        '<div>'+
                        '<div className="header">'+
                        '<strong className="primary-font">'+result.replyer+'</strong>'+
                        '<small className="pull-right text-muted">'+result.replyDate+'</small>'+
                        '</div>'+
                        '<p>'+result.reply+'</p>'+
                        '</div>'+
                        '</li>';
                    $("#replyData").append(tag);
                }
            },
            error: function (xhr, status, er) {
                if (error) {
                    error(er);
                }
            }
        });
    }

    function get(rno, callback, error) {
        $.get("/replies/" + rno + ".json", function (result) {
            if (callback) {
                callback(result);
            }
        }).fail(function (xhr, status, err) {
            if (error) {
                error();
            }
        });
    }

    //시간처리 해당일 시/분/초 전날 년/월/일
    function displayTime(timeValue) {
        var today = new Date();
        var gap = today.getTime() - timeValue;
        var dateObj = new Date(timeValue);
        var str = "";

        if (gap < (1000 * 60 * 60 * 24)) {
            var hh = dateObj.getHours();
            var mi = dateObj.getMinutes();
            var ss = dateObj.getSeconds();

            return [(hh > 9 ? '' : '0') + hh, ":", (mi > 9 ? '' : '0') + mi,
                ':', (ss > 9 ? '' : '0') + ss].join('');
        } else {
            var yy = dateObj.getFullYear();
            var mm = dateObj.getMonth();
            var dd = dateObj.getDate();

            return [yy, '/', (mm > 9 ? '' : '0') + mm, '/',
                (dd > 9 ? '' : '0') + dd].join('');
        }
    };
    return {add: add, getList: getList, remove: remove, update: update, get: get, displayTime: displayTime};
})();