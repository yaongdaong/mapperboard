package com.example.demo.mapper;

import com.example.demo.dto.MemberDTO;

public interface MemberMapper {

    public void joinMember(MemberDTO memberDTO);

    MemberDTO getMember(MemberDTO memberDTO);

}
