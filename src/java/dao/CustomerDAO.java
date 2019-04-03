/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package dao;

import dto.Customer;
import dto.Shopkeeper;
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
             
          s.save(cm);
          
          tr.commit();
          s.close();
          sf.close();
          
          return true;
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

    
}

    
   
    
