/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phatvh.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import phatvh.tblHistoryModifier.tblHistoryModifierDAO;
import phatvh.tblProduct.tblProductDAO;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "DeleteServlet", urlPatterns = {"/DeleteServlet"})
public class DeleteServlet extends HttpServlet {

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
        String idRemove = request.getParameter("txtremove");
        String[] id = idRemove.split(";");
        String urlRewriting = "";
        SimpleDateFormat formatDate = new SimpleDateFormat("yyyy/MM/dd");
        String currentDate = formatDate.format(new Date());
        try {
            HttpSession session = request.getSession();
            String fullname = (String) session.getAttribute("FULLNAME");
            tblProductDAO dao = new tblProductDAO();
            tblHistoryModifierDAO modDAO = new tblHistoryModifierDAO();
            for (String string : id) {
                
                dao.removeItem(string);
                modDAO.insertHistoryModify(fullname, currentDate, "Delete", Integer.parseInt(string));
            }
            
            urlRewriting = "Dispatcher?btAction=SearchManage&txtSearchManage=" + session.getAttribute("SEARCHVALUEMANAGE")
                    + "&cbCate=" + session.getAttribute("NAMECATEMANAGE")
                    + "&txtMin="+session.getAttribute("MINMANAGE")
                    + "&txtMax="+session.getAttribute("MAXMANAGE");
        } catch (SQLException e) {
            log("SQL_DeleteServlet: " + e.getMessage());
        } catch (NamingException e) {
            log("Naming_DeleteServlet: " + e.getMessage());
        } finally {
            response.sendRedirect(urlRewriting);
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
