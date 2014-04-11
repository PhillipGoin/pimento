package com.perficient.pimentomvc;
// Generated Apr 11, 2014 3:07:03 PM by Hibernate Tools 3.6.0


import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Broker generated by hbm2java
 */
@Entity
@Table(name="broker"
    ,catalog="perficient"
)
public class Broker  implements java.io.Serializable {


     private Integer brokerId;
     private String firstName;
     private String lastName;
     private Set<Groups> groupses = new HashSet<Groups>(0);

    public Broker() {
    }

	
    public Broker(String firstName, String lastName) {
        this.firstName = firstName;
        this.lastName = lastName;
    }
    public Broker(String firstName, String lastName, Set<Groups> groupses) {
       this.firstName = firstName;
       this.lastName = lastName;
       this.groupses = groupses;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="brokerId", unique=true, nullable=false)
    public Integer getBrokerId() {
        return this.brokerId;
    }
    
    public void setBrokerId(Integer brokerId) {
        this.brokerId = brokerId;
    }

    
    @Column(name="firstName", nullable=false)
    public String getFirstName() {
        return this.firstName;
    }
    
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    
    @Column(name="lastName", nullable=false)
    public String getLastName() {
        return this.lastName;
    }
    
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="broker")
    public Set<Groups> getGroupses() {
        return this.groupses;
    }
    
    public void setGroupses(Set<Groups> groupses) {
        this.groupses = groupses;
    }




}


