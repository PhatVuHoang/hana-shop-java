/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phatvh.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
@WebServlet(name = "InfoServlet", urlPatterns = {"/InfoServlet"})
public class InfoServlet extends HttpServlet {
    private final String INFO_PAGE = "info.jsp";
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
        String productID = request.getParameter("IDProduct");
        String url = INFO_PAGE;
        String searchValue = request.getParameter("txtSearch");
        String nameCate = request.getParameter("cbCate");
        String min = request.getParameter("txtMin");
        String max = request.getParameter("txtMax");
        try {
            tblProductDAO dao = new tblProductDAO();
            tblProductDTO dto = dao.getInfoProduct(productID);
            HttpSession session = request.getSession();
            session.setAttribute("ID", productID);
            session.setAttribute("INFO", dto);
            session.setAttribute("SEARCHVALUE", searchValue);
            session.setAttribute("MAX", max);
            session.setAttribute("MIN", min);
            session.setAttribute("NAMECATE", nameCate);
        } catch(SQLException e){
            log("SQL_InfoServlet: " + e.getMessage());
        } catch(NamingException e){
            log("Naming_InfoServlet: " + e.getMessage());
        }
        finally {
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
