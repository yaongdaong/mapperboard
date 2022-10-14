package com.example.demo.controller;

import com.example.demo.dto.BoardDTO;
import com.example.demo.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class BoardController {

    @Autowired
    BoardService boardService;

    @GetMapping("/write")
    public String write(){
        return "board/write";
    }

    @PostMapping("/write")
    public String insert(){
//        BoardDTO getBoardDTO = boardService.getBoard(BoardDTO);
        return "board/list";
    }
}
