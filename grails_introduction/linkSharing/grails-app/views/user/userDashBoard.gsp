<%@ page import="com.ttnd.Topic; com.ttnd.User" %>
<%@ page import="co.TopicCO" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <asset:javascript src="application.js"/>
    <meta name="layout" content="dashboard">
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'bootstrap.min.css')}">
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'dashboard-look.css')}">
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'popupcss.css')}">
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'bootstrap-dialog.css')}">
    <style>
    .multi-columns-row .col-xs-6 {
        margin-bottom: 30px;
    }
    </style>
</head>

<body>

<script type="text/javascript">

</script>
<g:if test="${flash.message}">
    <script>showSuccess('${flash.message}')</script>

</g:if>

</body>
</html>
