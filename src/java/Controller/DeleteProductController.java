package Controller;

import DAO.exceptions.NonexistentEntityException;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "DeleteProductController", urlPatterns = {"/deleteProds"})
public class DeleteProductController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");

        DAO.ProductsDAO dao = new DAO.ProductsDAO();

        try {
            dao.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(DeleteProductController.class.getName()).log(Level.SEVERE, null, ex);
        }

        request.getRequestDispatcher("MainController?action=listprods").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Delete Product Controller";
    }
}
