
<%@ page import="grails2.Camera" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'camera.label', default: 'Camera')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'camera.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'camera.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="purchageDate" title="${message(code: 'camera.purchageDate.label', default: 'Purchage Date')}" />
                        
                            <g:sortableColumn property="serial" title="${message(code: 'camera.serial.label', default: 'Serial')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${cameraInstanceList}" status="i" var="cameraInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${cameraInstance.id}">${fieldValue(bean: cameraInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: cameraInstance, field: "name")}</td>
                        
                            <td><g:formatDate date="${cameraInstance.purchageDate}" /></td>
                        
                            <td>${fieldValue(bean: cameraInstance, field: "serial")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${cameraInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
