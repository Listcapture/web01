package Webkit.Service;

import Webkit.DataBaseUtils;
import Webkit.Entity.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * @ Author     :LeeTee.
 * @ Date       ：Created in 10:52 2023/7/4
 * @ Description：
 * @ Modified By：
 */
public class ListUser {

    public static List<User>  getUserList()
    {
        List<User> userList = new ArrayList<>();
        try (Connection conn = DataBaseUtils.getConnection(); Statement stmt = conn.createStatement())
        {
            ResultSet rs= stmt.executeQuery("select * from User");
            while(rs.next())
            {
                int id=rs.getInt("id");
                String clientName=rs.getString("clientName");
                String password =rs.getString("password");
                User u=new User();
                u.setId(id);
                u.setClientName(clientName);
                u.setPassword(password);
                userList.add(u);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return userList;
    }

}
