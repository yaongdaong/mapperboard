package com.example.demo.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
public class ReplyDTO {
    private Long rno;
    private Long bno;
    private String reply;
    private String replyer;
    private Date replyDate;
    private Date updateDate;

    @Override
    public String toString() {
        return "ReplyDTO{" +
                "rno=" + rno +
                ", bno=" + bno +
                ", reply='" + reply + '\'' +
                ", replyer='" + replyer + '\'' +
                ", replyDate=" + replyDate +
                ", updateDate=" + updateDate +
                '}';
    }
}
