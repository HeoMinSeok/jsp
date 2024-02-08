package com.model1.board;

import com.membership.MemberDTO;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;
@Getter @Setter
public class BoardDTO {
    public BoardDTO() {
    }
    private String num;
    private String title;
    private String content;
    private String id;
    private String visitcount;
    private String name;
    private Date postdate;
}
