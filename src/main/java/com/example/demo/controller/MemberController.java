package com.example.demo.controller;

import com.example.demo.dto.MemberDTO;
import com.example.demo.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class MemberController {
    @Autowired
    MemberService memberService;

    @GetMapping("/join")
    public String join(){
        System.out.println("11111111111");
        return "member/join";
    }

    @PostMapping("/join")
    public String join(MemberDTO memberDTO) {
        System.out.println(memberDTO);
//        memberDTO.getUserid();
        memberService.joinMember(memberDTO);

        return "redirect:/";
    }

    @GetMapping("/login")
    public String login(){
        System.out.println("11111111111");
        return "member/login";
    }
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(MemberDTO memberDTO) {
        System.out.println(memberDTO);
        MemberDTO getMemberDTO = memberService.getMember(memberDTO);
        System.out.println(getMemberDTO);
        if(getMemberDTO == null){
            System.out.println("2222222222222");
            return "redirect:/";
        }else{
            System.out.println("33333333333333333");

            return "board/list";
        }
    }


}
