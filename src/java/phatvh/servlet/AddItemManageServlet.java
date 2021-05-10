/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phatvh.servlet;

import java.io.IOException;
import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import phatvh.tblHistoryModifier.tblHistoryModifierDAO;
import phatvh.tblProduct.AddItemErrorDTO;
import phatvh.tblProduct.tblProductDAO;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "AddItemManageServlet", urlPatterns = {"/AddItemManageServlet"})
public class AddItemManageServlet extends HttpServlet {

    private final String ERROR_PAGE = "additem.jsp";
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
        String proName = request.getParameter("txtNameProduct");
        String img = request.getParameter("txtImage");
        String description = request.getParameter("txtDescription");
        String price = request.getParameter("txtPrice");
        String quantity = request.getParameter("txtQuantity");
        String nameCate = request.getParameter("cbCate");
        HttpSession session = request.getSession();
        String invalidDate = request.getParameter("txtInvalidDate");
        String createDate = (String) session.getAttribute("NOW");
        String fullname = (String) session.getAttribute("FULLNAME");
        String url = ERROR_PAGE;
        int invalidYear = 0;
        int invalidMonth = 0;
        int invalidDay = 0;
        try {
            boolean FoundErr = false;
            AddItemErrorDTO error = new AddItemErrorDTO();
            tblProductDAO dao = new tblProductDAO();
            if (proName.isEmpty()) {
                FoundErr = true;
                error.setNameProductErr("Name product is empty!");
            }
            if (img.isEmpty()) {
                FoundErr = true;
                error.setImgProductErr("Link image is empty!");
            }
            if (description.isEmpty()) {
                FoundErr = true;
                error.setDescriptionErr("Description is empty!");
            }
            if (invalidDate.isEmpty()) {
                FoundErr = true;
                error.setInvalidDateEmpty("Invalid date is empty!");
            } else {
                String[] invalid = invalidDate.split("-");
                invalidYear = Integer.parseInt(invalid[0]);
                invalidMonth = Integer.parseInt(invalid[1]);
                invalidDay = Integer.parseInt(invalid[2]);
                String[] create = createDate.split("/");
                int createMonth = Integer.parseInt(create[0]);
                int createDay = Integer.parseInt(create[1]);
                int createYear = Integer.parseInt(create[2]);
                if (invalidYear < createYear) {
                    FoundErr = true;
                    error.setInvalidDateErr("Invalid (year) date must be greater than create date");
                } else if(invalidYear==createYear) {
                    if (invalidMonth < createMonth) {
                        FoundErr = true;
                        error.setInvalidDateErr("Invalid (month) date must be greater than create date");
                    } else if(invalidMonth==createMonth) {
                        if (invalidDay < createDay) {
                            FoundErr = true;
                            error.setInvalidDateErr("Invalid (day) date must be greater than create date");
                        }
                    }
                }
            }
            if (price.isEmpty()) {
                FoundErr = true;
                error.setPriceIsEmpty("Price is empty!");
            } else if (Integer.parseInt(price) <= 0) {
                FoundErr = true;
                error.setPriceErr("Price must be greater than 0");
            }
            if (quantity.isEmpty()) {
                FoundErr = true;
                error.setQuantityIsEmpty("Quantity is empty!");
            } else if (Integer.parseInt(quantity) <= 0) {
                FoundErr = true;
                error.setQuantityErr("Quantity must be greater than 0");
            }
            if (FoundErr) {
                request.setAttribute("ERRORS", error);
            } else {
                tblHistoryModifierDAO adminDAO = new tblHistoryModifierDAO();
                int proID = dao.getIdHighest() + 1;
                String action = "Add item";
                adminDAO.insertHistoryModify(fullname, createDate, action, proID);
                String idCate = dao.getIdCate(nameCate);
                String invalidDateFormat = invalidMonth + "/" + invalidDay + "/" + invalidYear;
                dao.AddItem(img, proName, description, price, quantity, createDate, invalidDateFormat, idCate);
                url = MANAGE_PAGE;
            }
        } catch (SQLException e) {
            log("SQL_AddItemManageServlet: " + e.getMessage());
        } catch (NamingException e) {
            log("Naming_AddItemManageServlet: " + e.getMessage());
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
