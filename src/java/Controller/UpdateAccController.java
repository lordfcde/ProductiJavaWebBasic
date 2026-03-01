/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.AccountsDAO;
import DAO.CategoriesDAO;
import DTO.Accounts;
import DTO.Categories;
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
@WebServlet(name = "UpdateAccController", urlPatterns = {"/updateAccs"})
public class UpdateAccController extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
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
        String id = request.getParameter("acc");

        AccountsDAO dao = new AccountsDAO();
        Accounts x = dao.findAccounts(id);
        request.setAttribute("acc", x);
        request.getRequestDispatcher("updateAccs.jsp").forward(request, response);
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
        String isUse = request.getParameter("isUse");

        try {
            Boolean uisUse = Boolean.valueOf(isUse);
            Boolean gen = Boolean.valueOf(gender);
            Date birth = Date.valueOf(bday);
            Accounts x = dao.findAccounts(acc);
            x.setIsUse(uisUse);
            x.setPass(pwd);
            x.setLastName(lName);
            x.setFirstName(fName);
            x.setBirthday(birth);
            x.setGender(gen);
            x.setPhone(phone);
            x.setRoleInSystem(role);
            dao.edit(x);

        } catch (Exception e) {
            String errmsg = "Cannot update the accounts , please try again";
            request.setAttribute("errmsg", errmsg);
            request.getRequestDispatcher("updateAccs.jsp").forward(request, response);
            return;
        }
        response.sendRedirect("MainController?action=listaccs");

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
