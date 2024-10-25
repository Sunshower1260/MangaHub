/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class history {
    
    private int userid;
    private int comicid;
    private String comicname;
    private int lastchapter;

    public history(int userid, int comicid, String comicname, int lastchapter) {
        this.userid = userid;
        this.comicid = comicid;
        this.comicname = comicname;
        this.lastchapter = lastchapter;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public int getComicid() {
        return comicid;
    }

    public void setComicid(int comicid) {
        this.comicid = comicid;
    }

    public String getComicname() {
        return comicname;
    }

    public void setComicname(String comicname) {
        this.comicname = comicname;
    }

    public int getLastchapter() {
        return lastchapter;
    }

    public void setLastchapter(int lastchapter) {
        this.lastchapter = lastchapter;
    }

    @Override
    public String toString() {
        return "history{" + "userid=" + userid + ", comicid=" + comicid + ", comicname=" + comicname + ", lastchapter=" + lastchapter + '}';
    }

    
    
}
