package com.example.demo.service;

import com.example.demo.dto.BoardDTO;
import com.example.demo.dto.Criteria;
import com.example.demo.mapper.BoardMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {

    private BoardMapper boardMapper;

    @Override
    public void write(BoardDTO boardDTO) {
        boardMapper.write(boardDTO);
    }

    @Override
    public List<BoardDTO> getBoard(Criteria cri){
        return boardMapper.getListWithPaging(cri);
    }

//    @Override
//    public BoardDTO getBoard(BoardDTO boardDTO) {
//
//        return boardMapper.getBoard(boardDTO);
//    }

    @Override
    public BoardDTO get(Long bno){
        return boardMapper.get(bno);
    }

    @Override
    public boolean modify(BoardDTO boardDTO){
        return boardMapper.update(boardDTO) ==1;
    }

    @Override
    public boolean remove(Long bno){
        return boardMapper.delete(bno) == 1;
    }

    @Override
    public int getTotal(Criteria cri){
        return boardMapper.getTotalCount(cri);
    }
}