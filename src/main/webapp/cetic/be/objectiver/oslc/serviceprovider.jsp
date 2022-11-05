<%--To avoid the overriding of any manual code changes upon subsequent code generations, disable "Generate JSP Files" option in the Adaptor model.--%>
<!DOCTYPE html>
<%--
 Copyright (c) 2020 Contributors to the Eclipse Foundation
 
 See the NOTICE file(s) distributed with this work for additional
 information regarding copyright ownership.
 
 This program and the accompanying materials are made available under the
 terms of the Eclipse Distribution License 1.0 which is available at
 http://www.eclipse.org/org/documents/edl-v10.php.
 
 SPDX-License-Identifier: BSD-3-Simple

 This file is generated by Lyo Designer (https://www.eclipse.org/lyo/)
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.net.URI" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="org.eclipse.lyo.oslc4j.core.model.Service" %>
<%@ page import="org.eclipse.lyo.oslc4j.core.model.ServiceProvider" %>
<%@ page import="org.eclipse.lyo.oslc4j.core.model.Dialog" %>
<%@ page import="org.eclipse.lyo.oslc4j.core.model.CreationFactory" %>
<%@ page import="org.eclipse.lyo.oslc4j.core.model.ResourceShape" %>
<%@ page import="org.eclipse.lyo.oslc4j.core.model.QueryCapability" %>
<%@page import="javax.ws.rs.core.UriBuilder"%>
<%@page import="org.eclipse.lyo.oslc4j.core.OSLC4JUtils"%>

<%@ page contentType="text/html" language="java" pageEncoding="UTF-8" %>

<%
ServiceProvider serviceProvider = (ServiceProvider)request.getAttribute("serviceProvider");
Service[] services = (Service[])request.getAttribute("services");
String catalogUrl = UriBuilder.fromUri(OSLC4JUtils.getServletURI()).path("/catalog/singleton").build().toString();
%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><%= serviceProvider.getTitle() %></title>
    <link href="<c:url value="/static/css/bootstrap-4.0.0-beta.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/static/css/adaptor.css"/>" rel="stylesheet">

    <script src="<c:url value="/static/js/jquery-3.2.1.min.js"/>"></script>
    <script src="<c:url value="/static/js/popper-1.11.0.min.js"/>"></script>
    <script src="<c:url value="/static/js/bootstrap-4.0.0-beta.min.js"/>"></script>
</head>
<body>
  <nav class="navbar navbar-expand-lg sticky-top navbar-light bg-light">
    <div class="container">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item"><a class="nav-link" href="<c:url value="/"/>"><%= application.getServletContextName() %></a></li>
        <li class="nav-item"><a class="nav-link" href="<c:url value="<%= catalogUrl %>"/>">Service Provider Catalog</a></li>
        <li class="nav-item"><a class="nav-link" href="<c:url value="/swagger-ui/index.jsp"/>">Swagger UI</a></li>
      </ul>
    </div>
  </nav>

  <div class="container">
    <div class="page-header">
      <h1><%= serviceProvider.getTitle() %></h1>
      <p><%= serviceProvider.getDescription() %></p>


    </div>
    <%!
    String listResourceTypes(URI[] resourceTypes) {
        List<String> rs = new ArrayList<String>();
        for(URI resourceType : resourceTypes) {
            String[] split = resourceType.toString().split("[#/]+");
            String shortName = (split.length > 1) ? split[split.length -1] : resourceType.toString();
            rs.add("<a href=\"" + resourceType + "\">" + shortName + "</a>");
        }
        return String.join(", ", rs);
    }         
    %>
    <% if (services.length == 0) {%>
        <div class="alert alert-primary" role="alert">
            <h4 class="alert-heading">No OSLC Services Defined for this Service Provider!</h4>
            <hr>
            <p>
                Define some OSLC services for your Service Provider in your model. 
                Then re-generate to obtain access to these services.
            </p>
        </div>
    <% } %>
    <%for (int serviceIndex = 0; serviceIndex < services.length; serviceIndex++) {%>
    <% 
    URI domain = services[serviceIndex].getDomain();
    Dialog[] selectionDialogs = services[serviceIndex].getSelectionDialogs();
    Dialog[] creationDialogs = services[serviceIndex].getCreationDialogs();
    CreationFactory[] creationFactories = services[serviceIndex].getCreationFactories();
    QueryCapability[] queryCapabilities= services[serviceIndex].getQueryCapabilities();
    %>
    <h2>OSLC Service for Domain: <a href="<%=domain%>"><%=domain%></a></h2>
    <div class="container">
    <h3>Sample Clients</h3>
    <p>Use the code behind these sample pages (html, javascript) to build your own interactions with OSLC Delegated UIs.</p>
    <%
        for (int selectionDialogIndex = 0; selectionDialogIndex < selectionDialogs.length; selectionDialogIndex++) {
            String selectionDialog = selectionDialogs[selectionDialogIndex].getDialog().toString();
    %>
    <p><a href="<%=request.getContextPath()%>/cetic/be/objectiver/oslc/selectiondialogsampleclient.jsp?selectionUri=<%= URLEncoder.encode(selectionDialog.toString(), "UTF-8") %>">Sample Selector Dialog Client</a> For {<%= listResourceTypes(selectionDialogs[selectionDialogIndex].getResourceTypes()) %>}</p>
    <%}%>
    <%
        for (int creationDialogIndex = 0; creationDialogIndex < creationDialogs.length; creationDialogIndex++) {
            String creationDialog = creationDialogs[creationDialogIndex].getDialog().toString();
    %>
    <p><a href="<%=request.getContextPath()%>/cetic/be/objectiver/oslc/creationdialogsampleclient.jsp?creationUri=<%= URLEncoder.encode(creationDialog.toString(), "UTF-8") %>">Sample Creation Dialog Client</a> For {<%= listResourceTypes(creationDialogs[creationDialogIndex].getResourceTypes()) %>}</p>
    <%}%>
    </div>

    <div class="container">
    <h3>OSLC Capabilities</h3>
    <% if(selectionDialogs.length > 0) {%>
    <div class="container">
    <h4>Resource Selector Dialogs</h4>
    <%
        for (int selectionDialogIndex = 0; selectionDialogIndex < selectionDialogs.length; selectionDialogIndex++) {
            String selectionDialog = selectionDialogs[selectionDialogIndex].getDialog().toString();
    %>
    <p><a href="<%= selectionDialog %>">Selection Dialog</a> For {<%= listResourceTypes(selectionDialogs[selectionDialogIndex].getResourceTypes()) %>}</p>
    <%}%>
    </div>
    <%}%>
    <% if(creationDialogs.length > 0) {%>
    <div class="container">
    <h4>Resource Creator Dialogs</h4>
    <%
        for (int creationDialogIndex = 0; creationDialogIndex < creationDialogs.length; creationDialogIndex++) {
            String creationDialog = creationDialogs[creationDialogIndex].getDialog().toString();
    %>
    <p><a href="<%= creationDialog %>">Creation Dialog</a> For {<%= listResourceTypes(creationDialogs[creationDialogIndex].getResourceTypes()) %>}</p>
    <%}%>
    </div>
    <%}%>
    <% if(creationFactories.length > 0) {%>
    <div class="container">
    <h4>Resource Creation Factories</h4>
    <%
        for (int creationFactoryIndex = 0; creationFactoryIndex < creationFactories.length; creationFactoryIndex++) {
            String creationFactory = creationFactories[creationFactoryIndex].getCreation().toString();
    %>
    <p><a href="<%= creationFactory %>">Creation Factory</a> For {<%= listResourceTypes(creationFactories[creationFactoryIndex].getResourceTypes()) %>}</p>
    <%}%>
    </div>
    <%}%>
    <% if(queryCapabilities.length > 0) {%>
    <div class="container">
    <h4>Resource Query Capabilities</h4>
    <%
        for (int queryCapabilityIndex = 0; queryCapabilityIndex < queryCapabilities.length; queryCapabilityIndex++) {
            QueryCapability qc = queryCapabilities[queryCapabilityIndex];
            String queryCapability = qc.getQueryBase().toString();
    %>
    <p><a href="<%= queryCapability %>">Query Capability</a> For {<%= listResourceTypes(queryCapabilities[queryCapabilityIndex].getResourceTypes()) %>}</p>
    <%}%>
    </div>
    <%}%>
    <% if(creationFactories.length > 0) {%>
    <div class="container">
    <h4>Creation Resource Shapes</h4>
    <%
        for (int creationFactoryIndex = 0; creationFactoryIndex < creationFactories.length; creationFactoryIndex++) {
            URI[] creationShapes = creationFactories[creationFactoryIndex].getResourceShapes();
            String creationShape = creationShapes[0].toString();
    %>
    <p><a href="<%= creationShape %>"><%= creationShape %></a></p>
    <%}%>
    </div>
    <%}%>
    <% if(queryCapabilities.length > 0) {%>
    <div class="container">
    <h4>Query Resource Shapes</h4>
    <%
        for (int queryCapabilityIndex = 0; queryCapabilityIndex < queryCapabilities.length; queryCapabilityIndex++) {
            String queryShape = queryCapabilities[queryCapabilityIndex].getResourceShape().toString();
    %>
    <p><a href="<%= queryShape %>"><%= queryShape %></a></p>
    <%}%>
    </div>
    <%}%>

    <c:if test="<%=serviceIndex + 1 < services.length%>">
      <hr>
    </c:if>
    <%}%>
  </div>
  <footer class="footer">
    <div class="container">
      <p class="text-muted">
        OSLC Adaptor was generated using <a href="http://eclipse.org/lyo">Eclipse Lyo</a>.
      </p>
    </div>
  </footer>
</body>
</html>
