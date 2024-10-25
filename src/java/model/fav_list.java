/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class fav_list {
    private int user_id;
    private int comic_id;

    public fav_list(int user_id, int comic_id) {
        this.user_id = user_id;
        this.comic_id = comic_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public int getComic_id() {
        return comic_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public void setComic_id(int comic_id) {
        this.comic_id = comic_id;
    }
}
