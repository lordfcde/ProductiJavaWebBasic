/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.AccountsDAO;
import DTO.Accounts;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author vinhh
 */
@WebServlet(name = "CreateAccController", urlPatterns = {"/createAcc"})
public class CreateAccController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

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
        processRequest(request, response);
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
        request.setCharacterEncoding("UTF-8");
        AccountsDAO dao = new AccountsDAO();
        String acc = request.getParameter("id");
        String pwd = request.getParameter("accpwd");
        String lName = request.getParameter("accLastName");
        String fName = request.getParameter("accFirstName");
        String bday = request.getParameter("accBirth");
        String gender = request.getParameter("accGender");
        String phone = request.getParameter("accPhone");
        String roleInSystem = request.getParameter("accRole");
        int role = Integer.parseInt(roleInSystem);
        
        try {
            boolean isUse = true;
            Date birth = Date.valueOf(bday);
            Boolean gen = Boolean.valueOf(gender);
            Accounts x = new Accounts();
            x.setAccount(acc);
            x.setPass(pwd);
            x.setLastName(lName);
            x.setFirstName(fName);
            x.setBirthday(birth);
            x.setGender(gen);
            x.setPhone(phone);
            x.setRoleInSystem(role);
            x.setIsUse(isUse);
            dao.create(x);
            
        } catch (Exception e) {
            String errmsg = "The account is already existed, please try again";
            request.setAttribute("errmsg", errmsg);
            request.getRequestDispatcher("createAccs.jsp").forward(request, response);
            return;
        }
        response.sendRedirect("MainController?action=welcome");
        
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
