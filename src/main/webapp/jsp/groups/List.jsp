<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing Groups Items</title>
            <link rel="stylesheet" type="text/css" href="/pimentoMVC/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Listing Groups Items</h1>
            <h:form styleClass="jsfcrud_list_form">
                <h:outputText escape="false" value="(No Groups Items Found)<br />" rendered="#{groups.pagingInfo.itemCount == 0}" />
                <h:panelGroup rendered="#{groups.pagingInfo.itemCount > 0}">
                    <h:outputText value="Item #{groups.pagingInfo.firstItem + 1}..#{groups.pagingInfo.lastItem} of #{groups.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{groups.prev}" value="Previous #{groups.pagingInfo.batchSize}" rendered="#{groups.pagingInfo.firstItem >= groups.pagingInfo.batchSize}"/>&nbsp;
                    <h:commandLink action="#{groups.next}" value="Next #{groups.pagingInfo.batchSize}" rendered="#{groups.pagingInfo.lastItem + groups.pagingInfo.batchSize <= groups.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{groups.next}" value="Remaining #{groups.pagingInfo.itemCount - groups.pagingInfo.lastItem}"
                                   rendered="#{groups.pagingInfo.lastItem < groups.pagingInfo.itemCount && groups.pagingInfo.lastItem + groups.pagingInfo.batchSize > groups.pagingInfo.itemCount}"/>
                    <h:dataTable value="#{groups.groupsItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="GroupId"/>
                            </f:facet>
                            <h:outputText value="#{item.groupId}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Broker"/>
                            </f:facet>
                            <h:outputText value="#{item.broker}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="GroupName"/>
                            </f:facet>
                            <h:outputText value="#{item.groupName}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText escape="false" value="&nbsp;"/>
                            </f:facet>
                            <h:commandLink value="Show" action="#{groups.detailSetup}">
                                <f:param name="jsfcrud.currentGroups" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][groups.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{groups.editSetup}">
                                <f:param name="jsfcrud.currentGroups" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][groups.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{groups.remove}">
                                <f:param name="jsfcrud.currentGroups" value="#{jsfcrud_class['com.perficient.pimentomvc.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][groups.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                        </h:column>

                    </h:dataTable>
                </h:panelGroup>
                <br />
                <h:commandLink action="#{groups.createSetup}" value="New Groups"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />


            </h:form>
        </body>
    </html>
</f:view>
