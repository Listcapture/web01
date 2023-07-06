package Webkit.Entity;

/**
 * @ Author     :LeeTee.
 * @ Date       ：Created in 22:43 2023/7/3
 * @ Description：
 * @ Modified By：
 */
public class User {
    private int id;
   private String clientName;
    private String password;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getClientName() {
        return clientName;
    }

    public void setClientName(String clientName) {
        this.clientName = clientName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
