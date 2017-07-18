/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.phonekart.dao;

import com.mysql.jdbc.Connection;
import com.phonekart.bean.userInfo;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Sougata143
 */
public class userDao {
    static Connection con = null;
    static PreparedStatement ps = null;
    static ResultSet rs = null;
    public static Connection getConnection() throws SQLException{
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping","root", "student");
        }catch(ClassNotFoundException ce){
            ce.printStackTrace();
        }
        return con;
    }
    
    public static int save(userInfo u) throws SQLException{
        int status = 0;
        try{
        con = userDao.getConnection();
        String url = "insert into user(email,password,uname,mobile,city,zip) values(?,?,?,?,?,?)";
        ps = con.prepareStatement(url);
        
        ps.setString(1, u.getEmail());
        ps.setString(2, u.getPassword());
        ps.setString(3, u.getUname());
        ps.setString(4, u.getMobile());
        ps.setString(5, u.getCity());
        ps.setString(6, u.getZip());
        
        status=ps.executeUpdate();
        
        }catch(Exception ex){
            ex.printStackTrace();
        }
        finally{
        con.close();
        ps.close();
        }
        return status;
        
    }
    
    
    public static int delete(String id) throws SQLException{
        int status = 0;
        try{
          con=userDao.getConnection();
          ps = con.prepareStatement("delete from user where uid=?");
          ps.setString(1, id);
          status = ps.executeUpdate();
        }
        catch(Exception ce){
            ce.printStackTrace();
        }
        /*finally{
            ps.close();
            con.close();
            
        }*/
        return status;
    }
    
    public static int update(String id,userInfo u){  
    int status=0;  
    try{  
        Connection con=userDao.getConnection();
        PreparedStatement ps=con.prepareStatement(  
        "update user set email=?,uname=?,mobile=?,city=?,zip=? where uid=?");
        
        ps.setString(1,u.getEmail());  
        ps.setString(2,u.getUname());  
        ps.setString(3,u.getMobile());  
        ps.setString(4,u.getCity());  
        ps.setString(5,u.getZip());  
        ps.setString(6,id);  
        
        status=ps.executeUpdate();  
    }catch(Exception e){System.out.println(e);}  
    return status;  
}  
    
    public static List<userInfo> getAllRecords(){  
    List<userInfo> list=new ArrayList<userInfo>();  
      
    try{  
        Connection con=getConnection();  
        PreparedStatement ps=con.prepareStatement("select * from user");  
        ResultSet rs=ps.executeQuery();  
        while(rs.next()){  
            userInfo u=new userInfo();  
            u.setUid(rs.getInt("uid"));  
            u.setEmail(rs.getString("email"));  
            u.setUname(rs.getString("uname"));  
            u.setMobile(rs.getString("mobile"));  
            u.setCity(rs.getString("city"));  
            u.setZip(rs.getString("zip"));  
            
            list.add(u);  
        }  
    }catch(Exception e){System.out.println(e);}  
    return list;  
}  
public static userInfo getRecordById(int id){  
    userInfo u=null;  
    try{  
        Connection con=getConnection();  
        PreparedStatement ps=con.prepareStatement("select * from user where uid=?");  
        ps.setInt(1,id);  
        ResultSet rs=ps.executeQuery();  
        while(rs.next()){  
            u=new userInfo();  
            u.setUid(rs.getInt("uid"));  
            u.setEmail(rs.getString("email"));  
            u.setUname(rs.getString("uname"));  
            u.setMobile(rs.getString("mobile"));  
            u.setCity(rs.getString("city"));  
            u.setZip(rs.getString("zip"));  
            
        }  
    }catch(Exception e){System.out.println(e);}  
    return u;  
}
  
}
