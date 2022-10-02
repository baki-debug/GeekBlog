package com.blog.entities;

import java.sql.Timestamp;

public class Post {
    private int pid;
    private int catid;
    private String ptitle;
    private String pcontent;
    private String ppic;
    private Timestamp pdate;

    private int userId;

    public Post() {
    }

    public Post(int pid, int catid, String ptitle, String pcontent, String ppic, Timestamp pdate, int userId) {
        this.pid = pid;
        this.catid = catid;
        this.ptitle = ptitle;
        this.pcontent = pcontent;
        this.ppic = ppic;
        this.pdate = pdate;
        this.userId = userId;
    }

    public Post(int catid, String ptitle, String pcontent, String ppic, int userId) {
        this.catid = catid;
        this.ptitle = ptitle;
        this.pcontent = pcontent;
        this.ppic = ppic;
        this.userId = userId;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getCatid() {
        return catid;
    }

    public void setCatid(int catid) {
        this.catid = catid;
    }

    public String getPtitle() {
        return ptitle;
    }

    public void setPtitle(String ptitle) {
        this.ptitle = ptitle;
    }

    public String getPcontent() {
        return pcontent;
    }

    public void setPcontent(String pcontent) {
        this.pcontent = pcontent;
    }

    public String getPpic() {
        return ppic;
    }

    public void setPpic(String ppic) {
        this.ppic = ppic;
    }

    public Timestamp getPdate() {
        return pdate;
    }

    public void setPdate(Timestamp pdate) {
        this.pdate = pdate;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}
