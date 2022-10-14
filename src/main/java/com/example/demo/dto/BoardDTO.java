package com.example.demo.dto;

import lombok.Data;

import java.util.Date;

@Data
public class BoardDTO {
    Long bno;
    String title;
    String content;
    String writer;
    Date regdate;
}
