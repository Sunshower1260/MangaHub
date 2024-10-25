package dao;

import context.DBContext;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.comic;

public class fav_listDAO extends DBContext {

    public ArrayList<Integer> getUserFavlist(int user_id) {
        ArrayList<Integer> list = new ArrayList<>();
        String sql = "SELECT comic_id FROM favlist where user_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, user_id);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()) {

                list.add(resultSet.getInt("comic_id"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void addfavlist(int user_id, int comic_id) {
        try {
            String query = "INSERT INTO favlist (user_id, comic_id) VALUES (?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, user_id);
            preparedStatement.setInt(2, comic_id);
            int rowsInserted = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public void removefavlist(int user_id, int comic_id) {
        try {
            String query = "DELETE FROM favlist WHERE user_id = ? AND comic_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, user_id);
            preparedStatement.setInt(2, comic_id);
            int rowsDeleted = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public boolean searchfavlist(int user_id, int comic_id) {
        try {
            String query = "SELECT * FROM favlist\n"
                    + "WHERE user_id = ? AND comic_id = ?;";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, user_id);
            preparedStatement.setInt(2, comic_id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return false;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return true;
    }

    public ArrayList<comic> getFavByPaging(int userid, int page, int pageSize) {
        ArrayList<comic> ans = new ArrayList<>();
        int offset = (page - 1) * pageSize;
        try {
            String query = "SELECT * \n"
                    + "FROM (\n"
                    + "    SELECT comics.id, comics.title, comics.author, comics.published_date\n"
                    + "    FROM comics\n"
                    + "    INNER JOIN favlist ON comics.id = favlist.comic_id\n"
                    + "    WHERE favlist.user_id = ?\n"
                    + ") AS user_fav_comics\n"
                    + "ORDER BY id \n"
                    + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, userid);
            preparedStatement.setInt(2, offset);
            preparedStatement.setInt(3, pageSize);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                ans.add(new comic(resultSet.getInt("id"),
                        resultSet.getString("title"),
                        resultSet.getString("author"),
                        resultSet.getDate("published_date")));
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately in a real-world scenario
        }
        return ans;
    }

    public static void main(String[] args) {
        fav_listDAO dao = new fav_listDAO();
        ArrayList<comic> adc=dao.getFavByPaging(1,1,8);
        for(comic a:adc){
            System.out.println(a);
        }

    }
}
