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
public class GroupBenefitController {

    public GroupBenefitController() {
        pagingInfo = new PagingInfo();
        converter = new GroupBenefitConverter();
    }
    private GroupBenefit groupBenefit = null;
    private List<GroupBenefit> groupBenefitItems = null;
    private GroupBenefitFacade jpaController = null;
    private GroupBenefitConverter converter = null;
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

    public GroupBenefitFacade getJpaController() {
        if (jpaController == null) {
            FacesContext facesContext = FacesContext.getCurrentInstance();
            jpaController = (GroupBenefitFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "groupBenefitJpa");
        }
        return jpaController;
    }

    public SelectItem[] getGroupBenefitItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), false);
    }

    public SelectItem[] getGroupBenefitItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), true);
    }

    public GroupBenefit getGroupBenefit() {
        if (groupBenefit == null) {
            groupBenefit = (GroupBenefit) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentGroupBenefit", converter, null);
        }
        if (groupBenefit == null) {
            groupBenefit = new GroupBenefit();
        }
        return groupBenefit;
    }

    public String listSetup() {
        reset(true);
        return "groupBenefit_list";
    }

    public String createSetup() {
        reset(false);
        groupBenefit = new GroupBenefit();
        return "groupBenefit_create";
    }

    public String create() {
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().create(groupBenefit);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("GroupBenefit was successfully created.");
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
        return scalarSetup("groupBenefit_detail");
    }

    public String editSetup() {
        return scalarSetup("groupBenefit_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        groupBenefit = (GroupBenefit) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentGroupBenefit", converter, null);
        if (groupBenefit == null) {
            String requestGroupBenefitString = JsfUtil.getRequestParameter("jsfcrud.currentGroupBenefit");
            JsfUtil.addErrorMessage("The groupBenefit with id " + requestGroupBenefitString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String groupBenefitString = converter.getAsString(FacesContext.getCurrentInstance(), null, groupBenefit);
        String currentGroupBenefitString = JsfUtil.getRequestParameter("jsfcrud.currentGroupBenefit");
        if (groupBenefitString == null || groupBenefitString.length() == 0 || !groupBenefitString.equals(currentGroupBenefitString)) {
            String outcome = editSetup();
            if ("groupBenefit_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit groupBenefit. Try again.");
            }
            return outcome;
        }
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().edit(groupBenefit);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("GroupBenefit was successfully updated.");
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
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentGroupBenefit");
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
                JsfUtil.addSuccessMessage("GroupBenefit was successfully deleted.");
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

    public List<GroupBenefit> getGroupBenefitItems() {
        if (groupBenefitItems == null) {
            getPagingInfo();
            groupBenefitItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
        }
        return groupBenefitItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "groupBenefit_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "groupBenefit_list";
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
        groupBenefit = null;
        groupBenefitItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        GroupBenefit newGroupBenefit = new GroupBenefit();
        String newGroupBenefitString = converter.getAsString(FacesContext.getCurrentInstance(), null, newGroupBenefit);
        String groupBenefitString = converter.getAsString(FacesContext.getCurrentInstance(), null, groupBenefit);
        if (!newGroupBenefitString.equals(groupBenefitString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }
    
}
