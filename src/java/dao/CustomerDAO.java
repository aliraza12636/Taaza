/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package dao;

import dto.Customer;
import dto.Shopkeeper;
import dto.Item;
import dto.NewOrders;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;


/**
 *
 * @author Amit
 */
public class CustomerDAO {
     public boolean signUpCustomer(Customer cm){
    
        Configuration config =  new Configuration();
          config.configure();
          
          SessionFactory sf = config.buildSessionFactory();
          
          Session s = sf.openSession();
          
          Transaction tr = s.beginTransaction();
          try{
          s.save(cm);
          
          tr.commit();
          s.close();
          sf.close();
          
          return true;}
          
          catch(Exception e){
                return false;
          }
    }
     public boolean Login(Customer cm)
    {
        boolean b = false;
        Configuration cf = new Configuration();
        cf.configure();
        
        SessionFactory sf = cf.buildSessionFactory();
        Session s = sf.openSession();
        
        Transaction tr = s.beginTransaction();
        
        Query q = s.createQuery("FROM Customer C WHERE C.email = :email AND C.password = :password");
        
        q.setParameter("email", cm.getEmail());
        q.setParameter("password", cm.getPassword());
        List<Customer> cmlist = q.list();
        
        if(cmlist.size() > 0)
        b = true;
        
        tr.commit();
        s.close();
        sf.close();
      
        
        return b;
    }
     public Customer getCustomerData(String email)
    {
         Configuration config =  new Configuration();
          config.configure();
          
          SessionFactory sf = config.buildSessionFactory();
          
          Session s = sf.openSession();
          
          Transaction tr = s.beginTransaction();
          
          String hql = "FROM Customer WHERE email = :email";
            Query query = s.createQuery(hql);
            query.setParameter("email", email);
           List<Customer> cmlist = query.list();
        
        Customer cm1 = new Customer();
         if(cmlist.size() > 0) 
        for(Customer cm :cmlist)
        {
           cm1 = cm;
        }
         tr.commit();
        s.close();
        sf.close();
        
         if(cm1 != null)
         return cm1;
         
         else return null;
        
        
    }
     public List<Item> searchItem(String item)
     {
         Configuration config =  new Configuration();
          config.configure();
          
          SessionFactory sf = config.buildSessionFactory();
          
          Session s = sf.openSession();
          
          Transaction tr = s.beginTransaction();
          
          String hql = "FROM Item WHERE itemname = :item";
            Query query = s.createQuery(hql);
            query.setParameter("item", item);
           List<Item> ilist = query.list();
           
    //        tr.commit();
    //    s.close();
 //       sf.close();
        
        
       
         if(ilist.size() > 0) 
             return ilist;
          else return null;
        
        
        
     }
     
     public boolean placeOrder(NewOrders o){
    
        Configuration config =  new Configuration();
          config.configure();
          
          SessionFactory sf = config.buildSessionFactory();
          
          Session s = sf.openSession();
          
          Transaction tr = s.beginTransaction();
          try{
          s.save(o);
          
          tr.commit();
          s.close();
          sf.close();
          
          return true;}
          
          catch(Exception e){
                return false;
          }
    }
     
      public List<NewOrders> getOrderList(String email)
     {
         Configuration config =  new Configuration();
          config.configure();
          
          SessionFactory sf = config.buildSessionFactory();
          
          Session s = sf.openSession();
          
          Transaction tr = s.beginTransaction();
          
          String hql = "FROM NewOrders WHERE c_id = :email";
            Query query = s.createQuery(hql);
            query.setParameter("email", email);
           List<NewOrders> olist = query.list();
           
    //        tr.commit();
    //    s.close();
 //       sf.close();
        
        
        
         if(olist.size() > 0) 
             return olist;
          else return null;
        
        
        
     }
    
       public List<Shopkeeper> getLandMarkList()
     {
         Configuration config =  new Configuration();
          config.configure();
          
          SessionFactory sf = config.buildSessionFactory();
          
          Session s = sf.openSession();
          
          Transaction tr = s.beginTransaction();
          
          String hql = "FROM Shopkeeper";
            Query query = s.createQuery(hql);
           
           List<Shopkeeper> llist = query.list();
           
    //        tr.commit();
    //    s.close();
 //       sf.close();
        
        
        
         if(llist.size() > 0) 
             return llist;
          else return null;
        
        
        
     }
}

    
   
    
