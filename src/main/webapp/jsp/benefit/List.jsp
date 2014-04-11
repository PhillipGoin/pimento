<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing Benefit Items</title>
            <link rel="stylesheet" type="text/css" href="/pimentoMVC/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Listing Benefit Items</h1>
            <h:form styleClass="jsfcrud_list_form">
                <h:outputText escape="false" value="(No Benefit Items Found)<br />" rendered="#{benefit.pagingInfo.itemCount == 0}" />
                <h:panelGroup rendered="#{benefit.pagingInfo.itemCount > 0}">
                    <h:outputText value="Item #{benefit.pagingInfo.firstItem + 1}..#{benefit.pagingInfo.lastItem} of #{benefit.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{benefit.prev}" value="Previous #{benefit.pagingInfo.batchSize}" rendered="#{benefit.pagingInfo.firstItem >= benefit.pagingInfo.batchSize}"/>&nbsp;
                    <h:commandLink action="#{benefit.next}" value="Next #{benefit.pagingInfo.batchSize}" rendered="#{benefit.pagingInfo.lastItem + benefit.pagingInfo.batchSize <= benefit.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{benefit.next}" value="Remaining #{benefit.pagingInfo.itemCount - benefit.pagingInfo.lastItem}"
                                   rendered="#{benefit.pagingInfo.lastItem < benefit.pagingInfo.itemCount && benefit.pagingInfo.lastItem + benefit.pagingInfo.batchSize > benefit.pagingInfo.itemCount}"/>
                    <h:dataTable value="#{benefit.benefitItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="BenefitId"/>
                            </f:facet>
                            <h:outputText value="#{item.benefitId}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="BenefitName"/>
                            </f:facet>
                            <h:outputText value="#{item.benefitName}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="BenefitDescription"/>
                            </f:facet>
                            <h:outputText value="#{item.benefitDescription}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="StartDate"/>
                            </f:facet>
                            <h:outputText value="#{item.startDate}">
                                <f:convertDateTime pattern="MM/dd/yyyy HH:mm:ss" />
                            </h:outputText>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="EndDate"/>
                            </f:facet>
                            <h:outputText value="#{item.endDate}">
                                <f:convertDateTime pattern="MM/dd/yyyy HH:mm:ss" />
                            </h:outputText>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText escape="false" value="&nbsp;"/>
                            </f:facet>
                            <h:commandLink value="Show" action="#{benefit.detailSetup}">
                                <f:param name="jsfcrud.currentBenefit" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][benefit.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{benefit.editSetup}">
                                <f:param name="jsfcrud.currentBenefit" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][benefit.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{benefit.remove}">
                                <f:param name="jsfcrud.currentBenefit" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][benefit.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                        </h:column>

                    </h:dataTable>
                </h:panelGroup>
                <br />
                <h:commandLink action="#{benefit.createSetup}" value="New Benefit"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />


            </h:form>
        </body>
    </html>
</f:view>
