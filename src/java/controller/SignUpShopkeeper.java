/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import dao.ShopkeeperDAO;
import dto.Shopkeeper;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Amit
 */
public class SignUpShopkeeper extends HttpServlet {

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
        PrintWriter out = response.getWriter();
         
        try
        {
           String name,mobile,landmark,pass,shopname,email,city;
           
            Shopkeeper sk = new Shopkeeper();
             name = request.getParameter("name");
             sk.setName(name);
             
             email =request.getParameter("email");
              sk.setEmail(email);
              
              mobile = request.getParameter("mob");
               sk.setMobile(mobile);
               
               shopname= request.getParameter("shop_name");
                sk.setShop_name(shopname);
                
                landmark = request.getParameter("landmark");
                 sk.setLandmark(landmark);
                 
                 city = request.getParameter("city");
                  sk.setCity("city");
                  
                  pass = request.getParameter("password");
                   sk.setPassword(pass);
                   
                   ShopkeeperDAO sd = new ShopkeeperDAO();
                   boolean b = sd.signUpShopkeeper(sk);
                   if(b){
                        response.sendRedirect("regsuccess.jsp");
                   }else{
                        response.sendRedirect("Alreadysingup.jsp");
                   }
                 
        } 
        catch(Exception e)
        {
             out.println(e);
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
      //  processRequest(request, response);
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
