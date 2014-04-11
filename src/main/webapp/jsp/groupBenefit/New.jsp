<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>New GroupBenefit</title>
            <link rel="stylesheet" type="text/css" href="/pimentoMVC/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>New GroupBenefit</h1>
            <h:form>
                <h:inputHidden id="validateCreateField" validator="#{groupBenefit.validateCreate}" value="value"/>
                <h:panelGrid columns="2">
                    <h:outputText value="Groups:"/>
                    <h:selectOneMenu id="groups" value="#{groupBenefit.groupBenefit.groups}" title="Groups" required="true" requiredMessage="The groups field is required." >
                        <f:selectItems value="#{groups.groupsItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>
                    <h:outputText value="Benefit:"/>
                    <h:selectOneMenu id="benefit" value="#{groupBenefit.groupBenefit.benefit}" title="Benefit" required="true" requiredMessage="The benefit field is required." >
                        <f:selectItems value="#{benefit.benefitItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{groupBenefit.create}" value="Create"/>
                <br />
                <br />
                <h:commandLink action="#{groupBenefit.listSetup}" value="Show All GroupBenefit Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
