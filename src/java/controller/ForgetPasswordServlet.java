package controller;

import dao.accountDAO;
import model.account;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/ForgetPasswordServlet")
public class ForgetPasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        accountDAO accountDAO = new accountDAO();
        account account = accountDAO.getAccountByEmailAndPhone(email, phone);

        if (account != null) {
            String password = account.getPassword();
            response.setContentType("text/html;charset=UTF-8");

            PrintWriter out = response.getWriter();
            out.println("<html><head><script>");
            out.println("alert('Your password is: " + password + "');");
            out.println("</script></head><body></body></html>");

            out.println("<script>");
            out.println("setTimeout(function() { window.location.href = 'login.jsp'; }, 3000);"); 
            out.println("</script>");
        } else {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('Invalid email or phone number. Please try again.');</script>");
        }
    }
}
