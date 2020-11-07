/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hibernate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author winayak
 */
@Entity
@Table(name="Student")
public class Students_pojo {
    @Column(name="id")
    private String id;
    
    @Column(name="name")
    private String name;
    @Id
    @Column(name="email")
    private String email;
    
    @Column(name="contact")
    private String contact;
    
    @Column(name="bus_stop")
    private String bus_stop;
    
    @Column(name="bus_no")
    private String bus_no;
    
    
    @Column(name="arr_time")
    private String time;
    
    public String getid(){
        return id;
    }
    public String getemail(){
        return email;
    }
    public String getname(){
        return name;
    }
    public String getcontact(){
        return contact;
    }
    public String getbus_stop(){
        return bus_stop;
    }
    public String getbus_no(){
        return bus_no;
    }
    public String time(){
        return time;
    }
    
    public void setid(String id){
         this.id = id;
    }
    public void setemail(String email){
        this.email = email;
    }
    public void setname(String name){
        this.name = name;
    }
    public void setcontact(String contact){
        this.contact = contact;
    }
    public void setbus_stop(String bus_stop){
        this.bus_stop = bus_stop;
    }
    public void setbus_no(String bus_no){
        this.bus_no = bus_no;
    }
    public void settime(String time){
        this.time = time;
    }
}
