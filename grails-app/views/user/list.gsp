<%@ page import="au.org.ala.userdetails.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="${grailsApplication.config.skin.layout}">
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>

<g:render template="/layouts/header" />
<div class="container" id="main">
<a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                           default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><a href="${createLink(controller:'admin', action:'index')}"><i class="icon-wrench"></i>&nbsp;<g:message code="admin.bulkLoadUsers.administration" /></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-user" class="content scaffold-list" role="main">

    <div class="row-fluid">
        <div class="span6">
            <h1><g:message code="default.list.label" args="[entityName]"/></h1>
        </div>
        <div class="span6">
            <g:form action="list" controller="user" method="get">
                <div class="input-append pull-right">
                    <input type="text" class="input-xlarge" name="q" value="${q?:''}" placeholder="${message(code:"user.list.search_for_user")}"/>
                    <input type="submit" class="btn"/>
                </div>
            </g:form>
        </div>
    </div>


    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>
            <g:sortableColumn property="id" title="${message(code: 'user.id.label', default: 'ID')}"/>

            <g:sortableColumn property="email" title="${message(code: 'user.email.label', default: 'Email')}"/>

            <g:sortableColumn property="firstName"
                              title="${message(code: 'user.firstName.label', default: 'First Name')}"/>

            <g:sortableColumn property="lastName"
                              title="${message(code: 'user.lastName.label', default: 'Last Name')}"/>

            <g:sortableColumn property="activated"
                              title="${message(code: 'user.activated.label', default: 'Activated')}"/>

            <g:sortableColumn property="locked" title="${message(code: 'user.locked.label', default: 'Locked')}"/>

            <g:sortableColumn property="created" title="${message(code: 'user.created.label', default: 'Created')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${userInstanceList}" status="i" var="userInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${userInstance.id}">${userInstance.id}</g:link></td>

                <td><g:link action="show"
                            id="${userInstance.id}">${fieldValue(bean: userInstance, field: "email")}</g:link></td>

                <td>${fieldValue(bean: userInstance, field: "firstName")}</td>

                <td>${fieldValue(bean: userInstance, field: "lastName")}</td>

                <td><g:formatBoolean boolean="${userInstance.activated}"/></td>

                <td><g:formatBoolean boolean="${userInstance.locked}"/></td>

                <td>${fieldValue(bean: userInstance, field: "created")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <g:if test="${!q}">
    <div class="pagination">
        <g:paginate total="${userInstanceTotal}" params="[q:q]"/>
    </div>
    </g:if>
</div>
</div>
</body>
</html>
