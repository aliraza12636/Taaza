/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package dao;

import dto.Customer;
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
    
}

    
   
    
