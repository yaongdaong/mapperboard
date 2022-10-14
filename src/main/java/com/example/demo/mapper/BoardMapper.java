package com.example.demo.mapper;

import com.example.demo.dto.BoardDTO;


public interface BoardMapper {

    void write(BoardDTO boardDTO);

    BoardDTO getBoard(BoardDTO BoardDTO);

}