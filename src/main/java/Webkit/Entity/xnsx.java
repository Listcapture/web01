package Webkit.Entity;

/**
 * @ Author     :LeeTee.
 * @ Date       ：Created in 8:49 2023/7/5
 * @ Description：
 * @ Modified By：
 */
public class xnsx {
    private String time;
    private String date;
    private String head;
    private String content;
    public xnsx(String time, String date , String head, String content)
    {
        this.time=time;
        this.head=head;
        this.date=date;
        this.content=content;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getHead() {
        return head;
    }

    public void setHead(String head) {
        this.head = head;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
