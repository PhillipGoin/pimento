<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Editing GroupBenefit</title>
            <link rel="stylesheet" type="text/css" href="/pimentoMVC/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Editing GroupBenefit</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="GroupBenefitId:"/>
                    <h:outputText value="#{groupBenefit.groupBenefit.groupBenefitId}" title="GroupBenefitId" />
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
                <h:commandLink action="#{groupBenefit.edit}" value="Save">
                    <f:param name="jsfcrud.currentGroupBenefit" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][groupBenefit.groupBenefit][groupBenefit.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{groupBenefit.detailSetup}" value="Show" immediate="true">
                    <f:param name="jsfcrud.currentGroupBenefit" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][groupBenefit.groupBenefit][groupBenefit.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <h:commandLink action="#{groupBenefit.listSetup}" value="Show All GroupBenefit Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
