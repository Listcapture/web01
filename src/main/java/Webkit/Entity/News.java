package Webkit.Entity;

/**
 * @ Author     :LeeTee.
 * @ Date       ：Created in 23:29 2023/7/5
 * @ Description：
 * @ Modified By：
 */
public class News {
    private String head;
    private String date;
    private String content;

    public News(String head, String date, String content)
    {
        this.head=head;
        this.date=date;
        this.content=content;
    }

    public String getHead() {
        return head;
    }

    public void setHead(String head) {
        this.head = head;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
