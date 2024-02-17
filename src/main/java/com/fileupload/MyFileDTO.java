package com.fileupload;

public class MyFileDTO {
    private String idx;
    private String title;
    private String cate;
    private String ofile;
    private String sfile;
    private String postdate;

    public String getIdx() {
        return this.idx;
    }

    public String getTitle() {
        return this.title;
    }

    public String getCate() {
        return this.cate;
    }

    public String getOfile() {
        return this.ofile;
    }

    public String getSfile() {
        return this.sfile;
    }

    public String getPostdate() {
        return this.postdate;
    }

    public void setIdx(String idx) {
        this.idx = idx;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setCate(String cate) {
        this.cate = cate;
    }

    public void setOfile(String ofile) {
        this.ofile = ofile;
    }

    public void setSfile(String sfile) {
        this.sfile = sfile;
    }

    public void setPostdate(String postdate) {
        this.postdate = postdate;
    }
}
