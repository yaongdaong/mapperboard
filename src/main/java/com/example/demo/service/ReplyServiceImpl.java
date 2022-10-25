package com.example.demo.service;

import com.example.demo.dto.ReplyDTO;
import com.example.demo.mapper.ReplyMapper;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReplyServiceImpl implements ReplyService{

    @Setter(onMethod_ = @Autowired)
    private ReplyMapper mapper;
// 댓글 등록
    @Override
    public int register(ReplyDTO replyDTO){
        return mapper.insert(replyDTO);
    }

    @Override
    public ReplyDTO get(Long rno){
        System.out.println("serviceimpl:"+ mapper.getList(rno));
        System.out.println(rno);
        return mapper.read(rno);
    }

    //댓글 조회
    @Override
    public List<ReplyDTO> getList(Long bno) {
        return mapper.getList(bno);
    }

    // 댓글 수정
    @Override
    public int modify(ReplyDTO replyDTO){
        int result = mapper.update(replyDTO);

        return result;
    }

    // 댓글 삭제
    @Override
    public int remove(Long rno){
        return mapper.delete(rno);
    }

}
