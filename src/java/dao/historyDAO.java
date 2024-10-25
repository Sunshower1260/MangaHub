package dao;

import context.DBContext;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.history;

public class historyDAO extends DBContext {

    public ArrayList<history> getHisById(int userid) {
        ArrayList<history> ans = new ArrayList<>();
        String sql = "SELECT c.id, c.title, h.last_chapter\n"
                + "FROM comics c\n"
                + "JOIN history h ON c.id = h.comic_id\n"
                + "where user_id=?\n"
                + "ORDER BY h.last_chapter DESC;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userid);
            ResultSet resultSet = ps.executeQuery();

            while (resultSet.next()) {
                history a = new history(userid, resultSet.getInt("id"), resultSet.getString("title"), resultSet.getInt("last_chapter"));
                ans.add(a);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return ans;
    }

    public void updateHistory(int userid, int comicid, int lastchapter) {
        String sql = "UPDATE history SET last_chapter=? where user_id=? and comic_id=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, lastchapter);
            ps.setInt(2, userid);
            ps.setInt(3, comicid);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public history SearchHistory(int userid, int comicid) {
        String sql = "SELECT c.title, h.last_chapter\n"
                + "FROM comics c\n"
                + "JOIN history h ON c.id = h.comic_id\n"
                + "WHERE h.user_id = ? AND h.comic_id = ?;";
        history a = null;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userid);
            ps.setInt(2, comicid);
            ResultSet resultSet = ps.executeQuery();
            if (resultSet.next()) {
                a = new history(userid, comicid, resultSet.getString("title"), resultSet.getInt("last_chapter"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return a;
    }

    public void addHistory(int userId, int comicId, int lastChapter) {
        String sql = "INSERT INTO history (user_id, comic_id, last_chapter) VALUES (?, ?, ?)";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            stmt.setInt(2, comicId);
            stmt.setInt(3, lastChapter);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public void deleteHistory(int userId, int comicId) {
        String sql = "DELETE from history where user_id=? and comic_id=?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            stmt.setInt(2, comicId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();

        }
    }

    public static void main(String[] args) {
        historyDAO dao = new historyDAO();
        dao.deleteHistory(1, 4);

    }

}
