/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.comic;

/**
 *
 * @author Quocb
 */
public class genreDAO extends DBContext {

    public ArrayList<String> getGenreById(int id) {
        ArrayList<String> ans = new ArrayList<>();
        String sql = "SELECT g.genre_name\n"
                + "FROM comics c\n"
                + "JOIN comic_genres cg ON c.id = cg.comic_id\n"
                + "JOIN genres g ON cg.genre_id = g.genre_id\n"
                + "where c.id=?";
        try{
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()) {
                String c = resultSet.getString("genre_name");
                ans.add(c);
            }
        } catch(Exception e){
            e.printStackTrace();
        }
       
        return ans;
    }
    public static void main(String [] args){
       genreDAO dao = new genreDAO();
        ArrayList<String> adc = dao.getGenreById(1);
        for (String a:adc){
            System.out.println(a);
        }
           } 

}
