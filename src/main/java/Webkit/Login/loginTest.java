package Webkit.Login;

import Webkit.DataBaseUtils;
import Webkit.Entity.User;

import java.awt.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @ Author     :LeeTee.
 * @ Date       ：Created in 22:42 2023/7/3
 * @ Description：
 * @ Modified By：
 */
public class loginTest {

    public  static User login(User loginUser) {
        String sql="select * from User where clientName= ? and password = ? ";
        try (Connection conn = DataBaseUtils.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql))
        {
        stmt.setString(1,loginUser.getClientName());
        stmt.setString(2,loginUser.getPassword());
        ResultSet rs=stmt.executeQuery();
        if(rs.next()) return loginUser;
        else return null;

        }catch (Exception e){
            e.printStackTrace();
        }

        return null;

    }

    public static void main(String[] args) {


            try (Connection conn = DataBaseUtils.getConnection(); Statement stmt = conn.createStatement())
            {
                ResultSet rs= stmt.executeQuery("select * from User");
                List<User> userList = new ArrayList<>();
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
                userList.stream().forEach(c->{
                    System.out.println(c.getClientName()+"  "+c.getPassword());
                });

            }catch (Exception e){
                e.printStackTrace();
            }
        try (Connection conn = DataBaseUtils.getConnection(); Statement stmt = conn.createStatement())
        {
            ResultSet rs= stmt.executeQuery("select * from xnsxh");

            while(rs.next())
            {
                System.out.println(rs.getString("date")+" "+
                rs.getString("time")+" "+
                rs.getString("head")+" "+
                        rs.getString("content")
                );
            }


        }catch (Exception e){
            e.printStackTrace();
        }

    }

}
