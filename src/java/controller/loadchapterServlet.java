/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.comicDAO;
import dao.historyDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import model.comic;

/**
 *
 * @author Quocb
 */
public class loadchapterServlet extends HttpServlet {
   
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
          String chapterId = request.getParameter("chapter");
          int lastchapter =Integer.parseInt(chapterId);
          
        String comicId = request.getParameter("id");
        int comicid=Integer.parseInt(comicId);
        
        HttpSession session = request.getSession();
        
        if (session.getAttribute("userid") != null){
            int userId = (int) session.getAttribute("userid");
            historyDAO hisdao= new historyDAO();
        if (hisdao.SearchHistory(userId, comicid)==null){
            hisdao.addHistory(userId, comicid, lastchapter);
        }else{
            hisdao.updateHistory(userId, comicid, lastchapter);
        }
        }
        
        
        comicDAO dao=new comicDAO();
        comic truyen=dao.getComicById(Integer.parseInt(comicId));

        String chapterPath = getServletContext().getRealPath("/") + "images/" + comicId + "/chapter" + chapterId;
        File chapterDir = new File(chapterPath);
         String[] imageFiles = chapterDir.list((dir, name) -> name.toLowerCase().endsWith(".jpg") || name.toLowerCase().endsWith(".png"));

        if (imageFiles != null) {
            List<String> imagePaths = new ArrayList<>();
            for (String imageFile : imageFiles) {
                imagePaths.add("images/" + comicId + "/chapter" + chapterId + "/" + imageFile);
            }
            Integer chapter=Integer.parseInt(chapterId);
            
            request.setAttribute("chapterId", chapter);
            request.setAttribute("comicId", comicId);
            request.setAttribute("namecomic", truyen.getTitle());
            request.setAttribute("imagePaths", imagePaths);
            // thêm ngày cập nhật vào 
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Chapter not found");
            return;
        }

        request.getRequestDispatcher("chapter.jsp").forward(request, response);
        
       
       
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
        doGet(request,response);
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
