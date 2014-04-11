/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.perficient.pimentomvc;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import javax.faces.FacesException;
import javax.annotation.Resource;
import javax.transaction.UserTransaction;
import com.perficient.pimentomvc.util.JsfUtil;
import com.perficient.pimentomvc.util.PagingInfo;
import java.util.List;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.model.SelectItem;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;

/**
 *
 * @author phillip.goin
 */
public class BenefitController {

    public BenefitController() {
        pagingInfo = new PagingInfo();
        converter = new BenefitConverter();
    }
    private Benefit benefit = null;
    private List<Benefit> benefitItems = null;
    private BenefitFacade jpaController = null;
    private BenefitConverter converter = null;
    private PagingInfo pagingInfo = null;
    @Resource
    private UserTransaction utx = null;
    @PersistenceUnit(unitName = "com.perficient_pimentoMVC_war_1.0-SNAPSHOTPU")
    private EntityManagerFactory emf = null;

    public PagingInfo getPagingInfo() {
        if (pagingInfo.getItemCount() == -1) {
            pagingInfo.setItemCount(getJpaController().count());
        }
        return pagingInfo;
    }

    public BenefitFacade getJpaController() {
        if (jpaController == null) {
            FacesContext facesContext = FacesContext.getCurrentInstance();
            jpaController = (BenefitFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "benefitJpa");
        }
        return jpaController;
    }

    public SelectItem[] getBenefitItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), false);
    }

    public SelectItem[] getBenefitItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), true);
    }

    public Benefit getBenefit() {
        if (benefit == null) {
            benefit = (Benefit) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentBenefit", converter, null);
        }
        if (benefit == null) {
            benefit = new Benefit();
        }
        return benefit;
    }

    public String listSetup() {
        reset(true);
        return "benefit_list";
    }

    public String createSetup() {
        reset(false);
        benefit = new Benefit();
        return "benefit_create";
    }

    public String create() {
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().create(benefit);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Benefit was successfully created.");
            } else {
                JsfUtil.ensureAddErrorMessage(transactionException, "A persistence error occurred.");
            }
        } catch (Exception e) {
            try {
                utx.rollback();
            } catch (Exception ex) {
            }
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
            return null;
        }
        return listSetup();
    }

    public String detailSetup() {
        return scalarSetup("benefit_detail");
    }

    public String editSetup() {
        return scalarSetup("benefit_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        benefit = (Benefit) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentBenefit", converter, null);
        if (benefit == null) {
            String requestBenefitString = JsfUtil.getRequestParameter("jsfcrud.currentBenefit");
            JsfUtil.addErrorMessage("The benefit with id " + requestBenefitString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String benefitString = converter.getAsString(FacesContext.getCurrentInstance(), null, benefit);
        String currentBenefitString = JsfUtil.getRequestParameter("jsfcrud.currentBenefit");
        if (benefitString == null || benefitString.length() == 0 || !benefitString.equals(currentBenefitString)) {
            String outcome = editSetup();
            if ("benefit_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit benefit. Try again.");
            }
            return outcome;
        }
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().edit(benefit);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Benefit was successfully updated.");
            } else {
                JsfUtil.ensureAddErrorMessage(transactionException, "A persistence error occurred.");
            }
        } catch (Exception e) {
            try {
                utx.rollback();
            } catch (Exception ex) {
            }
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
            return null;
        }
        return detailSetup();
    }

    public String remove() {
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentBenefit");
        Integer id = new Integer(idAsString);
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().remove(getJpaController().find(id));
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Benefit was successfully deleted.");
            } else {
                JsfUtil.ensureAddErrorMessage(transactionException, "A persistence error occurred.");
            }
        } catch (Exception e) {
            try {
                utx.rollback();
            } catch (Exception ex) {
            }
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
            return null;
        }
        return relatedOrListOutcome();
    }

    private String relatedOrListOutcome() {
        String relatedControllerOutcome = relatedControllerOutcome();
        if (relatedControllerOutcome != null) {
            return relatedControllerOutcome;
        }
        return listSetup();
    }

    public List<Benefit> getBenefitItems() {
        if (benefitItems == null) {
            getPagingInfo();
            benefitItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
        }
        return benefitItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "benefit_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "benefit_list";
    }

    private String relatedControllerOutcome() {
        String relatedControllerString = JsfUtil.getRequestParameter("jsfcrud.relatedController");
        String relatedControllerTypeString = JsfUtil.getRequestParameter("jsfcrud.relatedControllerType");
        if (relatedControllerString != null && relatedControllerTypeString != null) {
            FacesContext context = FacesContext.getCurrentInstance();
            Object relatedController = context.getApplication().getELResolver().getValue(context.getELContext(), null, relatedControllerString);
            try {
                Class<?> relatedControllerType = Class.forName(relatedControllerTypeString);
                Method detailSetupMethod = relatedControllerType.getMethod("detailSetup");
                return (String) detailSetupMethod.invoke(relatedController);
            } catch (ClassNotFoundException e) {
                throw new FacesException(e);
            } catch (NoSuchMethodException e) {
                throw new FacesException(e);
            } catch (IllegalAccessException e) {
                throw new FacesException(e);
            } catch (InvocationTargetException e) {
                throw new FacesException(e);
            }
        }
        return null;
    }

    private void reset(boolean resetFirstItem) {
        benefit = null;
        benefitItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        Benefit newBenefit = new Benefit();
        String newBenefitString = converter.getAsString(FacesContext.getCurrentInstance(), null, newBenefit);
        String benefitString = converter.getAsString(FacesContext.getCurrentInstance(), null, benefit);
        if (!newBenefitString.equals(benefitString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }
    
}
