/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.phonekart.dao;

import com.mysql.jdbc.Connection;
import com.phonekart.bean.productInfo;

import static com.phonekart.dao.userDao.getConnection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.phonekart.dao.userDao;
import static com.phonekart.dao.userDao.getConnection;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author Sougata143
 */
public class productDao {
    static Connection con = null;
    static PreparedStatement ps = null;
    static ResultSet rs = null;
    
    
    
    public static int delete(String id) throws SQLException{
        int status = 0;
        try{
          con=userDao.getConnection();
          ps = con.prepareStatement("delete from products where product_id=?");
          ps.setString(1, id);
          status = ps.executeUpdate();
        }
        catch(Exception ce){
            ce.printStackTrace();
        }
        finally{
            ps.close();
            con.close();
            
        }
        return status;
    }
    
    public static int update(String product_name, String brand, String price, String product_id){  
    int status=0;  
    try{  
        Connection con=getConnection();  
        PreparedStatement ps=con.prepareStatement(  
        "update products set product_name=?,brand=?,price=? where product_id=?");  
        ps.setString(1,product_name);  
        ps.setString(2,brand);  
        ps.setString(3,price);  
        ps.setString(4,product_id);  
        
        status=ps.executeUpdate();  
    }catch(Exception e){System.out.println(e);}  
    return status;  
}  
    
    public static List<productInfo> getAllRecords(){  
    List<productInfo> list=new ArrayList<productInfo>();  
      
    try{  
        Connection con=getConnection();  
        PreparedStatement ps=con.prepareStatement("select * from products");  
        ResultSet rs=ps.executeQuery();  
        while(rs.next()){  
            productInfo u=new productInfo();  
            u.setProduct_id(rs.getInt("product_id"));  
            u.setProduct_name(rs.getString("product_name"));  
            u.setImage(rs.getString("image"));  
            u.setBrand(rs.getString("brand"));  
            u.setPrice(rs.getString("price"));  
            
            list.add(u);  
        }  
    }catch(Exception e){System.out.println(e);}  
    return list;  
}  
public static productInfo getRecordById(int id){  
    productInfo u=null;  
    try{  
        Connection con=getConnection();  
        PreparedStatement ps=con.prepareStatement("select * from user where uid=?");  
        ps.setInt(1,id);  
        ResultSet rs=ps.executeQuery();  
        while(rs.next()){  
            u=new productInfo();  
            u.setProduct_id(rs.getInt("product_id"));  
            u.setProduct_name(rs.getString("product_name"));  
            u.setBrand(rs.getString("brand"));  
            u.setPrice(rs.getString("price"));  
            
        }  
    }catch(Exception e){System.out.println(e);}  
    return u;
    
}
    
}
