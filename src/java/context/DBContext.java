/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package context;

/**
 *
 * @author Quocb
 */
import java.sql.*;
public class DBContext {
        protected Connection connection;

        public DBContext() {
            try {
                String url = "jdbc:sqlserver://localhost:1433;databaseName=mangahub;encrypt=false";
                String username = "sa";
                String password = "123456";
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                connection = DriverManager.getConnection(url, username, password);
            } catch (ClassNotFoundException | SQLException ex) {
                System.out.println(ex);
            }
        }
    }
