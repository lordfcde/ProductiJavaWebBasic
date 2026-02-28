/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.AccountsDAO;
import DTO.Accounts;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author vinhh
 */
@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs


    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      //B1 Lay thong tin nguoi dung 
      String uname = request.getParameter("uname");
      String pwd = request.getParameter("pwd");
      //B2 
       Accounts us = new AccountsDAO().findAccounts(uname);
        HttpSession session = request.getSession();
        
        //B3 SO SANH DIEU KIEN 
     if(us != null && us.getPass().compareTo(pwd) == 0 && us.getIsUse()){
         session.setAttribute("USER", us);
         session.removeAttribute("slSai");
         response.sendRedirect("MainController?action=welcome");
         
     }else
     {
         // ghi nhan so lan dang nhap sai 
         int slSai = session.getAttribute("slSai") != null ? (int) session.getAttribute("slSai") : 0;
         slSai++;
         session.setAttribute("slSai", slSai);
         String errorMsg = ( us != null ? "Username or password is incorrect ": "The account is not existed please created account");
         request.setAttribute("errmsg", errorMsg);
         request.getRequestDispatcher("login.jsp").forward(request, response);
         
     }
        
        
        
    }
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
