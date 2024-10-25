package model;

import java.util.Date;

public class comic {
    private int id;
    private String title;
    private String author;
    private Date publisheddate;
       private String descriptionComic;
    private String viewer;

    public comic(int id, String title, String author, Date publisheddate, String descriptionComic, String viewer) {
        this.id = id;
        this.title = title;
        this.author = author;
        this.publisheddate = publisheddate;
        this.descriptionComic = descriptionComic;
        this.viewer = viewer;
    }

    public comic(int id, String title, String author, Date publisheddate) {
        this.id = id;
        this.title = title;
        this.author = author;
        this.publisheddate = publisheddate;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Date getPublisheddate() {
        return publisheddate;
    }

    public void setPublisheddate(Date publisheddate) {
        this.publisheddate = publisheddate;
    }

    public String getDescriptionComic() {
        return descriptionComic;
    }

    public void setDescriptionComic(String descriptionComic) {
        this.descriptionComic = descriptionComic;
    }

    public String getViewer() {
        return viewer;
    }

    public void setViewer(String viewer) {
        this.viewer = viewer;
    }
    
    

}