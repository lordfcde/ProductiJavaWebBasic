package Controller;

import DTO.Categories;
import DTO.Products;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "CreateProductController", urlPatterns = {"/createProd"})
public class CreateProductController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Có thể để trống hoặc gọi doGet/doPost tùy bạn
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        // Lấy thông tin từ form theo kiểu txt...
        String id = request.getParameter("txtId");
        String name = request.getParameter("txtName");
        String priceStr = request.getParameter("txtPrice");
        String unit = request.getParameter("txtUnit");
        String categoryId = request.getParameter("txtType");
        String image = request.getParameter("txtImage");
        
        DAO.ProductsDAO dao = new DAO.ProductsDAO();
        DAO.CategoriesDAO catDao = new DAO.CategoriesDAO();
        
        try {
            Products prod = new Products();
            prod.setProductId(id);
            prod.setProductName(name);
            prod.setPrice(Integer.parseInt(priceStr));
            prod.setUnit(unit);
            prod.setProductImage(image);
            
            // Tìm Category object dựa trên ID từ dropdown (Integer)
            Categories cat = catDao.findCategories(Integer.parseInt(categoryId));
            prod.setTypeId(cat);
            
            dao.create(prod);
            
            // Thành công thì nhảy về list theo đúng style của bạn
            response.sendRedirect("MainController?action=listprods");
            
        } catch (Exception e) {
            // Thất bại thì báo lỗi và đẩy ngược lại trang tạo
            String errmsg = "Cannot create Product, maybe duplicate ID. Please try again!";
            request.setAttribute("errmsg", errmsg);
            request.getRequestDispatcher("createProds.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "";
    }
}