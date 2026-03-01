/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.CategoriesDAO;
import DAO.ProductsDAO;
import DTO.Categories;
import DTO.Products;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "UpdateProductController", urlPatterns = {"/updateProd"})
public class UpdateProductController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Nếu lỡ người dùng gõ URL thẳng thì ném về doPost hoặc về trang chủ
        response.sendRedirect("MainController?action=listprods");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Cài đặt tiếng Việt để lưu tên sản phẩm không bị lỗi font
        request.setCharacterEncoding("UTF-8");

        // 2. Hứng toàn bộ dữ liệu từ form updateProds.jsp (khớp tên txt...)
        String id = request.getParameter("txtId");
        String name = request.getParameter("txtName");
        String priceStr = request.getParameter("txtPrice");
        String unit = request.getParameter("txtUnit");
        String typeIdStr = request.getParameter("txtType"); // ID của danh mục từ dropdown
        String image = request.getParameter("txtImage");

        ProductsDAO prodDao = new ProductsDAO();
        CategoriesDAO catDao = new CategoriesDAO();

        try {
            // 3. Kéo đối tượng sản phẩm cũ từ Database lên
            Products prod = prodDao.findProducts(id);

            // 4. Ghi đè các thông tin mới do người dùng vừa sửa
            prod.setProductName(name);
            prod.setPrice(Integer.parseInt(priceStr)); // Ép kiểu giá tiền
            prod.setUnit(unit);
            prod.setProductImage(image);

            // 5. Cập nhật khóa ngoại Category (Ép kiểu Integer như DAO của bạn yêu cầu)
            Categories cat = catDao.findCategories(Integer.parseInt(typeIdStr));
            prod.setTypeId(cat);

            // 6. Gọi lệnh edit để lưu đè xuống Database
            prodDao.edit(prod);

            // 7. Lưu thành công thì nhảy về trang danh sách bằng sendRedirect (chuẩn style của bạn)
            response.sendRedirect("MainController?action=listprods");

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Lỗi khi update sản phẩm: " + e.getMessage());

            
            String errmsg = "Cannot update Product, please check your input and try again!";
            request.setAttribute("errmsg", errmsg);

            
            try {
                request.setAttribute("listCats", catDao.findCategoriesEntities());
                request.setAttribute("ITEM", prodDao.findProducts(id));
            } catch (Exception ex) {
                ex.printStackTrace();
            }

           
            request.getRequestDispatcher("updateProds.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "";
    }
}
