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
import dto.Item;
import java.util.List;
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
         try{    
                  s.save(sk);
                  tr.commit();
                  s.close();
                  sf.close();
                return true;
         }catch(Exception e){
         
             return false;
         
         }
          
         
          
     
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
        List<Shopkeeper> sklist = q.list();
        
        if(sklist.size() > 0)
        b = true;
        
        tr.commit();
        s.close();
        sf.close();
      
        
        return b;
    }
     public boolean addItem(Item ai){
    
        Configuration config =  new Configuration();
          config.configure();
          
          SessionFactory sf = config.buildSessionFactory();
          
          Session s = sf.openSession();
          
          Transaction tr = s.beginTransaction();
             
          s.save(ai);
          
          tr.commit();
          s.close();
          sf.close();
          
          return true;
    }
    public int deleteItem(Item ai1){
    
        Configuration config =  new Configuration();
          config.configure();
          
          SessionFactory sf = config.buildSessionFactory();
          
          Session s = sf.openSession();
          
          Transaction tr = s.beginTransaction();
          
          String hql = "DELETE FROM Additem WHERE itemname = :itemname";
            Query query = s.createQuery(hql);
            query.setParameter("itemname", ai1.getItemname());
            int result = query.executeUpdate();
          
          tr.commit();
          s.close();
          sf.close();
          
          return result;
    }

    
}
