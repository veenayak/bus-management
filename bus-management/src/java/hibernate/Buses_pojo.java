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
@Table(name="Buses")
public class Buses_pojo {
    @Column(name="routes")
    private String routes;
    
    @Column(name="time")
    private String time;
    
    @Column(name="status")
    private String status;
    
    @Id
    @Column(name="bus_no")
    private String bus_no;
    
    public String getroutes(){
        return routes;
    }
    public String gettime(){
        return time;
    }
    public String getbus_no(){
        return bus_no;
    }
    public String getstatus(){
        return status;
    }
    
    public void setroutes(String routes){
        this.routes = routes;
    }
    public void settime(String time){
        this.time =  time;
    }
    public void setbus_no(String bus_no){
        this.bus_no =  bus_no;
    }
    public void setstatus(String status){
        this.status =  status;
    }
}
