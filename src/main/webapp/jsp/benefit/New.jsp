<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>New Benefit</title>
            <link rel="stylesheet" type="text/css" href="/pimentoMVC/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>New Benefit</h1>
            <h:form>
                <h:inputHidden id="validateCreateField" validator="#{benefit.validateCreate}" value="value"/>
                <h:panelGrid columns="2">
                    <h:outputText value="BenefitName:"/>
                    <h:inputText id="benefitName" value="#{benefit.benefit.benefitName}" title="BenefitName" required="true" requiredMessage="The benefitName field is required." />
                    <h:outputText value="BenefitDescription:"/>
                    <h:inputText id="benefitDescription" value="#{benefit.benefit.benefitDescription}" title="BenefitDescription" required="true" requiredMessage="The benefitDescription field is required." />
                    <h:outputText value="StartDate (MM/dd/yyyy HH:mm:ss):"/>
                    <h:inputText id="startDate" value="#{benefit.benefit.startDate}" title="StartDate" required="true" requiredMessage="The startDate field is required." >
                        <f:convertDateTime pattern="MM/dd/yyyy HH:mm:ss" />
                    </h:inputText>
                    <h:outputText value="EndDate (MM/dd/yyyy HH:mm:ss):"/>
                    <h:inputText id="endDate" value="#{benefit.benefit.endDate}" title="EndDate" >
                        <f:convertDateTime pattern="MM/dd/yyyy HH:mm:ss" />
                    </h:inputText>
                    <h:outputText value="GroupBenefits:"/>
                    <h:selectManyListbox id="groupBenefits" value="#{benefit.benefit.jsfcrud_transform[jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method.arrayToSet].groupBenefits}" title="GroupBenefits" size="6" converter="#{groupBenefit.converter}" >
                        <f:selectItems value="#{groupBenefit.groupBenefitItemsAvailableSelectMany}"/>
                    </h:selectManyListbox>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{benefit.create}" value="Create"/>
                <br />
                <br />
                <h:commandLink action="#{benefit.listSetup}" value="Show All Benefit Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
