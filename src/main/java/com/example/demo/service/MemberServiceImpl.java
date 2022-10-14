package com.example.demo.service;

import com.example.demo.dto.BoardDTO;
import com.example.demo.dto.MemberDTO;
import com.example.demo.mapper.MemberMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService{

    private MemberMapper memberMapper;

    @Override
    public void joinMember(MemberDTO memberDTO) {
        memberMapper.joinMember(memberDTO);
    }

    @Override
    public MemberDTO getMember(MemberDTO memberDTO){
        return memberMapper.getMember(memberDTO);
    }


}
