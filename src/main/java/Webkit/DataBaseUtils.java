package Webkit;

import java.sql.*;

/**
 * @ Author     :LeeTee.
 * @ Date       ：Created in 21:50 2023/7/3
 * @ Description：
 * @ Modified By：
 */

public class DataBaseUtils  {
private static  String userName="2021213193";
private static String  URL="jdbc:mysql://114.116.239.239:3306/2021213193?useSSL=false&useUnicode=true&characterEncoding=utf8&serverTimezone=GMT%2B8&userUnicode=true";

private static String password="2021213193";

private static  String JDBCName="com.mysql.cj.jdbc.Driver";


public static Connection getConnection() throws ClassNotFoundException {
    Class.forName(JDBCName);
    try {
        Connection conn= DriverManager.getConnection(URL,userName,password);
        if(conn!=null){
            return conn;

        }else {
            System.out.println("Fail");
            return null;
        }
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }
}

    public static void main(String[] args) {
        try (Connection conn = DataBaseUtils.getConnection();Statement stmt = conn.createStatement()) {
            String sql="update User set username=2021213193 where id=1";
            stmt.executeUpdate(sql);
        }catch (Exception e)
        {
            e.printStackTrace();
        }

    }


}
