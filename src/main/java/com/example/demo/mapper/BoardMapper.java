package com.example.demo.mapper;

import com.example.demo.dto.BoardDTO;

import java.util.List;


public interface BoardMapper {

    // 회원정보 저장
    void write(BoardDTO boardDTO);
    void insertSelectKey(BoardDTO boardDTO);

    public List<BoardDTO> getBoard();
   // BoardDTO getBoard(BoardDTO boardDTO);
    BoardDTO get(Long bno);
    public int delete(Long bno);

    public int update(BoardDTO boardDTO);
}