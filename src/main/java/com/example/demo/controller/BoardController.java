package com.example.demo.controller;

import com.example.demo.dto.BoardDTO;
import com.example.demo.dto.Criteria;
import com.example.demo.dto.PageDTO;
import com.example.demo.dto.ReplyDTO;
import com.example.demo.service.BoardService;
import com.example.demo.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/board/*")
@SessionAttributes("member")
public class BoardController {

    @Autowired
    BoardService boardService;

    @Autowired
    ReplyService replyService;

    @GetMapping("/write")
    public String write(HttpSession session){
        if(session.getAttribute("member")!=null) {

        return "board/write";
        }else{
            return "redirect:/login";
        }
    }

    @PostMapping("/write")
    public String write(BoardDTO boardDTO, RedirectAttributes rttr){

        boardDTO.setRegdate(new Date());
        boardService.write(boardDTO);
        rttr.addFlashAttribute("result", boardDTO.getBno());

//        BoardDTO getBoardDTO = boardService.getBoard(BoardDTO);
        return "redirect:/board/list";
    }

//    @GetMapping("/list")
//    public DTOid list(Criteria cri, Model model) {
//        model.addAttribute("list",boardService.getBoard(cri));
//    }

    @GetMapping({"/get"})
    public String get(@RequestParam("bno") Long bno, @ModelAttribute("cri")Criteria cri, HttpSession session, Model model){

         BoardDTO boardDTO = boardService.get(bno);
        model.addAttribute("board", boardDTO);

        List<ReplyDTO> replyDTO = replyService.getList(bno);

        model.addAttribute("replyList", replyDTO);

        return "/board/get";

    }
    @GetMapping({"/modify"})
    public String modify(@RequestParam("bno") Long bno, @ModelAttribute("cri")Criteria cri, HttpSession session, Model model){

        BoardDTO boardDTO = boardService.get(bno);

        model.addAttribute("board", boardDTO);
        return "/board/modify";

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
    public String list(Criteria cri, HttpSession session,Model model){

        if(session.getAttribute("member")!=null) {
            model.addAttribute("list", boardService.getBoard(cri));

            //model.addAttribute("pageMaker", new PageDTO(cri, 123));

            int total = boardService.getTotal(cri);

            model.addAttribute("pageMaker", new PageDTO(cri, total));
            return "/board/list";
        }else{
            return "redirect:/login";
        }
    }



}
