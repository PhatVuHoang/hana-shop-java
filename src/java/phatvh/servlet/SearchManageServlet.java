/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phatvh.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import phatvh.tblProduct.tblProductDAO;
import phatvh.tblProduct.tblProductDTO;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "SearchManageServlet", urlPatterns = {"/SearchManageServlet"})
public class SearchManageServlet extends HttpServlet {

    private final String MANAGE_PAGE = "manage.jsp";

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
        String url = MANAGE_PAGE;
        String searchValue = request.getParameter("txtSearchManage");
        String min = request.getParameter("txtMin");
        String max = request.getParameter("txtMax");
        String index = request.getParameter("page");
        String nameCate = request.getParameter("cbCate");
        SimpleDateFormat formatDate = new SimpleDateFormat("MM/dd/yyyy");
        String now = formatDate.format(new Date());
        try {
            String query, queryCount;
            tblProductDAO dao = new tblProductDAO();
            if(min == null){
                min = "1";
            }
            if (min.equals("")) {
                min = "1";
            }
            if(max == null){
                max = dao.getMaxPrice();
            }
            if (max.equals("")) {
                max = dao.getMaxPrice();
            }
            
            if (searchValue == null) {
                searchValue = "";
            }
            if (index == null) {
                index = "1";
            }
            if (nameCate == null) {
                nameCate = "Category";
            }
            int paging = (Integer.parseInt(index) - 1) * 20;
            if (nameCate.equals("Category")) {
                queryCount = "select COUNT(productID) "
                        + "from tblProduct a join tblCategory b on a.categoryID = b.categoryID "
                        + "where price >= " + min + " and price <= " + max + " and a.nameProduct like '%" + searchValue + "%' ";
            } else {
                queryCount = "select COUNT(productID) "
                        + "from tblProduct a join tblCategory b on a.categoryID = b.categoryID "
                        + "where categoryName like '%" + nameCate + "%' and price >= " + min + " and price <= " + max + " and a.nameProduct like '%" + searchValue + "%' ";
            }
            int count = dao.countPage(queryCount);
            int page = count / 20;
            if (count % 20 != 0) {
                page++;
            }
            if (nameCate.equals("Category")) {
                query = "select productID, imageProduct, nameProduct, descriptionProduct, price, quantity, createDate, invalidDate, status, categoryName "
                        + "from tblCategory a join tblProduct b on a.categoryID = b.categoryID "
                        + "where nameProduct like '%" + searchValue + "%' and price >= " + min + " and price <= " + max + " "
                        + "order by createDate "
                        + "offset " + paging + " rows "
                        + "fetch next 20 rows only; ";
            } else {
                query = "select productID, imageProduct, nameProduct, descriptionProduct, price, quantity, createDate, invalidDate, status, categoryName \n"
                        + "from tblCategory a join tblProduct b on a.categoryID = b.categoryID \n"
                        + "where nameProduct like '%" + searchValue + "%' and categoryName like '%" + nameCate + "%' and price >= " + min + " and price <= " + max + " "
                        + "order by createDate \n"
                        + "offset " + paging + " rows \n"
                        + "fetch next 20 rows only; ";
            }
            ArrayList<tblProductDTO> listProduct = dao.getProductManage(query);
            ArrayList<String> listCate = dao.loadProductCate();
            HttpSession session = request.getSession();
            session.setAttribute("NAMECATEMANAGE", nameCate);
            session.setAttribute("LISTCATE", listCate);
            for (tblProductDTO productDTO : listProduct) {
                productDTO.setImageProduct("image\\"+ productDTO.getImageProduct());
            }
            session.setAttribute("LISTPRODUCTMANAGE", listProduct);
            session.setAttribute("COUNTMANAGE", page);
            session.setAttribute("MAXMANAGE", max);
            session.setAttribute("MINMANAGE", min);
            session.setAttribute("SEARCHVALUEMANAGE", searchValue);
            session.setAttribute("NOW", now);
        } catch (SQLException e) {
            log("SQL_SearchManageServlet: " + e.getMessage());
        } catch (NamingException e) {
            log("Naming_SearchManageServlet: " + e.getMessage());
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
