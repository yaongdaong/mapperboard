package com.example.demo.service;

import com.example.demo.dto.ReplyDTO;

import java.util.List;

public interface ReplyService {
    //댓글 등록
    int register(ReplyDTO replyDTO);

    public ReplyDTO get(Long rno);
    // 댓글 조회
    List<ReplyDTO> getList(Long bno);
    // 댓글 수정
    int modify(ReplyDTO replyDTO);
   //댓글 삭제
    int remove(Long rno);
}
