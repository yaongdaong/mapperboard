package com.example.demo.controller;

import com.example.demo.dto.BoardDTO;
import com.example.demo.dto.Criteria;
import com.example.demo.dto.PageDTO;
import com.example.demo.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Date;

@Controller
@RequestMapping("/board/*")
@SessionAttributes("member")
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

//    @GetMapping("/list")
//    public void list(Criteria cri, Model model) {
//        model.addAttribute("list",boardService.getBoard(cri));
//    }

    @GetMapping({"/get","/modify"})
    public void get(@RequestParam("bno") Long bno,@ModelAttribute("cri")Criteria cri, Model model){

        BoardDTO boardDTO = boardService.get(bno);

        model.addAttribute("board", boardDTO);
    }

    @PostMapping("/modify")
    public String modify(BoardDTO boardDTO, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr){

       if(boardService.modify(boardDTO)) {
           rttr.addFlashAttribute("result", "success");
       }
       rttr.addAttribute("pageNum",cri.getPageNum());
       rttr.addAttribute("amount",cri.getAmount());
        return "redirect:/board/get?bno="+ boardDTO.getBno();
    }

    @PostMapping("/remove")
    public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri,  RedirectAttributes rttr){
        if(boardService.remove(bno)){
            rttr.addFlashAttribute("result","success");
        }
        rttr.addAttribute("pageNum",cri.getPageNum());
        rttr.addAttribute("amount",cri.getAmount());
        return "redirect:/board/list";
    }

    @GetMapping("/list")
    public void list(Criteria cri, Model model){
        model.addAttribute("list", boardService.getBoard(cri));

        //model.addAttribute("pageMaker", new PageDTO(cri, 123));
        System.out.println(cri);
        int total = boardService.getTotal(cri);
        System.out.println(total);
        model.addAttribute("pageMaker", new PageDTO(cri,total));
    }


}
