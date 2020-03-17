

<%@ page import="grails2.Camera" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'camera.label', default: 'Camera')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${cameraInstance}">
            <div class="errors">
                <g:renderErrors bean="${cameraInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="camera.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cameraInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${cameraInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="purchageDate"><g:message code="camera.purchageDate.label" default="Purchage Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cameraInstance, field: 'purchageDate', 'errors')}">
                                    <g:datePicker name="purchageDate" precision="day" value="${cameraInstance?.purchageDate}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="serial"><g:message code="camera.serial.label" default="Serial" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cameraInstance, field: 'serial', 'errors')}">
                                    <g:textField name="serial" value="${cameraInstance?.serial}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
