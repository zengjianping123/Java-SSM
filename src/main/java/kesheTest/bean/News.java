package kesheTest.bean;

import org.springframework.stereotype.Component;

import java.sql.Date;
@Component
public class News {
    private int id;
    private String head;
    private String body;
    private Date date;
    private String summary;
    private String author;

    public News() {
    }

    public News(String head, String body, Date date, String summary, String author) {
        this.head = head;
        this.body = body;
        this.date = date;
        this.summary = summary;
        this.author = author;
    }

    public News(int id, String head, String body, Date date, String summary, String author) {
        this.id = id;
        this.head = head;
        this.body = body;
        this.date = date;
        this.summary = summary;
        this.author = author;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getHead() {
        return head;
    }

    public void setHead(String head) {
        this.head = head;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }
}
