<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Groups Detail</title>
            <link rel="stylesheet" type="text/css" href="/pimentoMVC/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Groups Detail</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="GroupId:"/>
                    <h:outputText value="#{groups.groups.groupId}" title="GroupId" />
                    <h:outputText value="Broker:"/>
                    <h:panelGroup>
                        <h:outputText value="#{groups.groups.broker}"/>
                        <h:panelGroup rendered="#{groups.groups.broker != null}">
                            <h:outputText value=" ("/>
                            <h:commandLink value="Show" action="#{broker.detailSetup}">
                                <f:param name="jsfcrud.currentGroups" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][groups.groups][groups.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentBroker" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][groups.groups.broker][broker.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="groups"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.perficient.pimentomvc.GroupsController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{broker.editSetup}">
                                <f:param name="jsfcrud.currentGroups" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][groups.groups][groups.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentBroker" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][groups.groups.broker][broker.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="groups"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.perficient.pimentomvc.GroupsController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{broker.destroy}">
                                <f:param name="jsfcrud.currentGroups" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][groups.groups][groups.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentBroker" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][groups.groups.broker][broker.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="groups"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.perficient.pimentomvc.GroupsController"/>
                            </h:commandLink>
                            <h:outputText value=" )"/>
                        </h:panelGroup>
                    </h:panelGroup>
                    <h:outputText value="GroupName:"/>
                    <h:outputText value="#{groups.groups.groupName}" title="GroupName" />

                    <h:outputText value="GroupBenefits:" />
                    <h:panelGroup>
                        <h:outputText rendered="#{empty groups.groups.groupBenefits}" value="(No Items)"/>
                        <h:dataTable value="#{groups.groups.jsfcrud_transform[jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method.setToList][jsfcrud_null].groupBenefits}" var="item" 
                                     border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                     rendered="#{not empty groups.groups.groupBenefits}">
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
                                    <f:param name="jsfcrud.currentGroups" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][groups.groups][groups.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentGroupBenefit" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][groupBenefit.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="groups" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.perficient.pimentomvc.GroupsController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Edit" action="#{groupBenefit.editSetup}">
                                    <f:param name="jsfcrud.currentGroups" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][groups.groups][groups.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentGroupBenefit" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][groupBenefit.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="groups" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.perficient.pimentomvc.GroupsController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Destroy" action="#{groupBenefit.destroy}">
                                    <f:param name="jsfcrud.currentGroups" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][groups.groups][groups.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentGroupBenefit" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][groupBenefit.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="groups" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.perficient.pimentomvc.GroupsController" />
                                </h:commandLink>
                            </h:column>
                        </h:dataTable>
                    </h:panelGroup>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{groups.remove}" value="Destroy">
                    <f:param name="jsfcrud.currentGroups" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][groups.groups][groups.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{groups.editSetup}" value="Edit">
                    <f:param name="jsfcrud.currentGroups" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][groups.groups][groups.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <h:commandLink action="#{groups.createSetup}" value="New Groups" />
                <br />
                <h:commandLink action="#{groups.listSetup}" value="Show All Groups Items"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
