/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package dao;

/**
 *
 * @author Amit
 */
import dto.Shopkeeper;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
public class ShopkeeperDAO {
    
    public boolean signUpShopkeeper(Shopkeeper sk){
    
        Configuration config =  new Configuration();
          config.configure();
          
          SessionFactory sf = config.buildSessionFactory();
          
          Session s = sf.openSession();
          
          Transaction tr = s.beginTransaction();
             
          s.save(sk);
          
          tr.commit();
          s.close();
          sf.close();
          
          return true;
    }
    
    public boolean Login(Shopkeeper sk)
    {
        boolean b = false;
        Configuration cf = new Configuration();
        cf.configure();
        
        SessionFactory sf = cf.buildSessionFactory();
        Session s = sf.openSession();
        
        Transaction tr = s.beginTransaction();
        
        Query q = s.createQuery("FROM Shopkeeper S WHERE S.email = :email AND S.password = :password");
        
        q.setParameter("email", sk.getEmail());
        q.setParameter("password", sk.getPassword());
        
        if(q.executeUpdate() > 0)
            b = true;
        
        return b;
    }
    
}
