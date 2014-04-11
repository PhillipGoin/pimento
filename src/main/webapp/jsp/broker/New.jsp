<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>New Broker</title>
            <link rel="stylesheet" type="text/css" href="/pimentoMVC/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>New Broker</h1>
            <h:form>
                <h:inputHidden id="validateCreateField" validator="#{broker.validateCreate}" value="value"/>
                <h:panelGrid columns="2">
                    <h:outputText value="FirstName:"/>
                    <h:inputText id="firstName" value="#{broker.broker.firstName}" title="FirstName" required="true" requiredMessage="The firstName field is required." />
                    <h:outputText value="LastName:"/>
                    <h:inputText id="lastName" value="#{broker.broker.lastName}" title="LastName" required="true" requiredMessage="The lastName field is required." />
                    <h:outputText value="Groupses:"/>
                    <h:selectManyListbox id="groupses" value="#{broker.broker.jsfcrud_transform[jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method.arrayToSet].groupses}" title="Groupses" size="6" converter="#{groups.converter}" >
                        <f:selectItems value="#{groups.groupsItemsAvailableSelectMany}"/>
                    </h:selectManyListbox>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{broker.create}" value="Create"/>
                <br />
                <br />
                <h:commandLink action="#{broker.listSetup}" value="Show All Broker Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
