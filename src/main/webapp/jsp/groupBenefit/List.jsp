<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing GroupBenefit Items</title>
            <link rel="stylesheet" type="text/css" href="/pimentoMVC/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Listing GroupBenefit Items</h1>
            <h:form styleClass="jsfcrud_list_form">
                <h:outputText escape="false" value="(No GroupBenefit Items Found)<br />" rendered="#{groupBenefit.pagingInfo.itemCount == 0}" />
                <h:panelGroup rendered="#{groupBenefit.pagingInfo.itemCount > 0}">
                    <h:outputText value="Item #{groupBenefit.pagingInfo.firstItem + 1}..#{groupBenefit.pagingInfo.lastItem} of #{groupBenefit.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{groupBenefit.prev}" value="Previous #{groupBenefit.pagingInfo.batchSize}" rendered="#{groupBenefit.pagingInfo.firstItem >= groupBenefit.pagingInfo.batchSize}"/>&nbsp;
                    <h:commandLink action="#{groupBenefit.next}" value="Next #{groupBenefit.pagingInfo.batchSize}" rendered="#{groupBenefit.pagingInfo.lastItem + groupBenefit.pagingInfo.batchSize <= groupBenefit.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{groupBenefit.next}" value="Remaining #{groupBenefit.pagingInfo.itemCount - groupBenefit.pagingInfo.lastItem}"
                                   rendered="#{groupBenefit.pagingInfo.lastItem < groupBenefit.pagingInfo.itemCount && groupBenefit.pagingInfo.lastItem + groupBenefit.pagingInfo.batchSize > groupBenefit.pagingInfo.itemCount}"/>
                    <h:dataTable value="#{groupBenefit.groupBenefitItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
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
                                <f:param name="jsfcrud.currentGroupBenefit" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][groupBenefit.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{groupBenefit.editSetup}">
                                <f:param name="jsfcrud.currentGroupBenefit" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][groupBenefit.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{groupBenefit.remove}">
                                <f:param name="jsfcrud.currentGroupBenefit" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][groupBenefit.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                        </h:column>

                    </h:dataTable>
                </h:panelGroup>
                <br />
                <h:commandLink action="#{groupBenefit.createSetup}" value="New GroupBenefit"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />


            </h:form>
        </body>
    </html>
</f:view>
