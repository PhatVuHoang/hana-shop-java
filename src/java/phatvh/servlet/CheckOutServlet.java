/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phatvh.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import phatvh.cart.CartObject;
import phatvh.tblInvoice.tblInvoiceDAO;
import phatvh.tblProduct.tblProductDAO;
import phatvh.tblProduct.tblProductDTO;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "CheckOutServlet", urlPatterns = {"/CheckOutServlet"})
public class CheckOutServlet extends HttpServlet {

    private final String HOME_PAGE = "main.jsp";
    private final String VIEW_CART = "viewcart.jsp";

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
        String url = HOME_PAGE;
        SimpleDateFormat formatDate = new SimpleDateFormat("MM/dd/yyyy");
        String now = formatDate.format(new Date());
        String address = request.getParameter("address");
        try {
            HttpSession session = request.getSession();
            Map<String, Integer> ItemCart = (Map<String, Integer>) session.getAttribute("LISTITEM");
            tblProductDAO dao = new tblProductDAO();
            boolean foundErr = false;
            for (String key : ItemCart.keySet()) {
                tblProductDTO dto = dao.getInfoProduct(key);
                int quantity = ItemCart.get(key);
                if (quantity > dto.getQuantity()) {
                    foundErr = true;
                    break;
                }
            }
            if (address.isEmpty()) {
                String empty = "Address is empty!";
                request.setAttribute("EMPTY", empty);
                url = VIEW_CART;
            } else {
                String error = "";
                float total = 0;
                if (foundErr) {
                    error = "Sorry! Your quantity is too much!";
                    url = VIEW_CART;
                } else {
                    String fullname = request.getParameter("fullname");
                    String phone = request.getParameter("phone");
                    String email = request.getParameter("email");
                    tblProductDAO productDao = new tblProductDAO();
                    tblInvoiceDAO invoiceDao = new tblInvoiceDAO();
                    invoiceDao.insertInvoice(fullname, phone, email, address, now);
                    String InvoiceID = invoiceDao.getIdInvoice();
                    for (String key : ItemCart.keySet()) {
                        tblProductDTO dto = dao.getInfoProduct(key);
                        String productID = dto.getProductID();
                        String productName = dto.getProductName();
                        int quantity = ItemCart.get(key);
                        int quantityProduct = dto.getQuantity() - quantity;
                        float price = dto.getPrice() * quantity;
                        invoiceDao.insertInvoiceDetail(InvoiceID, productID, productName, quantity, price);
                        productDao.updateQuantity(productID, quantityProduct);
                    }
                    CartObject cart = null;
                    session.setAttribute("CUSTCART", cart);
                    session.setAttribute("COUNTITEM", 0);
                }
                request.setAttribute("ERROR", error);
            }
        } catch (SQLException e) {
            log("SQL_CheckOutServlet: " + e.getMessage());
        } catch (NamingException e) {
            log("Naming_CheckOutServlet: " + e.getMessage());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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
