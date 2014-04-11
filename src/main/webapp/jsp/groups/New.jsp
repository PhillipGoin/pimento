<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>New Groups</title>
            <link rel="stylesheet" type="text/css" href="/pimentoMVC/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>New Groups</h1>
            <h:form>
                <h:inputHidden id="validateCreateField" validator="#{groups.validateCreate}" value="value"/>
                <h:panelGrid columns="2">
                    <h:outputText value="Broker:"/>
                    <h:selectOneMenu id="broker" value="#{groups.groups.broker}" title="Broker" required="true" requiredMessage="The broker field is required." >
                        <f:selectItems value="#{broker.brokerItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>
                    <h:outputText value="GroupName:"/>
                    <h:inputText id="groupName" value="#{groups.groups.groupName}" title="GroupName" required="true" requiredMessage="The groupName field is required." />
                    <h:outputText value="GroupBenefits:"/>
                    <h:selectManyListbox id="groupBenefits" value="#{groups.groups.jsfcrud_transform[jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method.arrayToSet].groupBenefits}" title="GroupBenefits" size="6" converter="#{groupBenefit.converter}" >
                        <f:selectItems value="#{groupBenefit.groupBenefitItemsAvailableSelectMany}"/>
                    </h:selectManyListbox>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{groups.create}" value="Create"/>
                <br />
                <br />
                <h:commandLink action="#{groups.listSetup}" value="Show All Groups Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
