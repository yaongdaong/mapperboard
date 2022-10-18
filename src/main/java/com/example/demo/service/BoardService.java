package com.example.demo.service;

import com.example.demo.dto.BoardDTO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface BoardService {
    void write(BoardDTO boardDTO);
    public BoardDTO get(Long bno);
  //  BoardDTO getBoard(BoardDTO boardDTO);

    public boolean modify(BoardDTO boardDTO);
    public boolean remove(Long bno);
   public List<BoardDTO> getBoard();
}
