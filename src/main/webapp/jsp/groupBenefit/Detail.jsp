<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>GroupBenefit Detail</title>
            <link rel="stylesheet" type="text/css" href="/pimentoMVC/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>GroupBenefit Detail</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="GroupBenefitId:"/>
                    <h:outputText value="#{groupBenefit.groupBenefit.groupBenefitId}" title="GroupBenefitId" />
                    <h:outputText value="Groups:"/>
                    <h:panelGroup>
                        <h:outputText value="#{groupBenefit.groupBenefit.groups}"/>
                        <h:panelGroup rendered="#{groupBenefit.groupBenefit.groups != null}">
                            <h:outputText value=" ("/>
                            <h:commandLink value="Show" action="#{groups.detailSetup}">
                                <f:param name="jsfcrud.currentGroupBenefit" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][groupBenefit.groupBenefit][groupBenefit.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentGroups" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][groupBenefit.groupBenefit.groups][groups.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="groupBenefit"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.perficient.pimentomvc.GroupBenefitController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{groups.editSetup}">
                                <f:param name="jsfcrud.currentGroupBenefit" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][groupBenefit.groupBenefit][groupBenefit.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentGroups" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][groupBenefit.groupBenefit.groups][groups.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="groupBenefit"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.perficient.pimentomvc.GroupBenefitController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{groups.destroy}">
                                <f:param name="jsfcrud.currentGroupBenefit" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][groupBenefit.groupBenefit][groupBenefit.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentGroups" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][groupBenefit.groupBenefit.groups][groups.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="groupBenefit"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.perficient.pimentomvc.GroupBenefitController"/>
                            </h:commandLink>
                            <h:outputText value=" )"/>
                        </h:panelGroup>
                    </h:panelGroup>
                    <h:outputText value="Benefit:"/>
                    <h:panelGroup>
                        <h:outputText value="#{groupBenefit.groupBenefit.benefit}"/>
                        <h:panelGroup rendered="#{groupBenefit.groupBenefit.benefit != null}">
                            <h:outputText value=" ("/>
                            <h:commandLink value="Show" action="#{benefit.detailSetup}">
                                <f:param name="jsfcrud.currentGroupBenefit" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][groupBenefit.groupBenefit][groupBenefit.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentBenefit" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][groupBenefit.groupBenefit.benefit][benefit.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="groupBenefit"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.perficient.pimentomvc.GroupBenefitController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{benefit.editSetup}">
                                <f:param name="jsfcrud.currentGroupBenefit" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][groupBenefit.groupBenefit][groupBenefit.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentBenefit" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][groupBenefit.groupBenefit.benefit][benefit.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="groupBenefit"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.perficient.pimentomvc.GroupBenefitController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{benefit.destroy}">
                                <f:param name="jsfcrud.currentGroupBenefit" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][groupBenefit.groupBenefit][groupBenefit.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentBenefit" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][groupBenefit.groupBenefit.benefit][benefit.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="groupBenefit"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.perficient.pimentomvc.GroupBenefitController"/>
                            </h:commandLink>
                            <h:outputText value=" )"/>
                        </h:panelGroup>
                    </h:panelGroup>


                </h:panelGrid>
                <br />
                <h:commandLink action="#{groupBenefit.remove}" value="Destroy">
                    <f:param name="jsfcrud.currentGroupBenefit" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][groupBenefit.groupBenefit][groupBenefit.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{groupBenefit.editSetup}" value="Edit">
                    <f:param name="jsfcrud.currentGroupBenefit" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][groupBenefit.groupBenefit][groupBenefit.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <h:commandLink action="#{groupBenefit.createSetup}" value="New GroupBenefit" />
                <br />
                <h:commandLink action="#{groupBenefit.listSetup}" value="Show All GroupBenefit Items"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
