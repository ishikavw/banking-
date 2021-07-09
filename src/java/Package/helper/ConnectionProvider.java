/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Package.helper;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Adminpc
 */
public class ConnectionProvider {
 
    public static Connection con;

    public static Connection getConnection() 
    {
        try{
            if(con == null )
            {
              Class.forName("com.mysql.cj.jdbc.Driver");  
                con = DriverManager.getConnection("jdbc:mysql://localhost/bank_spark","root","");
                
            }
        } 
        catch (Exception ex) {
           ex.printStackTrace();
        }
        
        return con;
    }
}
    
    
