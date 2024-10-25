package dao;

import context.DBContext;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.comic;

public class comicDAO extends DBContext {
    
    public List<comic> getAll(){
        List<comic> list = new ArrayList<>();
        String sql = "SELECT * FROM comics";
        try{
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String title = resultSet.getString("title");
                String author = resultSet.getString("author");
                java.util.Date published_date = resultSet.getDate("published_date");
       
                
                comic c = new comic(id, title, author, published_date);
                list.add(c);
            }
        } catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
    
    public comic getComicById(int comicId) {
        String sql = "SELECT * FROM comics WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, comicId);
            ResultSet resultSet = ps.executeQuery();
            if (resultSet.next()) {
                int id = resultSet.getInt("id");
                String title = resultSet.getString("title");
                String author = resultSet.getString("author");
                Date published_date = resultSet.getDate("published_date");
                String descriptionComic = resultSet.getString("descriptionComic");
                String viewer = resultSet.getString("viewer");
                return new comic(id, title, author, published_date, descriptionComic, viewer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public ArrayList<comic> getpaging(int page, int pageSize) {
    ArrayList<comic> ans = new ArrayList<>();
    int offset = (page - 1) * pageSize;
    String query = "SELECT * FROM comics ORDER BY published_date OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

    try (
         PreparedStatement pt = connection.prepareStatement(query)) {

        pt.setInt(1, offset);
        pt.setInt(2, pageSize);
     ResultSet resultSet = pt.executeQuery();

        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            String title = resultSet.getString("title");
            String author = resultSet.getString("author");
            Date published_date = resultSet.getDate("published_date");
       
            ans.add(new comic(id, title, author, published_date));
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return ans;
}
}