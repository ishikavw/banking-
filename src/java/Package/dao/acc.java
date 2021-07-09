/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Package.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Adminpc
 */
public class acc {
     public Connection con;

    public acc(Connection con) {
        this.con = con;
    }

    public boolean checkbal(int Sacc, int Samt) {
       boolean status = false;
       
        PreparedStatement ptst;
        ResultSet rs;
        String query = "select balance from accountdetails where accountno = ?";
        try
        {
            ptst =  con.prepareStatement(query);
            ptst.setInt(1,Sacc);
            rs = ptst.executeQuery();
            if(rs.next())
            {
                int amt = rs.getInt("balance");
                if(amt >= Samt)
                {
                    status = true;
                }
            }
            
        }
        catch(SQLException ex) 
        {
            ex.printStackTrace();
        }
    return status;
}

    public boolean transfer(int Racc, int Sacc, int Samt ,String Rname) {
       boolean status = false;
       
        PreparedStatement ptst;
        ResultSet rs;
        double RCamt =0;
        double SCamt =0;
        try
        {
            String query = "select balance from accountdetails where accountno = ?";
            ptst =  con.prepareStatement(query);
            ptst.setDouble(1,Racc);
            rs = ptst.executeQuery();
            if(rs.next())
            {
                RCamt = rs.getInt("balance");
            }
            String query4 = "select balance from accountdetails where accountno = ?";
            ptst =  con.prepareStatement(query4);
            ptst.setDouble(1,Sacc);
            rs = ptst.executeQuery();
            if(rs.next())
            {
                SCamt = rs.getInt("balance");
            }
            
            
            
            String query1 = "update accountdetails set balance = ? where accountno = ? ";
            PreparedStatement ps= con.prepareStatement(query1);
            ps.setDouble(1,RCamt+Samt);
            ps.setInt(2,Racc);
            ps.executeUpdate();
            
            String query2 = "update accountdetails set balance = ? where accountno = ? ";
            PreparedStatement ps2 = con.prepareStatement(query2);
            ps.setDouble(1,SCamt-Samt);
            ps.setInt(2,Sacc);
            ps.executeUpdate();
            status = true;
        }
        catch(SQLException ex) 
        {
            ex.printStackTrace();
        }
    return status;
    }
}