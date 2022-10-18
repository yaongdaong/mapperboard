package com.example.demo.controller;

import com.example.demo.dto.MemberDTO;
import com.example.demo.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@SessionAttributes("member")
public class MemberController {
    @Autowired
    MemberService memberService;

    private static final String LOGIN_MEMBER = "LOGIN_MEMBER";
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
    public String login(MemberDTO memberDTO, HttpServletRequest request) {
        System.out.println(memberDTO);
        MemberDTO getMemberDTO = memberService.getMember(memberDTO);
        System.out.println(getMemberDTO);

        // 로그인 성공 처리
        // 세션이 있으면 있는 세션 반환, 없으면 신규 세션 생성
        HttpSession session = request.getSession();
        // 세션에 로그인 회원 정보 보관
        session.setAttribute(LOGIN_MEMBER, memberDTO);

        if(getMemberDTO == null){
            System.out.println("2222222222222");

            return "redirect:/";
        }else{
            System.out.println("33333333333333333");

            return "board/list";
        }
    }

    @PostMapping("/logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession(false);

        if (session != null) {
            session.invalidate();
        }

        return "redirect:/";
    }

}
