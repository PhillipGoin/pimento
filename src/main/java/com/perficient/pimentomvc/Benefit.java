package com.perficient.pimentomvc;
// Generated Apr 11, 2014 3:07:03 PM by Hibernate Tools 3.6.0


import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Benefit generated by hbm2java
 */
@Entity
@Table(name="benefit"
    ,catalog="perficient"
)
public class Benefit  implements java.io.Serializable {


     private Integer benefitId;
     private String benefitName;
     private String benefitDescription;
     private Date startDate;
     private Date endDate;
     private Set<GroupBenefit> groupBenefits = new HashSet<GroupBenefit>(0);

    public Benefit() {
    }

	
    public Benefit(String benefitName, String benefitDescription, Date startDate) {
        this.benefitName = benefitName;
        this.benefitDescription = benefitDescription;
        this.startDate = startDate;
    }
    public Benefit(String benefitName, String benefitDescription, Date startDate, Date endDate, Set<GroupBenefit> groupBenefits) {
       this.benefitName = benefitName;
       this.benefitDescription = benefitDescription;
       this.startDate = startDate;
       this.endDate = endDate;
       this.groupBenefits = groupBenefits;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="benefitId", unique=true, nullable=false)
    public Integer getBenefitId() {
        return this.benefitId;
    }
    
    public void setBenefitId(Integer benefitId) {
        this.benefitId = benefitId;
    }

    
    @Column(name="benefitName", nullable=false)
    public String getBenefitName() {
        return this.benefitName;
    }
    
    public void setBenefitName(String benefitName) {
        this.benefitName = benefitName;
    }

    
    @Column(name="benefitDescription", nullable=false, length=45)
    public String getBenefitDescription() {
        return this.benefitDescription;
    }
    
    public void setBenefitDescription(String benefitDescription) {
        this.benefitDescription = benefitDescription;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="startDate", nullable=false, length=19)
    public Date getStartDate() {
        return this.startDate;
    }
    
    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="endDate", length=19)
    public Date getEndDate() {
        return this.endDate;
    }
    
    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="benefit")
    public Set<GroupBenefit> getGroupBenefits() {
        return this.groupBenefits;
    }
    
    public void setGroupBenefits(Set<GroupBenefit> groupBenefits) {
        this.groupBenefits = groupBenefits;
    }




}


