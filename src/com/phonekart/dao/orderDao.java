/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.phonekart.dao;

import com.mysql.jdbc.Connection;
import com.phonekart.bean.cartInfo;
import com.phonekart.bean.orderInfo;
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
public class orderDao {
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
    
    public static int save(String product, cartInfo u) throws SQLException{
        int status = 0;
        try{
        con = orderDao.getConnection();
        String url = "insert into orders(name,email,product,address) values(?,?,?,?,?)";
        ps = con.prepareStatement(url);
        
        ps.setString(1, u.getName());
        ps.setString(2, u.getEmail());
        ps.setString(3, product);
        ps.setString(4, u.getAddress());
        
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
          ps = con.prepareStatement("delete from orders where oid=?");
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
    
    public static int update(String id,orderInfo u){  
    int status=0;  
    try{  
        Connection con=orderDao.getConnection();
        PreparedStatement ps=con.prepareStatement(  
        "update orders set name=?,email=?,product=?,address=? where oid=?");
        
        ps.setString(1,u.getName());  
        ps.setString(2,u.getEmail());  
        ps.setString(3,u.getProduct());  
        ps.setString(4,u.getAddress());  
        ps.setString(5,id);  
        
        status=ps.executeUpdate();  
    }catch(Exception e){System.out.println(e);}  
    return status;  
}  
    
    public static List<orderInfo> getAllRecords(){  
    List<orderInfo> list=new ArrayList<orderInfo>();  
      
    try{  
        Connection con=getConnection();  
        PreparedStatement ps=con.prepareStatement("select * from orders");  
        ResultSet rs=ps.executeQuery();  
        while(rs.next()){  
            orderInfo u=new orderInfo();  
            u.setOid(rs.getInt("oid"));  
            u.setName(rs.getString("name"));  
            u.setEmail(rs.getString("email"));  
            u.setProduct(rs.getString("product"));  
            u.setAddress(rs.getString("address"));  
            
            list.add(u);  
        }  
    }catch(Exception e){System.out.println(e);}  
    return list;  
}  
public static orderInfo getRecordById(int id){  
    orderInfo u=null;  
    try{  
        Connection con=getConnection();  
        PreparedStatement ps=con.prepareStatement("select * from orders where oid=?");  
        ps.setInt(1,id);  
        ResultSet rs=ps.executeQuery();  
        while(rs.next()){  
            u=new orderInfo();  
            u.setOid(rs.getInt("oid"));  
            u.setName(rs.getString("name"));  
            u.setEmail(rs.getString("email"));  
            u.setProduct(rs.getString("product"));  
            u.setAddress(rs.getString("address"));  
            
        }  
    }catch(Exception e){System.out.println(e);}  
    return u;  
}
}
