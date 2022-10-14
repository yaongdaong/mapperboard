package com.example.demo.service;

import com.example.demo.dto.BoardDTO;

public interface BoardService {
    void write(BoardDTO boardDTO);

    BoardDTO getBoard(BoardDTO boardDTO);
}
