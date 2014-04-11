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
public class GroupsController {

    public GroupsController() {
        pagingInfo = new PagingInfo();
        converter = new GroupsConverter();
    }
    private Groups groups = null;
    private List<Groups> groupsItems = null;
    private GroupsFacade jpaController = null;
    private GroupsConverter converter = null;
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

    public GroupsFacade getJpaController() {
        if (jpaController == null) {
            FacesContext facesContext = FacesContext.getCurrentInstance();
            jpaController = (GroupsFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "groupsJpa");
        }
        return jpaController;
    }

    public SelectItem[] getGroupsItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), false);
    }

    public SelectItem[] getGroupsItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), true);
    }

    public Groups getGroups() {
        if (groups == null) {
            groups = (Groups) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentGroups", converter, null);
        }
        if (groups == null) {
            groups = new Groups();
        }
        return groups;
    }

    public String listSetup() {
        reset(true);
        return "groups_list";
    }

    public String createSetup() {
        reset(false);
        groups = new Groups();
        return "groups_create";
    }

    public String create() {
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().create(groups);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Groups was successfully created.");
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
        return scalarSetup("groups_detail");
    }

    public String editSetup() {
        return scalarSetup("groups_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        groups = (Groups) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentGroups", converter, null);
        if (groups == null) {
            String requestGroupsString = JsfUtil.getRequestParameter("jsfcrud.currentGroups");
            JsfUtil.addErrorMessage("The groups with id " + requestGroupsString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String groupsString = converter.getAsString(FacesContext.getCurrentInstance(), null, groups);
        String currentGroupsString = JsfUtil.getRequestParameter("jsfcrud.currentGroups");
        if (groupsString == null || groupsString.length() == 0 || !groupsString.equals(currentGroupsString)) {
            String outcome = editSetup();
            if ("groups_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit groups. Try again.");
            }
            return outcome;
        }
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().edit(groups);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Groups was successfully updated.");
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
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentGroups");
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
                JsfUtil.addSuccessMessage("Groups was successfully deleted.");
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

    public List<Groups> getGroupsItems() {
        if (groupsItems == null) {
            getPagingInfo();
            groupsItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
        }
        return groupsItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "groups_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "groups_list";
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
        groups = null;
        groupsItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        Groups newGroups = new Groups();
        String newGroupsString = converter.getAsString(FacesContext.getCurrentInstance(), null, newGroups);
        String groupsString = converter.getAsString(FacesContext.getCurrentInstance(), null, groups);
        if (!newGroupsString.equals(groupsString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }
    
}
