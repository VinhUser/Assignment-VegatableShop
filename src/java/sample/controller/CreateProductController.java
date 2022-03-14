/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.product.ProductDTO;
import sample.product.ProductError;
import sample.user.UserDAO;
import sample.user.UserDTO;
import sample.user.UserError;

/**
 *
 * @author ThienPN
 */
@WebServlet(name = "CreateProductController", urlPatterns = {"/CreateProductController"})
public class CreateProductController extends HttpServlet {

    private static final String ERROR = "createproduct.jsp";
    private static final String SUCCESS = "MainController?action=Searchp&searchp=";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        SimpleDateFormat formatter = new SimpleDateFormat("mm-dd-yyyy");

        ProductError productError = new ProductError();
        try {
            String productID = request.getParameter("productID");
            String productName = request.getParameter("productName");
            String image = "img/" + request.getParameter("image");
            int price = Integer.parseInt(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String catagory = "VT";
            String importDate = request.getParameter("importDate");
            Date today = formatter.parse(importDate);
//            String importDate = formatter.format(today);
            String usingDate = request.getParameter("usingDate");
            Date aftertoday = formatter.parse(usingDate);

            String status = "1";
            boolean checkValidation = true;
            UserDAO dao = new UserDAO();

            boolean checkDuplicateProduct = dao.checkDuplicateProduct(productID);
            if (aftertoday.before(today)) {
                productError.setUsingDateError("Date must after Today");
                checkValidation = false;
            }
            if (checkDuplicateProduct) {
                productError.setProductIDError("Duplicate ProductID!");
                checkValidation = false;
            }
            if (productID.length() != 3) {
                productError.setProductIDError("ProductID must 3");
                checkValidation = false;
            }
            if (price < 0) {
                productError.setPriceError(" Price must larger than 0");
                checkValidation = false;
            }
            if (quantity < 0) {
                productError.setQuantityError(" Quantity must larger than 0");
                checkValidation = false;
            }
            if (checkValidation) {
                ProductDTO product = new ProductDTO(productID, productName, image, price, quantity, catagory, importDate, usingDate, status);
                boolean checkCreate = dao.createproduct(product);
                
                if (checkCreate) {
                    url = SUCCESS;
                }
            } else {
                request.setAttribute("PRODUCT_ERROR", productError);
            }

        } catch (Exception e) {
            log("Error at CreateProductController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
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
