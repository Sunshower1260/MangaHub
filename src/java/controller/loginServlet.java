package controller;

import dao.accountDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import model.account;

@WebServlet(urlPatterns = {"/login","/loginServlet"})
public class loginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember"); 

        accountDAO accountDAO = new accountDAO();
        account account = accountDAO.checkLogin(username, password);

        if (account == null) {
            request.setAttribute("errorMessage", "Invalid username or password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("userid", account.getUserid());
            session.setAttribute("username", username);

            if (remember != null && remember.equals("on")) {
                Cookie usernameCookie = new Cookie("username", username);
                usernameCookie.setMaxAge(30 * 24 * 60 * 60); 
                response.addCookie(usernameCookie);
            }

            response.sendRedirect("begin.jsp");
        }
    }
}
