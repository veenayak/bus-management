/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hibernate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author winayak
 */
@Entity
@Table(name="Login")
public class Login_pojo {
    @Id
    @Column(name="email")
    private String email;
    
    @Column(name="password")
    private String password;
    
    @Column(name="type")
    private String type;
    
    @Column(name="name")
    private String name;
    
    public String getemail(){
        return email;
    }
    public String getpassword(){
        return password;
    }
    public String gettype(){
        return type;
    }
    public String getname(){
        return name;
    }
    
    public void setemail(String email){
        this.email = email;
    }
    public void setpassword(String password){
        this.password = password; 
    }
    public void settype(String type){
        this.type = type;
    }
    public void setname(String name){
        this.name = name;
    }
    
}
