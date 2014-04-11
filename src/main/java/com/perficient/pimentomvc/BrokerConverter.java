/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.perficient.pimentomvc;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;

/**
 *
 * @author phillip.goin
 */
public class BrokerConverter implements Converter {

    public Object getAsObject(FacesContext facesContext, UIComponent component, String string) {
        if (string == null || string.length() == 0) {
            return null;
        }
        Integer id = new Integer(string);
        BrokerController controller = (BrokerController) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "broker");
        return controller.getJpaController().find(id);
    }

    public String getAsString(FacesContext facesContext, UIComponent component, Object object) {
        if (object == null) {
            return null;
        }
        if (object instanceof Broker) {
            Broker o = (Broker) object;
            return o.getBrokerId() == null ? "" : o.getBrokerId().toString();
        } else {
            throw new IllegalArgumentException("object " + object + " is of type " + object.getClass().getName() + "; expected type: com.perficient.pimentomvc.Broker");
        }
    }
    
}
