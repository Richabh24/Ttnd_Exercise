

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
<h1>Link sharing - Topic Invitation</h1>
<a href="${link}"><input type="button" value="View"></a>
<g:link controller="topic" action="subscribeForAnyUser"
        params="[topic: topic,user: user.id]" base="${acceptlink}"><input type="button" value="Accept"></g:link>

%{--
<g:link><input type="button" value="Reject"></g:link>
--}%

</body>
</html>