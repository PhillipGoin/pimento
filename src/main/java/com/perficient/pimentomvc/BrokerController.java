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
public class BrokerController {

    public BrokerController() {
        pagingInfo = new PagingInfo();
        converter = new BrokerConverter();
    }
    private Broker broker = null;
    private List<Broker> brokerItems = null;
    private BrokerFacade jpaController = null;
    private BrokerConverter converter = null;
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

    public BrokerFacade getJpaController() {
        if (jpaController == null) {
            FacesContext facesContext = FacesContext.getCurrentInstance();
            jpaController = (BrokerFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "brokerJpa");
        }
        return jpaController;
    }

    public SelectItem[] getBrokerItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), false);
    }

    public SelectItem[] getBrokerItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), true);
    }

    public Broker getBroker() {
        if (broker == null) {
            broker = (Broker) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentBroker", converter, null);
        }
        if (broker == null) {
            broker = new Broker();
        }
        return broker;
    }

    public String listSetup() {
        reset(true);
        return "broker_list";
    }

    public String createSetup() {
        reset(false);
        broker = new Broker();
        return "broker_create";
    }

    public String create() {
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().create(broker);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Broker was successfully created.");
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
        return scalarSetup("broker_detail");
    }

    public String editSetup() {
        return scalarSetup("broker_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        broker = (Broker) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentBroker", converter, null);
        if (broker == null) {
            String requestBrokerString = JsfUtil.getRequestParameter("jsfcrud.currentBroker");
            JsfUtil.addErrorMessage("The broker with id " + requestBrokerString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String brokerString = converter.getAsString(FacesContext.getCurrentInstance(), null, broker);
        String currentBrokerString = JsfUtil.getRequestParameter("jsfcrud.currentBroker");
        if (brokerString == null || brokerString.length() == 0 || !brokerString.equals(currentBrokerString)) {
            String outcome = editSetup();
            if ("broker_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit broker. Try again.");
            }
            return outcome;
        }
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().edit(broker);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Broker was successfully updated.");
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
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentBroker");
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
                JsfUtil.addSuccessMessage("Broker was successfully deleted.");
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

    public List<Broker> getBrokerItems() {
        if (brokerItems == null) {
            getPagingInfo();
            brokerItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
        }
        return brokerItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "broker_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "broker_list";
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
        broker = null;
        brokerItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        Broker newBroker = new Broker();
        String newBrokerString = converter.getAsString(FacesContext.getCurrentInstance(), null, newBroker);
        String brokerString = converter.getAsString(FacesContext.getCurrentInstance(), null, broker);
        if (!newBrokerString.equals(brokerString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }
    
}
