package dao;

import context.DBContext;
import java.sql.*;
import java.util.ArrayList;
import model.comic;

public class searchDAO extends DBContext {

    public ArrayList<comic> searchComics(String query) {
        ArrayList<comic> ans = new ArrayList<>();
        String sql = "SELECT id, title, author, published_date FROM comics WHERE title LIKE ?";
        try {
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setString(1, "%" + query + "%");
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                comic comic = new comic(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("author"),
                        rs.getDate("published_date")
                );
                ans.add(comic);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ans;
    }

    public ArrayList<comic> tagComics(String query) {
        ArrayList<comic> ans = new ArrayList<>();
        String sql = "SELECT c.id, c.title, c.author, c.published_date "
                   + "FROM comics c "
                   + "JOIN comic_genres cg ON c.id = cg.comic_id "
                   + "JOIN genres g ON cg.genre_id = g.genre_id "
                   + "WHERE g.genre_name = ?";
        try {
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setString(1, query);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                comic comic = new comic(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("author"),
                        rs.getDate("published_date")
                );
                ans.add(comic);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return ans;
    }

    public static void main(String[] args) {
        searchDAO dao = new searchDAO();
        ArrayList<comic> adc = dao.searchComics("n");
        for (comic a : adc) {
            System.out.println(a);
        }
    }
}
