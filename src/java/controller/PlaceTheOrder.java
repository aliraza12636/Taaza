/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CustomerDAO;
import dao.ShopkeeperDAO;
import dto.Item;
import dto.NewOrders;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ali Raza
 */
public class PlaceTheOrder extends HttpServlet {

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
        try  {
                                            String i = null;
                                            for(int j = 0 ; j>=0 ; j++)
                                            {
                                                i = request.getParameter("hid"+j);
                                                if(i != null)
                                                    break;
                                            }
                                            int index = Integer.parseInt(i);
                                            String quantity = request.getParameter("quantity"+index);
                                            HttpSession session = request.getSession(false);
                                            if(quantity !=null)
                                            {
                                                ShopkeeperDAO sdao = new ShopkeeperDAO();
                                                CustomerDAO cdao = new CustomerDAO();
                                                List<Item> ilist = (List<Item>)session.getAttribute("mylist");
                                                Item it = ilist.get(index);
                                                
                                                NewOrders or = new NewOrders();
                                                
                                           
                                                or.setC_id((String)session.getAttribute("email"));
                                                or.setS_id(it.getShop_name());
                                                or.setItemname(it.getItemname());
                                                or.setPrice(it.getPrize());
                                                or.setQuantity(quantity);
                                                or.setStatus("Pending");
                                                or.setTotal(Integer.parseInt(it.getPrize()) * Integer.parseInt(quantity));
                                                
                                                boolean b = cdao.placeOrder(or);
                                                if(b)
                                                {
                                                    sdao.newOrders(it.getEmail(), 1);
                                                    session.setAttribute("mylist", null);
                                                session.setAttribute("orderstatus", "success");
                                                   response.sendRedirect("my_orders.jsp");
                                                    
                                                   
                                                }
                                                else
                                                    {
                                                 session.setAttribute("orderstatus", "success");
                                                  response.sendRedirect("near_by_shops.jsp");
                                                  
                                                }
                                               
                                                   
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
       // processRequest(request, response);
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
