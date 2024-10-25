/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.comicDAO;
import dao.genreDAO;
import dao.historyDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Set;
import model.comic;
import model.history;

/**
 *
 * @author Quocb
 */
public class comicinfoServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    
    int id = Integer.parseInt(request.getParameter("id"));
    
    comicDAO dao = new comicDAO();
    comic truyen = dao.getComicById(id);
    
    genreDAO DAO = new genreDAO();
    ArrayList<String> genre = DAO.getGenreById(id);
    request.setAttribute("genre", genre);
    request.setAttribute("truyen", truyen);
    
    HttpSession session = request.getSession();
    if (session.getAttribute("userid") == null) {
        request.getRequestDispatcher("comicinfo.jsp?id=" + id).forward(request, response);
    } else {
        int userId = (int) session.getAttribute("userid");
        historyDAO hisdao = new historyDAO();
        history a = hisdao.SearchHistory(userId, id);
        if (a != null) {
            request.getRequestDispatcher("comicinfo.jsp?id=" + id + "&oldchapter=" + a.getLastchapter()).forward(request, response);
        } else {
            request.getRequestDispatcher("comicinfo.jsp?id=" + id).forward(request, response);
        }
    }
}


    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
