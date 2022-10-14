package com.example.demo.mapper;

import com.example.demo.dto.MemberDTO;

import java.lang.reflect.Member;

public interface MemberMapper {

    void joinMember(MemberDTO memberDTO);

    MemberDTO getMember(MemberDTO memberDTO);

}
