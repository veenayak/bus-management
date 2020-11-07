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
@Table(name="Staff")
public class Staff_pojo {
    
    @Column(name="name")
    private String name;
    
    @Id
    @Column(name="email")
    private String email;
    
    @Column(name="contact")
    private String contact;
    
    @Column(name="job_desc")
    private String job_desc;
    
    public String getemail(){
        return email;
    }
    public String getname(){
        return name;
    }
    public String getcontact(){
        return contact;
    }
    public String getjob_desc(){
        return job_desc;
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
    public void setjob_desc(String job_desc){
        this.job_desc = job_desc;
    }
}
