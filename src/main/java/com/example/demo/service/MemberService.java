package com.example.demo.service;

import com.example.demo.dto.MemberDTO;
import org.springframework.stereotype.Service;

@Service
public interface MemberService {

    public void joinMember(MemberDTO memberDTO);

    MemberDTO getMember(MemberDTO memberDTO);


}
