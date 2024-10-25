package controller;

import dao.fav_listDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class favAddServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fav = request.getParameter("action");
        int userid = Integer.parseInt(request.getParameter("user_id"));
        int comicid = Integer.parseInt(request.getParameter("comic_id"));
     
       
        fav_listDAO dao = new fav_listDAO();

        try {
            if (fav.equalsIgnoreCase("add")&& dao.searchfavlist(userid, comicid)) {
                dao.addfavlist(userid, comicid);
            } else if (fav.equalsIgnoreCase("remove")&& !dao.searchfavlist(userid, comicid)) {
                dao.removefavlist(userid, comicid);
            }
            request.getRequestDispatcher("comicinfo.jsp?id=" + comicid).forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("comicinfo.jsp?id=" + comicid + "&error=actionFailed");
        }
    }

    @Override
    public String getServletInfo() {
        return "Favorite Add/Remove Servlet";
    }
}
