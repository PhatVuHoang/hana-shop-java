/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phatvh.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import phatvh.tblInvoice.tblInvoiceDAO;
import phatvh.tblInvoice.tblInvoiceDTO;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "SearchHistoryServlet", urlPatterns = {"/SearchHistoryServlet"})
public class SearchHistoryServlet extends HttpServlet {

    private final String HISTORY_PAGE = "history.jsp";

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
        HttpSession session = request.getSession();
        String fullname = (String) session.getAttribute("FULLNAME");
        String select = request.getParameter("radio");
        String searchValue = request.getParameter("txtSearchHistory");
        String dateValue = request.getParameter("txtDateHistory");
        //đã sửa thành search or
        //thêm select để đánh dấu field search
        if(select == null) {
            select = (String) session.getAttribute("SELECT");
        }
        if (select.equals("1")) {
            if(dateValue == null) {
                dateValue = (String) session.getAttribute("SEARCHDATEHISTORY");
            }
        } else {
            if(searchValue == null) {
                searchValue = (String) session.getAttribute("SEARCHVALUEHISTORY");
                
            }
        }
        String url = HISTORY_PAGE;
        try {
            if(dateValue == null && searchValue == null){
                String query = "select productName, quantity, price, dateOrder "
                        + "from tblInvoice a join tblInvoiceDetail b on a.InvoiceID = b.InvoiceID "
                        + "where fullname like '%" + fullname + "%'";
                tblInvoiceDAO dao = new tblInvoiceDAO();
                ArrayList<tblInvoiceDTO> listInvoice = dao.getInvoice(query);
                session.setAttribute("LISTINVOICE", listInvoice);
            }
            else if (dateValue != null) {
                String query = "select productName, quantity, price, dateOrder "
                        + "from tblInvoice a join tblInvoiceDetail b on a.InvoiceID = b.InvoiceID "
                        + "where dateOrder like '%" + dateValue + "%' and fullname like '%" + fullname + "%'";
                tblInvoiceDAO dao = new tblInvoiceDAO();
                ArrayList<tblInvoiceDTO> listInvoice = dao.getInvoice(query);
                session.setAttribute("LISTINVOICE", listInvoice);
                session.setAttribute("SEARCHDATEHISTORY", dateValue);
                session.setAttribute("SEARCHVALUEHISTORY", "");
            }
            else if(searchValue != null){
                String query = "select productName, quantity, price, dateOrder "
                        + "from tblInvoice a join tblInvoiceDetail b on a.InvoiceID = b.InvoiceID "
                        + "where productName like '%" + searchValue + "%' and fullname like '%" + fullname + "%'";
                tblInvoiceDAO dao = new tblInvoiceDAO();
                ArrayList<tblInvoiceDTO> listInvoice = dao.getInvoice(query);
                session.setAttribute("LISTINVOICE", listInvoice);
                session.setAttribute("SEARCHDATEHISTORY", "");
                session.setAttribute("SEARCHVALUEHISTORY", searchValue);
            }
            session.setAttribute("SELECT", select);
        } catch (SQLException e) {
            log("SQL_SearchHistoryServlet: " + e.getMessage());
        } catch (NamingException e) {
            log("Naming_SearchHistoryServlet: " + e.getMessage());
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
