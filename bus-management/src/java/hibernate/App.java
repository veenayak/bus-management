/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hibernate;

import hibernate.Buses_pojo;
import hibernate.Login_pojo;
import hibernate.Staff_pojo;
import hibernate.Students_pojo;
import java.util.Iterator;
import java.util.List;
import javax.servlet.DispatcherType;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

/**
 *
 * @author winayak
 */
public class App {
    
    public boolean login_validate(String email, String password,String type){
     
        Login_pojo obj = new Login_pojo();
        
        Configuration con = new Configuration().configure().addAnnotatedClass(Login_pojo.class);

        ServiceRegistry sr = new StandardServiceRegistryBuilder().applySettings(con.getProperties()).build();
        
        SessionFactory sf = con.buildSessionFactory(sr);
        
        Session session = sf.openSession();
        
        Transaction tx = session.beginTransaction();
        
        Query qry = session.createQuery("from Login_pojo e where e.email='"+email+"' and e.password='"+password+"' and e.type='"+type+"'");

        List l =qry.list();
        
        if(l.size() == 1){
            tx.commit();
            session.close();
            return true;
        }
        else{
            return false;
        }
    }
    
    public void insert_login(String email, String password,String name,String type){
     
        Login_pojo obj = new Login_pojo();
        
        Configuration con = new Configuration().configure().addAnnotatedClass(Login_pojo.class);

        ServiceRegistry sr = new StandardServiceRegistryBuilder().applySettings(con.getProperties()).build();
        
        SessionFactory sf = con.buildSessionFactory(sr);
        
        Session session = sf.openSession();
        
        Transaction tx = session.beginTransaction();
        
        obj.setemail(email);
        obj.setpassword(password);
        obj.setname(name);
        obj.settype(type);
        
        session.save(obj);
        
        tx.commit();
        session.close();
    }
    
    public void insert_student(String email, String name,String contact,String bus_stop,String bus_no,String arr_time,String id){
     
        Students_pojo obj = new Students_pojo();
        
        Configuration con = new Configuration().configure().addAnnotatedClass(Students_pojo.class);

        ServiceRegistry sr = new StandardServiceRegistryBuilder().applySettings(con.getProperties()).build();
        
        SessionFactory sf = con.buildSessionFactory(sr);
        
        Session session = sf.openSession();
        
        Transaction tx = session.beginTransaction();
        
        obj.setname(name);
        obj.setcontact(contact);
        obj.settime(arr_time);
        obj.setemail(email);
        obj.setbus_stop(bus_stop);
        obj.setbus_no(bus_no);
        obj.setid(id);
        
        session.save(obj);

        tx.commit();
        session.close();    
    }
    
     public void insert_staff(String name,String email,String contact,String job_desc){
     
        Staff_pojo obj = new Staff_pojo();
        
        Configuration con = new Configuration().configure().addAnnotatedClass(Staff_pojo.class);

        ServiceRegistry sr = new StandardServiceRegistryBuilder().applySettings(con.getProperties()).build();
        
        SessionFactory sf = con.buildSessionFactory(sr);
        
        Session session = sf.openSession();
        
        Transaction tx = session.beginTransaction();
        
        obj.setname(name);
        obj.setcontact(contact);
        obj.setemail(email);
        obj.setjob_desc(job_desc);
        
        session.save(obj);

        tx.commit();
        session.close();    
    }
     
    public void insert_buses(String routes,String bus_no,String time,String status){
     
        Buses_pojo obj = new Buses_pojo();
        
        Configuration con = new Configuration().configure().addAnnotatedClass(Buses_pojo.class);

        ServiceRegistry sr = new StandardServiceRegistryBuilder().applySettings(con.getProperties()).build();
        
        SessionFactory sf = con.buildSessionFactory(sr);
        
        Session session = sf.openSession();
        
        Transaction tx = session.beginTransaction();
        obj.setroutes(routes);
        obj.settime(time);
        obj.setstatus(status);
        obj.setbus_no(bus_no);
        
        session.save(obj);

        tx.commit();
        session.close();    
    }
     
//     public void insert_routes(){
//     
//        Students_pojo obj = new Students_pojo();
//        
//        Configuration con = new Configuration().configure().addAnnotatedClass(Routes_pojo.class);
//
//        ServiceRegistry sr = new StandardServiceRegistryBuilder().applySettings(con.getProperties()).build();
//        
//        SessionFactory sf = con.buildSessionFactory(sr);
//        
//        Session session = sf.openSession();
//        
//        Transaction tx = session.beginTransaction();
//        
//        obj.setname("suraj");
//        obj.setcontact(1234567890);
//        obj.setemail("suraj@gmail.com");
//        obj.setbus_stop("qwerty");
//        obj.setbus_no(1);
//        
//        session.save(obj);
//
//        tx.commit();
//        session.close();    
//    }
     public List fetch_student(){
     
        Students_pojo obj = new Students_pojo();
        
        Configuration con = new Configuration().configure().addAnnotatedClass(Students_pojo.class);

        ServiceRegistry sr = new StandardServiceRegistryBuilder().applySettings(con.getProperties()).build();
        
        SessionFactory sf = con.buildSessionFactory(sr);
        
        Session session = sf.openSession();
        
        Transaction tx = session.beginTransaction();
        
        Query qry = session.createQuery("from Students_pojo");

        List l =qry.list();       

        tx.commit();
        session.close();    
        
        return l;
    }
    
     public List fetch_staff(){
     
        Staff_pojo obj = new Staff_pojo();
        
        Configuration con = new Configuration().configure().addAnnotatedClass(Staff_pojo.class);

        ServiceRegistry sr = new StandardServiceRegistryBuilder().applySettings(con.getProperties()).build();
        
        SessionFactory sf = con.buildSessionFactory(sr);
        
        Session session = sf.openSession();
        
        Transaction tx = session.beginTransaction();
        
        Query qry = session.createQuery("from Staff_pojo");

        List l =qry.list();       

        tx.commit();
        session.close();    
        
        return l;
    }
     
     public List fetch_buses(){
     
        Buses_pojo obj = new Buses_pojo();
        
        Configuration con = new Configuration().configure().addAnnotatedClass(Buses_pojo.class);

        ServiceRegistry sr = new StandardServiceRegistryBuilder().applySettings(con.getProperties()).build();
        
        SessionFactory sf = con.buildSessionFactory(sr);
        
        Session session = sf.openSession();
        
        Transaction tx = session.beginTransaction();
        Query qry = session.createQuery("from Buses_pojo");

        List l =qry.list();       

        tx.commit();
        session.close();    
        
        return l;   
    }
}
