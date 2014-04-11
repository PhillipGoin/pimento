<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Broker Detail</title>
            <link rel="stylesheet" type="text/css" href="/pimentoMVC/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Broker Detail</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="BrokerId:"/>
                    <h:outputText value="#{broker.broker.brokerId}" title="BrokerId" />
                    <h:outputText value="FirstName:"/>
                    <h:outputText value="#{broker.broker.firstName}" title="FirstName" />
                    <h:outputText value="LastName:"/>
                    <h:outputText value="#{broker.broker.lastName}" title="LastName" />

                    <h:outputText value="Groupses:" />
                    <h:panelGroup>
                        <h:outputText rendered="#{empty broker.broker.groupses}" value="(No Items)"/>
                        <h:dataTable value="#{broker.broker.jsfcrud_transform[jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method.setToList][jsfcrud_null].groupses}" var="item" 
                                     border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                     rendered="#{not empty broker.broker.groupses}">
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="GroupId"/>
                                </f:facet>
                                <h:outputText value="#{item.groupId}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Broker"/>
                                </f:facet>
                                <h:outputText value="#{item.broker}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="GroupName"/>
                                </f:facet>
                                <h:outputText value="#{item.groupName}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText escape="false" value="&nbsp;"/>
                                </f:facet>
                                <h:commandLink value="Show" action="#{groups.detailSetup}">
                                    <f:param name="jsfcrud.currentBroker" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][broker.broker][broker.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentGroups" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][groups.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="broker" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.perficient.pimentomvc.BrokerController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Edit" action="#{groups.editSetup}">
                                    <f:param name="jsfcrud.currentBroker" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][broker.broker][broker.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentGroups" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][groups.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="broker" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.perficient.pimentomvc.BrokerController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Destroy" action="#{groups.destroy}">
                                    <f:param name="jsfcrud.currentBroker" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][broker.broker][broker.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentGroups" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][groups.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="broker" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.perficient.pimentomvc.BrokerController" />
                                </h:commandLink>
                            </h:column>
                        </h:dataTable>
                    </h:panelGroup>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{broker.remove}" value="Destroy">
                    <f:param name="jsfcrud.currentBroker" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][broker.broker][broker.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{broker.editSetup}" value="Edit">
                    <f:param name="jsfcrud.currentBroker" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][broker.broker][broker.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <h:commandLink action="#{broker.createSetup}" value="New Broker" />
                <br />
                <h:commandLink action="#{broker.listSetup}" value="Show All Broker Items"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
