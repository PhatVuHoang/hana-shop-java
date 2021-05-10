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
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import phatvh.tblHistoryModifier.tblHistoryModifierDAO;
import phatvh.tblProduct.AddItemErrorDTO;
import phatvh.tblProduct.tblProductDAO;

/**
 *
 * @author ASUS
 */
@MultipartConfig
@WebServlet(name = "UpdateServlet", urlPatterns = {"/UpdateServlet"})
public class UpdateServlet extends HttpServlet {

    private final String MANAGE = "manage.jsp";

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
        String proID = request.getParameter("txtProID");
//        String linkImg = request.getParameter("txtImage");
        Part image = request.getPart("txtImage");
        String txtImageTmp = request.getParameter("txtImageTmp").trim();
        if (image.getSize() > 0) {
            String realPath = getServletContext().getRealPath("/") + txtImageTmp;
            image.write(realPath);
        }
    
        String namePro = request.getParameter("txtproductName");
        String description = request.getParameter("txtDescription");
        float price = Float.parseFloat(request.getParameter("txtPrice"));
        int quantity = Integer.parseInt(request.getParameter("txtQuantity"));
        String nameCate = request.getParameter("cbNameCate");
        String status = request.getParameter("cbStatus");
        String searchValue = request.getParameter("txtSearchManage");
        String min = request.getParameter("txtMin");
        String max = request.getParameter("txtMax");
        String cate = request.getParameter("cbCate");
        String invalidDate = request.getParameter("txtInvalidDate");
        String createDate = request.getParameter("txtCreateDate");
        SimpleDateFormat formatDate = new SimpleDateFormat("yyyy/MM/dd");
        String currentDate = formatDate.format(new Date());
        HttpSession session = request.getSession();
        String fullname = (String) session.getAttribute("FULLNAME");
        String action = "update";
        String url = MANAGE;
        if (searchValue == null) {
            searchValue = "";
        }
        if (cate == null) {
            cate = "Category";
        }
        if (min == null) {
            min = "";
        }
        if (max == null) {
            max = "";
        }
        try {
            AddItemErrorDTO error = new AddItemErrorDTO();
            if (invalidDate.compareTo(createDate) < 0) {
                error.setInvalidDateErr("Invalid date must be greater than create date (at id: " + proID + ")");
                request.setAttribute("ERRORDATE", error);
            } 
            else {
                tblProductDAO dao = new tblProductDAO();
                tblHistoryModifierDAO adminDAO = new tblHistoryModifierDAO();
                adminDAO.insertHistoryModify(fullname, currentDate, action, Integer.parseInt(proID));
                String cateID = dao.getIdCate(nameCate);
                dao.updateItem(namePro, description, price, quantity, cateID, status, invalidDate, proID);
                url = "Dispatcher?"
                        + "btAction=SearchManage"
                        + "&txtSearchManage=" + searchValue
                        + "&cbCate=" + cate
                        + "&txtMin=" + min
                        + "&txtMax=" + max;
            }
        } catch (SQLException e) {
            log("SQL_UpdateServlet: " + e.getMessage());
        } catch (NamingException e) {
            log("Naming_UpdateServlet: " + e.getMessage());
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
