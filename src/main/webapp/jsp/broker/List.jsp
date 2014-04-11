<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing Broker Items</title>
            <link rel="stylesheet" type="text/css" href="/pimentoMVC/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Listing Broker Items</h1>
            <h:form styleClass="jsfcrud_list_form">
                <h:outputText escape="false" value="(No Broker Items Found)<br />" rendered="#{broker.pagingInfo.itemCount == 0}" />
                <h:panelGroup rendered="#{broker.pagingInfo.itemCount > 0}">
                    <h:outputText value="Item #{broker.pagingInfo.firstItem + 1}..#{broker.pagingInfo.lastItem} of #{broker.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{broker.prev}" value="Previous #{broker.pagingInfo.batchSize}" rendered="#{broker.pagingInfo.firstItem >= broker.pagingInfo.batchSize}"/>&nbsp;
                    <h:commandLink action="#{broker.next}" value="Next #{broker.pagingInfo.batchSize}" rendered="#{broker.pagingInfo.lastItem + broker.pagingInfo.batchSize <= broker.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{broker.next}" value="Remaining #{broker.pagingInfo.itemCount - broker.pagingInfo.lastItem}"
                                   rendered="#{broker.pagingInfo.lastItem < broker.pagingInfo.itemCount && broker.pagingInfo.lastItem + broker.pagingInfo.batchSize > broker.pagingInfo.itemCount}"/>
                    <h:dataTable value="#{broker.brokerItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="BrokerId"/>
                            </f:facet>
                            <h:outputText value="#{item.brokerId}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="FirstName"/>
                            </f:facet>
                            <h:outputText value="#{item.firstName}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="LastName"/>
                            </f:facet>
                            <h:outputText value="#{item.lastName}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText escape="false" value="&nbsp;"/>
                            </f:facet>
                            <h:commandLink value="Show" action="#{broker.detailSetup}">
                                <f:param name="jsfcrud.currentBroker" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][broker.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{broker.editSetup}">
                                <f:param name="jsfcrud.currentBroker" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][broker.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{broker.remove}">
                                <f:param name="jsfcrud.currentBroker" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][broker.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                        </h:column>

                    </h:dataTable>
                </h:panelGroup>
                <br />
                <h:commandLink action="#{broker.createSetup}" value="New Broker"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />


            </h:form>
        </body>
    </html>
</f:view>
