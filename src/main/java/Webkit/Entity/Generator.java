package Webkit.Entity;

/**
 * @ Author     :LeeTee.
 * @ Date       ：Created in 11:09 2023/7/6
 * @ Description：
 * @ Modified By：
 */
public class Generator {
    private int id;
    private String type;
    public Generator(int id,String type)
    {
        this.id=id;
        this.type=type;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
