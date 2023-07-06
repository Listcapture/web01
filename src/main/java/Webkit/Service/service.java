package Webkit.Service;

import Webkit.DataBaseUtils;
import Webkit.Entity.User;
import Webkit.Entity.xnsx;
import Webkit.Login.loginTest;
import Webkit.Servlet.xnsxh;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
    public static void updateUser(String FclientName,String Fpassword,String LclientName,String Lpassword)
    {
        String sql="update `User` set clientName=? ,password=?  where clientName=? ";
        try (Connection conn= DataBaseUtils.getConnection(); PreparedStatement stmt1=conn.prepareStatement(sql);){
            stmt1.setString(1,LclientName);
            stmt1.setString(2,Lpassword);
            stmt1.setString(3,FclientName);
            stmt1.executeUpdate();

        }catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    public static String   findUser(String clientName)
    {
        String sql="select * from User where clientName=? ";
        String message="没有查找到用户信息!";
        try(Connection conn=DataBaseUtils.getConnection();PreparedStatement stmt=conn.prepareStatement(sql))
        {
            stmt.setString(1,clientName);
            ResultSet rs=stmt.executeQuery();
            while(rs.next())
            {
               message="id:"+rs.getInt("id");
            }
        }catch (Exception e)
        {
            e.printStackTrace();
        }
        return message;
    }
    public  static void deleteUser(int id)
    {
        String sql="delete from User where id =?";
        try(Connection conn= DataBaseUtils.getConnection();PreparedStatement stmt=conn.prepareStatement(sql);){
            stmt.setInt(1,id);
            stmt.executeUpdate();
        }catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    public static String  lastUrlPath(String url)
    {
        int id=url.lastIndexOf('/');
        return url.substring(0,id);

    }
    public static String getClientNameByID(int id)
    {
        String sql="select * from User where id = ?";
        String txt=null;
        try(Connection conn= DataBaseUtils.getConnection();PreparedStatement stmt=conn.prepareStatement(sql)){
            stmt.setInt(1,id);
            ResultSet rs=stmt.executeQuery();
            while(rs.next())
            {
               txt= rs.getString("clientName");
            }
        }catch (Exception e)
        {
            e.printStackTrace();
        }
        return txt;
    }
    public static void addWork(String date,String time,String head,String content)
    {
        String sql="insert into xnsxh (date,time,head,content) values (?,?,?,?)";

        try(Connection conn= DataBaseUtils.getConnection();PreparedStatement stmt=conn.prepareStatement(sql)){
          stmt.setString(1,date);
          stmt.setString(2,time);
          stmt.setString(3,head);
          stmt.setString(4,content);
          stmt.executeUpdate();
        }catch (Exception e)
        {
            e.printStackTrace();
        }

    }
    public static List<xnsx> ListWork()
    {
        java.util.List<xnsx> xnsxList=new ArrayList<xnsx>();
        String sql="select * from xnsxh";

        try(Connection conn= DataBaseUtils.getConnection();PreparedStatement stmt=conn.prepareStatement(sql)){
            ResultSet rs= stmt.executeQuery();
            while(rs.next())
            {
             xnsxList.add(new xnsx(rs.getString("time"),rs.getString("date"),rs.getString("head"),rs.getString("content")));

            }
        }catch (Exception e)
        {
            e.printStackTrace();
        }
        return xnsxList;
    }
    public static void addNews(String date,String head,String content)
    {
        String sql="insert into news (date,head,content) values (?,?,?)";

        try(Connection conn= DataBaseUtils.getConnection();PreparedStatement stmt=conn.prepareStatement(sql)){
            stmt.setString(1,date);
            stmt.setString(2,head);
            stmt.setString(3,content);
            stmt.executeUpdate();
        }catch (Exception e)
        {
            e.printStackTrace();
        }

    }






}
