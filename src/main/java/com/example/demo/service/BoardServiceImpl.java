package com.example.demo.service;

import com.example.demo.dto.BoardDTO;
import com.example.demo.dto.MemberDTO;
import com.example.demo.mapper.BoardMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService{

    private BoardMapper boardMapper;



    @Override
    public void write(BoardDTO boardDTO) {
        boardMapper.write(boardDTO);
    }

    @Override
    public BoardDTO getBoard(BoardDTO boardDTO){
        return boardMapper.getBoard(boardDTO);
    }
}