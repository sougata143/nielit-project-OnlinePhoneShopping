/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.phonekart.dao;

import com.mysql.jdbc.Connection;
import com.phonekart.bean.inventoryInfo;
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
public class inventoryDao {
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
    
    public static int save(inventoryInfo u) throws SQLException{
        int status = 0;
        try{
        con = userDao.getConnection();
        String url = "insert into inventory(product_name,qnty,brand,price) values(?,?,?,?)";
        ps = con.prepareStatement(url);
        
        ps.setString(1, u.getProduct_name());
        ps.setString(2, u.getQnty());
        ps.setString(3, u.getBrand());
        ps.setString(4, u.getPrice());
        
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
          con=inventoryDao.getConnection();
          ps = con.prepareStatement("delete from inventory where iid=?");
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
    
    public static int update(String product_name, String qnty, String brand, String price, String id){  
    int status=0;  
    try{  
        Connection con=userDao.getConnection();
        String sql = "UPDATE inventory SET product_name=?,qnty=?,brand=?,price=? WHERE iid=?";
        PreparedStatement ps=con.prepareStatement(sql);
        
        ps.setString(1,product_name);  
        ps.setString(2,qnty);  
        ps.setString(3,brand);  
        ps.setString(4,price);  
        ps.setString(5,id);  
        
        
        status=ps.executeUpdate();  
    }catch(Exception e){System.out.println(e);}  
    return status;  
}  
    
    public static List<inventoryInfo> getAllRecords(){  
    List<inventoryInfo> list=new ArrayList<inventoryInfo>();  
      
    try{  
        Connection con=getConnection();  
        PreparedStatement ps=con.prepareStatement("select * from inventory");  
        ResultSet rs=ps.executeQuery();  
        while(rs.next()){  
            inventoryInfo u=new inventoryInfo();  
            u.setIid(rs.getInt("iid"));  
            u.setProduct_name(rs.getString("product_name"));  
            u.setQnty(rs.getString("qnty"));  
            u.setBrand(rs.getString("brand"));  
            u.setPrice(rs.getString("price"));  
            
            list.add(u);  
        }  
    }catch(Exception e){System.out.println(e);}  
    return list;  
}  
public static inventoryInfo getRecordById(int id){  
    inventoryInfo u=null;  
    try{  
        Connection con=getConnection();  
        PreparedStatement ps=con.prepareStatement("select * from inventory where iid=?");  
        ps.setInt(1,id);  
        ResultSet rs=ps.executeQuery();  
        while(rs.next()){  
            u=new inventoryInfo();  
            u.setIid(rs.getInt("iid"));  
            u.setProduct_name(rs.getString("product_name"));  
            u.setBrand(rs.getString("brand"));  
            u.setPrice(rs.getString("price"));  
            
        }  
    }catch(Exception e){System.out.println(e);}  
    return u;
    
}
    
}
