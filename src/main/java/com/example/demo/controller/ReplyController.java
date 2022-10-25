package com.example.demo.controller;

import com.example.demo.dto.ReplyDTO;
import com.example.demo.service.ReplyService;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Date;

@RequestMapping("/replies/")
@RestController
@AllArgsConstructor
public class ReplyController {

    private ReplyService replyService;

//    댓글추가
    @PostMapping(value = "/new")
    public @ResponseBody ReplyDTO create(@RequestBody ReplyDTO replyDTO) {
        //ResponseEntity<String>


        replyDTO.setReplyDate(new Date());
        replyDTO.setUpdateDate(new Date());
        replyService.register(replyDTO);
        return replyDTO;
        /*return insertCount == 1
                ? new ResponseEntity<>("success", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);*/
        // 삼항 연산자 처리
    }

//    @GetMapping(value = "/pages/{bno}/{page}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
//    public ResponseEntity<ReplyPageDTO> getList(
//            @PathVariable("page") int page,
//            @PathVariable("bno") Long bno) {
//
//        System.out.println("page========"+page+"            bno============"+bno);
//        Criteria cri = new Criteria(page, 10);
//        return new ResponseEntity<>(replyService.getListPage(cri, bno), HttpStatus.OK);
//    }


//   댓글 조회

    @GetMapping(value = "/{rno}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<ReplyDTO> get(@PathVariable("rno") Long rno) {
        return new ResponseEntity<>(replyService.get(rno), HttpStatus.OK);
    }

//    댓글 삭제
    @DeleteMapping(value = "/{rno}", produces = {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> remove(@PathVariable("rno") Long rno) {
        return replyService.remove(rno) == 1
                ? new ResponseEntity<>("success", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

//    댓글 수정
    @RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH}, value = "/{rno}", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<ReplyDTO> modify(
            @RequestBody ReplyDTO replyDTO) {
//        int getRno = Integer.parseInt(rno);
//        replyDTO.setRno(getRno);
        System.out.println(replyDTO.getRno());
        System.out.println(replyService.get(replyDTO.getRno()));
        return replyService.modify(replyDTO) == 1
                ? new ResponseEntity<>(replyService.get(replyDTO.getRno()), HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

    }


}