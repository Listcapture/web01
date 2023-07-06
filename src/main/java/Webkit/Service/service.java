package Webkit.Service;

import Webkit.DataBaseUtils;
import Webkit.Entity.User;
import Webkit.Login.loginTest;

import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 * @ Author     :LeeTee.
 * @ Date       ：Created in 21:11 2023/7/6
 * @ Description：
 * @ Modified By：
 */
public class service {
    public static boolean isExist(String clientName,String password)
    {
        return loginTest.login(new User(clientName,password))!=null;
    }
    public static void  addUser(String clientName,String password)
    {
        String sql="insert into User (clientName,password) values (?,?)";
        try(Connection conn= DataBaseUtils.getConnection(); PreparedStatement stmt=conn.prepareStatement(sql);)
        {
            stmt.setString(1,clientName);
            stmt.setString(2,password);
            stmt.executeUpdate();
        }catch (Exception e)
        {
            e.printStackTrace();
        }

    }

}
