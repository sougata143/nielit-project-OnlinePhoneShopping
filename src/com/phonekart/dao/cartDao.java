/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.phonekart.dao;

import com.mysql.jdbc.Connection;
import com.phonekart.bean.cartInfo;
import com.phonekart.bean.orderInfo;
import static com.phonekart.dao.orderDao.getConnection;
import com.sun.corba.se.impl.util.Utility;
import static java.lang.System.out;
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
public class cartDao {
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
    
    public static int save(String product, String number,cartInfo c) throws SQLException{
        int status = 0;
        try{
        
        con = userDao.getConnection();
        String url = "insert into cart(product,email,name,address,number,location) values(?,?,?,?,?,?);";
        
        ps = con.prepareStatement(url);
        
        ps.setString(1, product);
        ps.setString(2, c.getEmail());
        ps.setString(3, c.getName());
        ps.setString(4, c.getAddress());
        ps.setString(5, number);
        ps.setString(6, c.getLocation());
       
        
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
    
    public static int saveOrder(String product,orderInfo o) throws SQLException{
        int status = 0;
        try{
            Connection con1 = userDao.getConnection();
            String url1 = "insert into orders(name,email,product,address) values(?,?,?,?,?)";
            PreparedStatement pst = con1.prepareStatement(url1);
            pst.setString(1, o.getName());
        pst.setString(2, o.getEmail());
        pst.setString(3, product);
        pst.setString(40,o.getAddress());
        int status1 = pst.executeUpdate();
        }catch(Exception ce){
            ce.printStackTrace();
        }
        return status;
    }
    
    public static int delete(String id) throws SQLException{
        int status = 0;
        try{
          con=cartDao.getConnection();
          ps = con.prepareStatement("delete from cart where cid=?");
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
    
    public static List<cartInfo> getAllRecords(String email){  
    List<cartInfo> list=new ArrayList<cartInfo>();  
      
    try{  
        Connection con=getConnection();  
        
        PreparedStatement ps=con.prepareStatement("select * from cart where email=?");
        ps.setString(1,email);  
        
        ResultSet rs=ps.executeQuery();  
        while(rs.next()){  
            cartInfo u=new cartInfo();  
            u.setCid(rs.getInt("cid"));
            u.setProduct(rs.getString("product")); 
            u.setEmail(rs.getString("email"));  
            u.setName(rs.getString("name"));  
            u.setAddress(rs.getString("address"));  
            u.setNumber(rs.getString("number"));  
            u.setLocation(rs.getString("location"));  
            
            list.add(u);  
        }  
    }catch(Exception e){System.out.println(e);}  
    return list;  
}  
public static cartInfo getRecordById(String email){  
    cartInfo u=null;  
    try{  
        Connection con=getConnection();  
        PreparedStatement ps=con.prepareStatement("select * from cart where email=?");  
        ps.setString(1,email);  
        ResultSet rs=ps.executeQuery();  
        while(rs.next()){  
            u=new cartInfo();
            u.setCid(rs.getInt("cid"));
            u.setProduct(rs.getString("product")); 
            u.setEmail(rs.getString("email"));  
            u.setName(rs.getString("name"));  
            u.setAddress(rs.getString("address"));  
            u.setNumber(rs.getString("number"));  
            u.setLocation(rs.getString("location"));  
            
        }  
    }catch(Exception e){System.out.println(e);}  
    return u;  
}
    
}
