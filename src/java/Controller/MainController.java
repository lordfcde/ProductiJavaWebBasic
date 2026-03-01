/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

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
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

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
        //1. lay yeu cau tu menu 
        String action = request.getParameter("action");
        //2. kiem tra dang nhap 
        HttpSession session = request.getSession();
        Accounts user = (Accounts) session.getAttribute("USER");
        //3 Trang dich den default
        String url = "login.jsp";
        int slSai = session.getAttribute("slSai") != null ? (int) session.getAttribute("slSai") : 0;

        if (action == null) {
            action = "welcome";
        }
        switch (action.toLowerCase()) {
            case "welcome":
                if (user != null) {
                    url = "index.jsp";
                }
                break;

            case "login":
                if (slSai <= 5) {
                    url = "login";
                } else {
                    url = "denied.jsp";
                }
                break;

            case "logout":
                if (user != null) {
                    url = "logOut";
                }
                break;

            case "createlogin":
                if (user == null) {
                    url = "createAccs.jsp";
                } else {
                    url = "index.jsp";
                }
                break;

            case "listaccs":
                if (user != null && user.getRoleInSystem() == 1) {
                    url = "accounts";
                }
                break;

            case "insertacc":
                if (user != null && user.getRoleInSystem() == 1) {
                    url = "createAcc";
                }
                break;

            case "xoaaccs":
                if (user != null && user.getRoleInSystem() == 1) {
                    url = "deleteAccs";
                }
                break;

            case "updaccs":
                if (user != null && user.getRoleInSystem() == 1) {
                    url = "updateAccs";
                }
                break;

            case "listcats":
                if (user != null) {
                    url = "categories";
                }
                break;

            case "addcat":
                if (user != null) {
                    url = "createCats.jsp";
                }
                break;

            case "createcat":
                if (user != null) {
                    url = "createCat";
                }
                break;

            case "xoacats":
                if (user != null) {
                    url = "deleteCats";
                }
                break;

            case "updcats":
                if (user != null) {
                    url = "updateCats";
                }
                break;

            case "listprods":
                if (user != null) {
                    url = "products";
                }
                break;

            case "addprod":
                if (user != null) {
                    url = "LoadAddProdController";
                }
                break;

            case "createprod":
                if (user != null) {
                    url = "createProd";
                }
                break;

            case "xoaprods":
                if (user != null) {
                    url = "deleteProds";
                }
                break;

            case "updprods":
                if (user != null) {
                    url = "loadProd";
                }
                break;

            case "updateprod":
                if (user != null) {
                    url = "updateProd";
                }
                break;
        }

        request.getRequestDispatcher(url).forward(request, response);
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
        processRequest(request, response);
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
