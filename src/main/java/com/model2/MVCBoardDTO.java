package com.model2;

import java.sql.Date;

public class MVCBoardDTO {
    private String idx, name, title, content, ofile, sfile, pass;
    private Date postdate;
    private int downcount, visitcount;

    public MVCBoardDTO() {
    }

    public String getIdx() {
        return this.idx;
    }

    public String getName() {
        return this.name;
    }

    public String getTitle() {
        return this.title;
    }

    public String getContent() {
        return this.content;
    }

    public String getOfile() {
        return this.ofile;
    }

    public String getSfile() {
        return this.sfile;
    }

    public String getPass() {
        return this.pass;
    }

    public Date getPostdate() {
        return this.postdate;
    }

    public int getDowncount() {
        return this.downcount;
    }

    public int getVisitcount() {
        return this.visitcount;
    }

    public void setIdx(String idx) {
        this.idx = idx;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setOfile(String ofile) {
        this.ofile = ofile;
    }

    public void setSfile(String sfile) {
        this.sfile = sfile;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public void setPostdate(Date postdate) {
        this.postdate = postdate;
    }

    public void setDowncount(int downcount) {
        this.downcount = downcount;
    }

    public void setVisitcount(int visitcount) {
        this.visitcount = visitcount;
    }
}
