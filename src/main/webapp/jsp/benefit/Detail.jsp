<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Benefit Detail</title>
            <link rel="stylesheet" type="text/css" href="/pimentoMVC/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Benefit Detail</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="BenefitId:"/>
                    <h:outputText value="#{benefit.benefit.benefitId}" title="BenefitId" />
                    <h:outputText value="BenefitName:"/>
                    <h:outputText value="#{benefit.benefit.benefitName}" title="BenefitName" />
                    <h:outputText value="BenefitDescription:"/>
                    <h:outputText value="#{benefit.benefit.benefitDescription}" title="BenefitDescription" />
                    <h:outputText value="StartDate:"/>
                    <h:outputText value="#{benefit.benefit.startDate}" title="StartDate" >
                        <f:convertDateTime pattern="MM/dd/yyyy HH:mm:ss" />
                    </h:outputText>
                    <h:outputText value="EndDate:"/>
                    <h:outputText value="#{benefit.benefit.endDate}" title="EndDate" >
                        <f:convertDateTime pattern="MM/dd/yyyy HH:mm:ss" />
                    </h:outputText>

                    <h:outputText value="GroupBenefits:" />
                    <h:panelGroup>
                        <h:outputText rendered="#{empty benefit.benefit.groupBenefits}" value="(No Items)"/>
                        <h:dataTable value="#{benefit.benefit.jsfcrud_transform[jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method.setToList][jsfcrud_null].groupBenefits}" var="item" 
                                     border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                     rendered="#{not empty benefit.benefit.groupBenefits}">
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="GroupBenefitId"/>
                                </f:facet>
                                <h:outputText value="#{item.groupBenefitId}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Groups"/>
                                </f:facet>
                                <h:outputText value="#{item.groups}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Benefit"/>
                                </f:facet>
                                <h:outputText value="#{item.benefit}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText escape="false" value="&nbsp;"/>
                                </f:facet>
                                <h:commandLink value="Show" action="#{groupBenefit.detailSetup}">
                                    <f:param name="jsfcrud.currentBenefit" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][benefit.benefit][benefit.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentGroupBenefit" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][groupBenefit.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="benefit" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.perficient.pimentomvc.BenefitController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Edit" action="#{groupBenefit.editSetup}">
                                    <f:param name="jsfcrud.currentBenefit" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][benefit.benefit][benefit.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentGroupBenefit" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][groupBenefit.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="benefit" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.perficient.pimentomvc.BenefitController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Destroy" action="#{groupBenefit.destroy}">
                                    <f:param name="jsfcrud.currentBenefit" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][benefit.benefit][benefit.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentGroupBenefit" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][groupBenefit.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="benefit" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.perficient.pimentomvc.BenefitController" />
                                </h:commandLink>
                            </h:column>
                        </h:dataTable>
                    </h:panelGroup>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{benefit.remove}" value="Destroy">
                    <f:param name="jsfcrud.currentBenefit" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][benefit.benefit][benefit.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{benefit.editSetup}" value="Edit">
                    <f:param name="jsfcrud.currentBenefit" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][benefit.benefit][benefit.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <h:commandLink action="#{benefit.createSetup}" value="New Benefit" />
                <br />
                <h:commandLink action="#{benefit.listSetup}" value="Show All Benefit Items"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
