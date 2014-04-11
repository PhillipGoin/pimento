/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.perficient.pimentomvc;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author phillip.goin
 */
@Stateless
public class GroupBenefitFacade extends AbstractFacade<GroupBenefit> {
    @PersistenceContext(unitName = "com.perficient_pimentoMVC_war_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public GroupBenefitFacade() {
        super(GroupBenefit.class);
    }
    
}
