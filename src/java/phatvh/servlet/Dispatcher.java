/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phatvh.servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS
 */
@MultipartConfig
public class Dispatcher extends HttpServlet {

    private final String LOGIN_PAGE = "login.jsp";
    private final String LOGIN_CONTROLLER = "LoginServlet";
    private final String MAIN_PAGE = "main.jsp";
    private final String LOGOUT_CONTROLLER = "LogoutServlet";
    private final String SEARCH_CONTROLLER = "SearchServlet";
    private final String INFO_CONTROLLER = "InfoServlet";
    private final String ADD_TO_CART = "AddItemServlet";
    private final String VIEW_CART = "viewcart.jsp";
    private final String UPDATE_ITEM = "UpdateItemServlet";
    private final String DELETE_ITEM = "DeleteItemServlet";
    private final String CHECK_OUT  = "CheckOutServlet";
    private final String HISTORY = "SearchHistoryServlet";
    private final String MANAGE = "SearchManageServlet";
    private final String UPDATE = "UpdateServlet";
    private final String ADD_ITEM = "additem.jsp";
    private final String CONFIRM_ADD_ITEM = "AddItemManageServlet";
    private final String DELETE_ITEM_MANAGE = "DeleteServlet";
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
        String button = request.getParameter("btAction");
        String url = MAIN_PAGE;
        try {

            if (button == null) {

            } else if (button.equals("Login")) {
                url = LOGIN_CONTROLLER;
            } else if (button.equals("Logout")) {
                url = LOGOUT_CONTROLLER;
            } else if (button.equals("Home")) {
                url = MAIN_PAGE;
            } else if (button.equals("login")) {
                url = LOGIN_PAGE;
            } else if (button.equals("search")) {
                url = SEARCH_CONTROLLER;
            } else if (button.equals("info")){
                url = INFO_CONTROLLER;
            } else if (button.equals("addToCart")){
                url = ADD_TO_CART;
            } else if (button.equals("ViewCart")){
                url = VIEW_CART;
            } else if (button.equals("Update quantity")){
                url = UPDATE_ITEM;
            } else if (button.equals("Delete Item")){
                url = DELETE_ITEM;
            } else if (button.equals("Check out")){
                url = CHECK_OUT;
            } else if (button.equals("searchHistory")){
                url = HISTORY;
            } else if (button.equals("SearchManage")){
                url = MANAGE;
            } else if (button.equals("Update Item")) {
                url = UPDATE;
            } else if (button.equals("Add Item")){
                url = ADD_ITEM;
            } else if (button.equals("Confirm")){
                url = CONFIRM_ADD_ITEM;
            } else if (button.equals("Delete")){
                url = DELETE_ITEM_MANAGE;
            }
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
