package com.example.demo.controller;

import com.example.demo.dto.BoardDTO;
import com.example.demo.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Date;

@Controller
@RequestMapping("/board/*")
public class BoardController {

    @Autowired
    BoardService boardService;

    @GetMapping("/write")
    public String write(){
        return "board/write";
    }

    @PostMapping("/write")
    public String write(BoardDTO boardDTO, RedirectAttributes rttr){
        System.out.println(boardDTO);
        boardDTO.setRegdate(new Date());
        boardService.write(boardDTO);
        rttr.addFlashAttribute("result", boardDTO.getBno());

//        BoardDTO getBoardDTO = boardService.getBoard(BoardDTO);
        return "redirect:/board/list";
    }

    @GetMapping("/list")
    public void list(Model model) {
        model.addAttribute("list",boardService.getBoard());
    }

    @GetMapping({"/get","/modify"})
    public void get(@RequestParam("bno") Long bno, Model model){

        BoardDTO boardDTO = boardService.get(bno);

        model.addAttribute("board", boardDTO);
    }

    @PostMapping("/modify")
    public String modify(BoardDTO boardDTO){
        boardService.modify(boardDTO);
        return "redirect:/board/get?bno="+ boardDTO.getBno();
    }

    @PostMapping("/remove")
    public String remove(@RequestParam("bno") Long bno, RedirectAttributes rttr){
        if(boardService.remove(bno)){
            rttr.addFlashAttribute("result","success");
        }
        return "redirect:/board/list";
    }

}
