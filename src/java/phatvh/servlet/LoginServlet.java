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
import phatvh.tblProduct.tblProductDAO;
import phatvh.tblProduct.tblProductDTO;
import phatvh.tblUser.tblUserDAO;
import phatvh.tblUser.tblUserDTO;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {
    private final String LOGIN_PAGE = "login.jsp";
    private final String MAIN_PAGE = "main.jsp";
    private final String MANAGE_PAGE = "SearchManageServlet";

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
        String username = request.getParameter("txtUsername");
        String password = request.getParameter("txtPassword");
        String url = MAIN_PAGE;
        try {
            tblUserDAO dao = new tblUserDAO();
            boolean result = dao.checkLogin(username, password);
            HttpSession session = request.getSession();
            if (result) {
                String fullname = dao.getLastName(username);
                session.setAttribute("FULLNAME", fullname);
                boolean role = dao.getRole(username);
                session.setAttribute("ROLE", role);
                if(role == true){
                    session.setAttribute("ADMIN", "admin");
                    url = MANAGE_PAGE;
                }
                tblUserDTO dto = dao.getInfo(username);
                String phone = dto.getPhone();
                String email = dto.getEmail();
                session.setAttribute("PHONE", phone);
                session.setAttribute("EMAIL", email);
            } else {
                String errors = "userID or password is invalid!";
                request.setAttribute("ERROR", errors);
                url = LOGIN_PAGE;
            }
            
            tblProductDAO productDAO = new tblProductDAO();
            ArrayList<tblProductDTO> list = productDAO.getAllProduct();
            ArrayList<String> listCate = productDAO.loadProductCate();
            session.setAttribute("ALLPRODUCT", list);
            session.setAttribute("LISTCATE", listCate);
            session.setAttribute("SELECT", "1");
        } catch (SQLException e) {
            log("SQL_LoginServlet: " + e.getMessage());
        } catch (NamingException e) {
            log("Naming_Servlet: " + e.getMessage());
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
