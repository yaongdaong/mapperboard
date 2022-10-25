package com.example.demo.mapper;

import com.example.demo.dto.ReplyDTO;

import java.util.List;

public interface ReplyMapper {
    // 등록
    public int insert(ReplyDTO replyDTO);
    public ReplyDTO read(Long rno);
    public int delete(Long rno);
    public int update(ReplyDTO replyDTO);
    List<ReplyDTO> getList(Long bno);
}
