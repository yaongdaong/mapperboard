package com.example.demo.service;

import com.example.demo.dto.BoardDTO;
import com.example.demo.dto.Criteria;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface BoardService {
     public void write(BoardDTO boardDTO);
    public BoardDTO get(Long bno);
  //  BoardDTO getBoard(BoardDTO boardDTO);

    public boolean modify(BoardDTO boardDTO);
    public boolean remove(Long bno);
   public List<BoardDTO> getBoard(Criteria cri);
   public int getTotal(Criteria cri);
}
