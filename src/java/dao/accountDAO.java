/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.account;

public class accountDAO extends DBContext {
    
    public ArrayList<account> getAll(){
        ArrayList<account> list = new ArrayList<>();
        String sql = "SELECT * FROM account";
        try{
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()){
                account a = new account(resultSet.getInt("userid"),resultSet.getString("username"), resultSet.getString("password"), resultSet.getString("role"));
                 list.add(a);
            }
        } catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
    
    public account getUserById(int userid) {
        account acc = null;
        try{
            String querry = "SELECT * FROM account WHERE userid = ?";
            PreparedStatement ps = connection.prepareStatement(querry);
            ps.setInt(1, userid);
            ResultSet rs = ps.executeQuery();
            if (rs.next()){
                String fullname = rs.getString("fullname");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String role = rs.getString("role");
                String email = rs.getString("email");
                String phone = rs.getString("phone");

                acc = new account(userid, fullname, username, password, role, email, phone);
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return acc;
    }
    
    public account getAccountByEmailAndPhone(String email, String phone) {
        account acc = null;
        try {
            String query = "SELECT * FROM account WHERE email = ? AND phone = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, phone);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                int userid = rs.getInt("userid");
                String fullname = rs.getString("fullname");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String role = rs.getString("role");

                acc = new account(userid, fullname, username, password, role, email, phone);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return acc;
    }
    
    public account checkLogin(String username, String password) {
    try {
        String query = "SELECT userid, username, password, role FROM account WHERE username = ? AND password = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, username);
        preparedStatement.setString(2, password);
        ResultSet rs = preparedStatement.executeQuery();

        if (rs.next()) {
            int userid = rs.getInt("userid");
            String role = rs.getString("role");
            return new account(userid, username, password, role);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return null;
}

    
    public boolean addUser(String fullname, String username, String password, String email, String phone){
        try {
            String query = "INSERT INTO account (fullname, username, password, role, email, phone ) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, fullname);
            preparedStatement.setString(2, username);
            preparedStatement.setString(3, password);
            preparedStatement.setString(4, "user");
            preparedStatement.setString(5, email);
            preparedStatement.setString(6, phone);
            int rowsInserted = preparedStatement.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public static void main(String [] args){
       accountDAO dao = new accountDAO();
        ArrayList<account> adc = dao.getAll();
        for (account a:adc){
            System.out.println(a);
        }
           } 
}