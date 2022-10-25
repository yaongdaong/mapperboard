package com.example.demo.controller;

import com.example.demo.dto.MemberDTO;
import com.example.demo.service.MemberService;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class MemberController {
    @Autowired
    MemberService memberService;

    //public static final String LOGIN_MEMBER = "LOGIN_MEMBER";

    @GetMapping("/join")
    public String join(){

        return "member/join";
    }

    @PostMapping("/join")
    public String join(MemberDTO memberDTO) {

//        memberDTO.getUserid();
        memberService.joinMember(memberDTO);
        String hashedPw = BCrypt.hashpw(memberDTO.getPasswd(), BCrypt.gensalt());
        memberDTO.setPasswd(hashedPw);
        return "redirect:/";
    }

    @GetMapping("/login")
    public String login(){

        return "member/login";

    }
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(MemberDTO memberDTO, HttpSession session) {

        // 로그인 정보 저장
        MemberDTO getMemberDTO = memberService.getMember(memberDTO);




        if(getMemberDTO == null){



            return "redirect:/";
        }else{
            // 로그인 성공 처리

            // 세션에 로그인 회원 정보 보관
            session.setAttribute("member",memberDTO.getUserid());


            return "redirect:/board/list";
        }
    }



    @GetMapping("/logout")
    public String logout(HttpSession session) {


        if (session != null) {


            session.invalidate();}
        return "redirect:/";
    }

}
